import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/presentation/core/utils/mixin/handle_image.dart';
import 'package:learning_app/presentation/core/utils/mixin/handle_video.dart';

part 'media_state.dart';

class MediaCubit extends Cubit<MediaState> with HandleImage, HandleVideo {
  MediaCubit() : super(MediaInitial());

  Future<void> getImage(BuildContext context) async {
    final result = await imagePickerDialog(context);

    if (result != null) {
      emit(ImageLoaded(file: result));
    }
  }

  Future<void> getVideo(BuildContext context) async {
    final result = await videoPickerDialog(context);

    if (result != null) {
      emit(VideoLoaded(file: result));
    }
  }
}
