part of 'meme_detail_bloc.dart';

class MemeDetailState {
  final bool isLoading;
  final bool showProgressLoader;
  final bool dismissProgressLoader;
  final bool navigateToGeneratedMemePage;
  final List<XFile> addedImages;
  final List<String> addedTexts;
  final bool globalIsFocused;
  final bool showTextField;
  final String? inputtedText;
  final File? generatedMeme;

  MemeDetailState({
    this.isLoading = false,
    this.showProgressLoader = false,
    this.dismissProgressLoader = false,
    this.navigateToGeneratedMemePage = false,
    this.addedImages = const [],
    this.addedTexts = const [],
    this.globalIsFocused = false,
    this.showTextField = false,
    this.inputtedText,
    this.generatedMeme,
  });

  factory MemeDetailState.initial() {
    return MemeDetailState(
      addedImages: [],
      addedTexts: [],
    );
  }

  MemeDetailState update({
    bool? isLoading,
    bool? showProgressLoader,
    bool? dismissProgressLoader,
    bool? navigateToGeneratedMemePage,
    List<XFile>? addedImages,
    List<String>? addedTexts,
    bool? globalIsFocused,
    bool? showTextField,
    String? inputtedText,
    File? generatedMeme,
  }) {
    return MemeDetailState(
      isLoading: isLoading ?? this.isLoading,
      showProgressLoader: showProgressLoader ?? false,
      dismissProgressLoader: dismissProgressLoader ?? false,
      navigateToGeneratedMemePage: navigateToGeneratedMemePage ?? false,
      addedImages: addedImages ?? this.addedImages,
      addedTexts: addedTexts ?? this.addedTexts,
      globalIsFocused: globalIsFocused ?? this.globalIsFocused,
      showTextField: showTextField ?? this.showTextField,
      inputtedText: inputtedText ?? this.inputtedText,
      generatedMeme: generatedMeme ?? this.generatedMeme,
    );
  }
}
