import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/media/media_cubit.dart';
import 'package:learning_app/injection_container.dart';
import 'package:learning_app/presentation/pages/media/widgets/media_video_player.dart';

class MediaPage extends StatefulWidget {
  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Media picker"),
      ),
      body: BlocProvider<MediaCubit>(
        create: (_) => sl<MediaCubit>(),
        child: BlocBuilder<MediaCubit, MediaState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    title: ElevatedButton(
                      child: Text("Choose image"),
                      onPressed: () async {
                        BlocProvider.of<MediaCubit>(context).getImage(context);
                      },
                    ),
                  ),
                  ListTile(
                    title: ElevatedButton(
                      child: Text("Choose video"),
                      onPressed: () async {
                        BlocProvider.of<MediaCubit>(context).getVideo(context);
                      },
                    ),
                  ),
                  SizedBox(height: 32),
                  _getMedia(state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _getMedia(MediaState state) {
    if (state is ImageLoaded) {
      return Image.file(state.file);
    }
    if (state is VideoLoaded) {
      return MediaVideoPlayer(file: state.file);
    }

    return Container();
  }
}
