import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_app/injection_container.dart' as di;
import 'package:learning_app/presentation/routes/route_generator.dart';
import 'package:learning_app/presentation/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await di.init();

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
