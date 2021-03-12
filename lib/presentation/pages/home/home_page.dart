import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/auth/auth_cubit.dart';
import 'package:learning_app/presentation/pages/routes/route_page.dart';
import 'package:learning_app/presentation/routes/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Examples")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(
              title: ElevatedButton(
                child: Text("Provider"),
                onPressed: () {
                  Navigator.pushNamed(context, providerPageRoute);
                },
              ),
            ),
            ListTile(
              title: ElevatedButton(
                child: Text("Stream"),
                onPressed: () {
                  Navigator.pushNamed(context, streamPageRoute);
                },
              ),
            ),
            ListTile(
              title: ElevatedButton(
                child: Text("Animation"),
                onPressed: () {
                  Navigator.pushNamed(context, animationPageRoute);
                },
              ),
            ),
            ListTile(
              title: ElevatedButton(
                child: Text("Route"),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    routePageRoute,
                    arguments: RoutePageArguments(
                      title: "Title passed by parameter",
                      body: "Body passed by parameter",
                    ),
                  );
                },
              ),
            ),
            ListTile(
              title: ElevatedButton(
                child: Text("Random dog"),
                onPressed: () {
                  Navigator.pushNamed(context, randomDogPageRoute);
                },
              ),
            ),
            ListTile(
              title: ElevatedButton(
                child: Text("Sign"),
                onPressed: () {
                  final state = BlocProvider.of<AuthCubit>(context).state;

                  if (state is UserLoggedIn) {
                    Navigator.pushNamed(context, userDetailsPageRoute);
                  } else if (state is UserLoggedOut) {
                    Navigator.pushNamed(context, loginPageRoute);
                  } else if (state is AppStarted) {
                    //SPLASH
                    Navigator.pushNamed(context, loginPageRoute);
                  }
                },
              ),
            ),
            ListTile(
              title: ElevatedButton(
                child: Text("Internalization"),
                onPressed: () {
                  Navigator.pushNamed(context, internalizationPageRoute);
                },
              ),
            ),
            ListTile(
              title: ElevatedButton(
                child: Text("Media picker"),
                onPressed: () {
                  Navigator.pushNamed(context, mediaPageRoute);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
