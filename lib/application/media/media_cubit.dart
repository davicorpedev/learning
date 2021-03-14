import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/domain/core/utils/media/image_handler.dart';
import 'package:learning_app/domain/core/utils/media/video_handler.dart';

part 'media_state.dart';

class MediaCubit extends Cubit<MediaState> {
  final ImageHandler imageHandler;
  final VideoHandler videoHandler;

  MediaCubit({required this.imageHandler, required this.videoHandler})
      : super(MediaInitial());

  Future<void> getImage(BuildContext context) async {
    final result = await imageHandler.showPickerDialog(context);

    if (result != null) {
      emit(ImageLoaded(file: result));
    }
  }

  Future<void> getVideo(BuildContext context) async {
    final result = await videoHandler.showPickerDialog(context);

    if (result != null) {
      emit(VideoLoaded(file: result));
    }
  }
}
