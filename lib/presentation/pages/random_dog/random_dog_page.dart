import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/dog/dog_cubit.dart';
import 'package:learning_app/domain/entities/dog.dart';
import 'package:learning_app/injection_container.dart';
import 'package:video_player/video_player.dart';

class RandomDogPage extends StatefulWidget {
  @override
  _RandomDogPageState createState() => _RandomDogPageState();
}

class _RandomDogPageState extends State<RandomDogPage> {
  late final DogCubit dogCubit;

  @override
  void initState() {
    dogCubit = sl<DogCubit>();

    dogCubit.getRandomDog();

    super.initState();
  }

  @override
  void dispose() {
    dogCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random dog"),
        actions: [
          BlocBuilder<DogCubit, DogState>(
            bloc: dogCubit,
            builder: (_, state) {
              return IconButton(
                icon: Icon(Icons.update),
                onPressed: () {
                  dogCubit.getRandomDog();
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<DogCubit, DogState>(
          bloc: dogCubit,
          builder: (_, state) {
            if (state is DogLoading) {
              return CircularProgressIndicator();
            } else if (state is DogError) {
              return Text(state.message);
            } else if (state is DogImageLoaded) {
              return Image.network(state.dog.url);
            } else if (state is DogVideoLoaded) {
              return DogVideoPlayer(dog: state.dog);
            }

            return Container();
          },
        ),
      ),
    );
  }
}

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
      ..play();
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
