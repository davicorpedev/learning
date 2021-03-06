import 'package:flutter/material.dart';
import 'package:learning_app/presentation/pages/routes/route_page.dart';
import 'package:learning_app/presentation/routes/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Learning")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(
              title: ElevatedButton(
                child: Text("Providers"),
                onPressed: () {
                  Navigator.pushNamed(context, providerPageRoute);
                },
              ),
            ),
            ListTile(
              title: ElevatedButton(
                child: Text("Streams"),
                onPressed: () {
                  Navigator.pushNamed(context, streamPageRoute);
                },
              ),
            ),
            ListTile(
              title: ElevatedButton(
                child: Text("Animations"),
                onPressed: () {
                  Navigator.pushNamed(context, animationPageRoute);
                },
              ),
            ),
            ListTile(
              title: ElevatedButton(
                child: Text("Routes"),
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
                child: Text("Login"),
                onPressed: () {
                  Navigator.pushNamed(context, loginPageRoute);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
