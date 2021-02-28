import 'package:flutter/material.dart';
import 'package:learning_app/animation_page.dart';
import 'package:learning_app/provider_page.dart';
import 'package:learning_app/stream_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => MyHomePage(),
        '/provider': (context) => ProviderPage(),
        '/stream': (context) => StreamPage(),
        '/animation': (context) => AnimationPage(),
      },
    );
  }
}

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
                  Navigator.pushNamed(context, "/provider");
                },
              ),
            ),
            ListTile(
              title: RaisedButton(
                child: Text("Streams"),
                onPressed: () {
                  Navigator.pushNamed(context, "/stream");
                },
              ),
            ),
            ListTile(
              title: RaisedButton(
                child: Text("Animations"),
                onPressed: () {
                  Navigator.pushNamed(context, "/animation");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
