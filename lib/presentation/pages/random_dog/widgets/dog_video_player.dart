import 'package:flutter/material.dart';
import 'package:learning_app/domain/entities/dog.dart';
import 'package:video_player/video_player.dart';

class DogVideoPlayer extends StatefulWidget {
  final Dog dog;

  const DogVideoPlayer({Key? key, required this.dog}) : super(key: key);

  @override
  _DogVideoPlayerState createState() => _DogVideoPlayerState();
}

class _DogVideoPlayerState extends State<DogVideoPlayer> {
  late final VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.network(widget.dog.url)
      ..initialize()
      ..play()
      ..setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller),
    );
  }
}
