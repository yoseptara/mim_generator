import 'dart:io';
import 'dart:typed_data';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';
import 'package:simple_image_app/models/meme_model.dart';

part 'meme_detail_event.dart';

part 'meme_detail_state.dart';

class MemeDetailBloc extends Bloc<MemeDetailEvent, MemeDetailState> {
  MemeDetailBloc()
      : super(
          MemeDetailState(),
        ) {
    on<AddImage>(
      _onAddImage,
      transformer: concurrent(),
    );
    on<UpdateMemeDetailState>(
      _onUpdateMemeDetailState,
      transformer: concurrent(),
    );
    on<AddInputtedText>(
      _onAddInputtedText,
      transformer: concurrent(),
    );
    on<GenerateImage>(_onGenerateImage);
  }

  Future<void> _onGenerateImage(
    GenerateImage event,
    Emitter<MemeDetailState> emit,
  ) async {
    try {
      // print('generateImage event triggered');
      event.context.loaderOverlay.show();

      // try {
      final RenderRepaintBoundary boundary =
          event.globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
      // if (boundary != null) {
      final ui.Image image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        File generatedMeme = await saveImage(
          byteData,
          event.meme.name ?? '',
        );
        // Share.shareFiles(
        //   [generatedMeme.path],
        //   text: 'share_referral_code_desc_text'.tr(
        //     args: [referralUrl, referralCode],
        //   ),
        // );
        emit(
          state.update(
            generatedMeme: generatedMeme,
            navigateToGeneratedMemePage: true,
          ),
        );
      }

      // }
      // ByteData? qrBytes = await QrPainter(
      //   data: referralCode,
      //   gapless: true,
      //   version: QrVersions.auto,
      //   emptyColor: Colors.white,
      // ).toImageData(4096);

      //save the orignal image
      // if (qrBytes != null) {
      //   File generatedMeme = await saveImage(qrBytes, referralCode);
      //   Share.shareFiles([generatedMeme.path], text: referralCode);
      // }
      // } catch (exception, stackTrace) {
      // handleError(exception, stackTrace);
      //   // throw e;
      // }

    } catch (exception, stackTrace) {
      debugPrintStack(
        stackTrace: stackTrace,
        label: exception.toString(),
      );
    } finally {
      // await Future.delayed(Duration(milliseconds: 100,),);
      event.context.loaderOverlay.hide();
    }
  }

  Future<void> _onAddInputtedText(
    AddInputtedText event,
    Emitter<MemeDetailState> emit,
  ) async {
    emit(
      state.update(
        addedTexts: [
          ...state.addedTexts,
          state.inputtedText ?? '',
        ],
        showTextField: false,
      ),
    );
  }

  Future<void> _onUpdateMemeDetailState(
    UpdateMemeDetailState event,
    Emitter<MemeDetailState> emit,
  ) async {
    emit(
      state.update(
        addedTexts: event.addedTexts,
        globalIsFocused: event.globalIsFocused,
        showTextField: event.showTextField,
        inputtedText: event.inputtedText,
      ),
    );
  }

  Future<void> _onAddImage(
    AddImage event,
    Emitter<MemeDetailState> emit,
  ) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        emit(
          state.update(
            addedImages: [
              ...state.addedImages,
              pickedImage,
            ],
          ),
        );
      }
    } catch (exception, stackTrace) {
      debugPrintStack(
        stackTrace: stackTrace,
        label: exception.toString(),
      );
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> saveImage(ByteData data, String name) async {
    //retrieve local path for device
    var path = await _localPath; //<-- see below function
    final imagePath = '$path/$name.png';
    final buffer = data.buffer;
    final File file = await File(imagePath).writeAsBytes(
      buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
    );
    await FileImage(file).evict();
    return file;
  }
}
