import 'package:flutter/material.dart';

class RoutePageArguments {
  final String title;
  final String body;

  RoutePageArguments({required this.title, required this.body});
}

class RoutePage extends StatelessWidget {
  final String title;
  final String body;

  const RoutePage({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: Text(body)),
    );
  }
}
