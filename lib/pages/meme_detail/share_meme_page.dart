import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShareMemePage extends StatelessWidget {
  final File generatedMeme;
  const ShareMemePage({Key? key, required this.generatedMeme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          InkWell(
            onTap: () {
              // FlutterShareMe().shareToFacebook(msg: msg)
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
                'Share to Facebook',
                style: GoogleFonts.mulish(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {},
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
                'Share to Twitter',
                style: GoogleFonts.mulish(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
