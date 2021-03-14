part of 'media_cubit.dart';

abstract class MediaState extends Equatable {
  const MediaState();

  @override
  List<Object> get props => [];
}

class MediaInitial extends MediaState {}

class MediaLoaded extends MediaState {
  final File file;

  MediaLoaded({required this.file});

  @override
  List<Object> get props => [file];
}

class ImageLoaded extends MediaLoaded {
  ImageLoaded({required File file}) : super(file: file);
}

class VideoLoaded extends MediaLoaded {
  VideoLoaded({required File file}) : super(file: file);
}
