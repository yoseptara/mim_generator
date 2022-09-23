part of 'meme_detail_bloc.dart';

abstract class MemeDetailEvent {}

class AddImage extends MemeDetailEvent {}

class AddInputtedText extends MemeDetailEvent {}

class GenerateImage extends MemeDetailEvent {
  final BuildContext context;
  final GlobalKey globalKey;
  final MemeModel meme;

  GenerateImage({
    required this.context,
   required  this.globalKey,
    required this.meme,
  });
}

class UpdateMemeDetailState extends MemeDetailEvent {
  final List<String>? addedTexts;
  final bool? globalIsFocused;
  final bool? showTextField;
  final String? inputtedText;

  UpdateMemeDetailState({
    this.addedTexts,
    this.globalIsFocused,
    this.showTextField,
    this.inputtedText,
  });
}
