import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/dog/dog_cubit.dart';
import 'package:learning_app/injection_container.dart';
import 'package:learning_app/presentation/pages/random_dog/widgets/dog_video_player.dart';

class RandomDogPage extends StatefulWidget {
  @override
  _RandomDogPageState createState() => _RandomDogPageState();
}

class _RandomDogPageState extends State<RandomDogPage> {
  late final DogCubit cubit;

  @override
  void initState() {
    cubit = sl<DogCubit>()..getRandomDog();

    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random dog"),
        actions: [
          BlocBuilder<DogCubit, DogState>(
            bloc: cubit,
            builder: (_, state) {
              return IconButton(
                icon: Icon(Icons.update),
                onPressed: () {
                  cubit.getRandomDog();
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<DogCubit, DogState>(
          bloc: cubit,
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
