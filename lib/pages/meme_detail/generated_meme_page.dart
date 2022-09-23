import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:loader_overlay/loader_overlay.dart';

class GeneratedMemePage extends StatelessWidget {
  final File generatedMeme;

  const GeneratedMemePage({
    Key? key,
    required this.generatedMeme,
  }) : super(key: key);

  void saveToGallery(BuildContext context) async {
    context.loaderOverlay.show();
    final directory = await getTemporaryDirectory();
    img.Image? image = img.decodeImage(generatedMeme.readAsBytesSync());
    if (image != null) {
      final myImagePath = directory.path;
      // final myImgDir =  await Directory(myImagePath).create();
      final newFile = File('$myImagePath/new_meme_${const Uuid().v4()}.jpg');
      newFile.writeAsBytesSync(
        img.encodeJpg(image, quality: 100),
      );
      await ImageGallerySaver.saveFile(newFile.path);
      // var listOfFiles = await myImgDir.list(recursive: true).toList();
      // var count = listOfFiles.length;
      // print('cek new folder count : $count');
    }
    final dialog = AwesomeDialog(
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: 'Sukses',
      desc: 'Gambar berhasil disimpan!',
      btnOkOnPress: () {},
    );

    context.loaderOverlay.hide();
    dialog.show();
  }

  void share(BuildContext context) async {
    context.loaderOverlay.show();
    await Share.shareFiles(
      [
        generatedMeme.path,
      ],
    );
    context.loaderOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'MimGenerator',
            style: GoogleFonts.mulish(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Image.file(
                generatedMeme,
                width: double.maxFinite,
                height: double.maxFinite,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        var status = await Permission.storage.request();
                        if (status.isDenied) {
                          return;
                        }
                        if (status.isPermanentlyDenied) {
                          openAppSettings();
                          return;
                        }
                        saveToGallery(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
                        decoration: const BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Simpan',
                          style: GoogleFonts.mulish(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        share(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
                        decoration: const BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Share',
                          style: GoogleFonts.mulish(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
