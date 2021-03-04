import 'package:flutter/material.dart';

class RoutePageArguments {
  final String title;
  final String body;

  RoutePageArguments({required this.title, required this.body});
}

class RoutePage extends StatelessWidget {
  final RoutePageArguments arguments;

  const RoutePage({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.title),
      ),
      body: Center(child: Text(arguments.body)),
    );
  }
}
