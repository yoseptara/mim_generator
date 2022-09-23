import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:simple_image_app/components/resizable_widget.dart';
import 'package:simple_image_app/models/meme_model.dart';
import 'package:simple_image_app/pages/meme_detail/generated_meme_page.dart';
import 'package:simple_image_app/pages/meme_detail/meme_detail_bloc.dart';

class MemeDetailPage extends StatelessWidget {
  static const route = '/meme_detail_page';

  final MemeModel meme;

  const MemeDetailPage({
    Key? key,
    required this.meme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width - 30;
    return BlocProvider<MemeDetailBloc>(
      create: (_) => MemeDetailBloc(),
      child: _MemeDetailView(meme: meme),
    );
  }
}

class _MemeDetailView extends StatelessWidget {
  const _MemeDetailView({
    Key? key,
    required this.meme,
  }) : super(key: key);

  final MemeModel meme;

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    return BlocConsumer<MemeDetailBloc, MemeDetailState>(
      listener: (context, state) {
        if (state.navigateToGeneratedMemePage && state.generatedMeme != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GeneratedMemePage(
                generatedMeme: state.generatedMeme!,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return LoaderOverlay(
          child: GestureDetector(
            onTap: () {
              context.read<MemeDetailBloc>().add(
                    UpdateMemeDetailState(globalIsFocused: false),
                  );
            },
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
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: _MemeImgBuilder(
                        meme: meme,
                        globalKey: globalKey,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                context.read<MemeDetailBloc>().add(
                                      AddImage(),
                                    );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Add Logo',
                                      style: GoogleFonts.mulish(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    const Icon(
                                      Icons.image_outlined,
                                      size: 24,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                        if (state.showTextField)
                          const Expanded(child: _AddTextInput())
                        else
                          const _AddTextBtn(),
                        // const Spacer(),

                      ],
                    ),
                    const SizedBox(height: 16,),
                    InkWell(
                      onTap: () {
                        context.read<MemeDetailBloc>().add(
                          GenerateImage(
                            context: context,
                            globalKey: globalKey,
                            meme: meme,
                          ),
                        );
                      },
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
                        decoration: const BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Generate Image',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AddTextInput extends StatelessWidget {
  const _AddTextInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Text',
        contentPadding: const EdgeInsets.all(8),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        suffix: InkWell(
          onTap: () {
            context.read<MemeDetailBloc>().add(
                  AddInputtedText(),
                );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.lightGreenAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Text(
              'Add',
              style: GoogleFonts.mulish(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      onChanged: (val) {
        context.read<MemeDetailBloc>().add(
              UpdateMemeDetailState(inputtedText: val),
            );
      },
    );
  }
}

class _AddTextBtn extends StatelessWidget {
  const _AddTextBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<MemeDetailBloc>().add(
              UpdateMemeDetailState(
                showTextField: true,
              ),
            );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Text',
              style: GoogleFonts.mulish(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            // const SizedBox(
            //   height: 4,
            // ),
            Text(
              'T',
              style: GoogleFonts.mulish(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MemeImgBuilder extends StatelessWidget {
  const _MemeImgBuilder({
    Key? key,
    required this.meme,
    required this.globalKey,
  }) : super(key: key);

  final MemeModel meme;
  final GlobalKey globalKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemeDetailBloc, MemeDetailState>(
      builder: (context, state) {
        final url = meme.url;
        return RepaintBoundary(
          key: globalKey,
          child: Stack(
            children: [
              url == null
                  ? const Icon(
                      Icons.image_outlined,
                      size: double.maxFinite,
                      color: Colors.grey,
                    )
                  : Image.network(
                      url,
                      width: double.maxFinite,
                      height: double.maxFinite,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, widget, loadingProgress) {
                        if (loadingProgress == null) return widget;
                        return Center(
                          child: CircularProgressIndicator(
                            // color: Colors.black,
                            strokeWidth: 2,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
              ...List<Widget>.generate(
                state.addedImages.length,
                (index) => ResizableWidget(
                  isFocused: state.globalIsFocused,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.file(
                      File(
                        state.addedImages[index].path,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ...List<Widget>.generate(
                state.addedTexts.length,
                (index) => ResizableWidget(
                  isFocused: state.globalIsFocused,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      state.addedTexts[index],
                      style: GoogleFonts.mulish(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
