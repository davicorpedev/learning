import 'package:flutter/material.dart';
import 'package:learning_app/presentation/routes/route_generator.dart';
import 'package:learning_app/presentation/routes/routes.dart';

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
      initialRoute: homePageRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
