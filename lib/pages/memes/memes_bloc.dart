import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_image_app/models/meme_model.dart';
import 'package:simple_image_app/repositories/meme_repository.dart';

part 'memes_event.dart';

part 'memes_state.dart';

class MemesBloc extends Bloc<MemesEvent, MemesState> {
  final MemeRepository memeRepo;

  MemesBloc(this.memeRepo)
      : super(
          MemesState(),
        ) {
    on<GetMemes>(_onGetMemes);
  }

  Future<void> _onGetMemes(
    GetMemes event,
    Emitter<MemesState> emit,
  ) async {
    try {
      emit(
        state.update(
          isLoading: true,
        ),
      );
      final result = await memeRepo.getMemes();
      emit(
        state.update(
          memes: result,
        ),
      );
    } catch (exception, stackTrace) {
      debugPrint(exception.toString());
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      // await Future.delayed(Duration(milliseconds: 100,),);
      emit(
        state.update(
          isLoading: false,
        ),
      );
    }
  }
}
