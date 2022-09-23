part of 'memes_bloc.dart';

class MemesState {
  final bool isLoading;
  final bool showProgressLoader;
  final bool dismissProgressLoader;
  final List<MemeModel> memes;

  MemesState({
    this.isLoading = false,
    this.showProgressLoader = false,
    this.dismissProgressLoader = false,
    this.memes = const [],
  });

  // factory MemesState.initial() {
  //   return MemesState(
  //   );
  // }

  MemesState update({
    bool? isLoading,
    bool? showProgressLoader,
    bool? dismissProgressLoader,
    List<MemeModel>? memes,
  }) {
    return MemesState(
      isLoading: isLoading ?? this.isLoading,
      showProgressLoader: showProgressLoader ?? false,
      dismissProgressLoader: dismissProgressLoader ?? false,
        memes: memes ?? this.memes,
    );
  }
}