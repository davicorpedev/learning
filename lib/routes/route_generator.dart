import 'package:flutter/material.dart';
import 'package:learning_app/app.dart';
import 'package:learning_app/pages/animation_page.dart';
import 'package:learning_app/pages/provider_page.dart';
import 'package:learning_app/pages/route_page.dart';
import 'package:learning_app/pages/stream_page.dart';
import 'package:learning_app/routes/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case homePageRoute:
        return MaterialPageRoute(builder: (_) => App());
      case providerPageRoute:
        return MaterialPageRoute(builder: (_) => ProviderPage());
      case streamPageRoute:
        return MaterialPageRoute(builder: (_) => StreamPage());
      case animationPageRoute:
        return MaterialPageRoute(builder: (_) => AnimationPage());
      case routePageRoute:
        if (args is RoutePageArguments) {
          return MaterialPageRoute(
            builder: (_) => RoutePage(arguments: args),
          );
        }
        break;
    }

    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Unknown Route'),
        ),
      );
    });
  }
}

/*var routes = <String, WidgetBuilder>{
    "hello": (ctx) => Hello(settings.arguments),
    "other": (ctx) => SomeWidget(),
  };

  WidgetBuilder builder = routes[settings.name];

  return MaterialPageRoute(builder: (ctx) => builder(ctx));*/
