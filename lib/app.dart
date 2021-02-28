import 'package:flutter/material.dart';
import 'package:learning_app/route/route_page.dart';
import 'package:learning_app/routes.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Learning")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(
              title: RaisedButton(
                child: Text("Providers"),
                onPressed: () {
                  Navigator.pushNamed(context, providerPageRoute);
                },
              ),
            ),
            ListTile(
              title: RaisedButton(
                child: Text("Streams"),
                onPressed: () {
                  Navigator.pushNamed(context, streamPageRoute);
                },
              ),
            ),
            ListTile(
              title: RaisedButton(
                child: Text("Animations"),
                onPressed: () {
                  Navigator.pushNamed(context, animationPageRoute);
                },
              ),
            ),
            ListTile(
              title: RaisedButton(
                child: Text("Routes"),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    routePageRoute,
                    arguments: RoutePageArguments("Titulo", "CUERPO"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
