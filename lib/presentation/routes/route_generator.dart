import 'package:flutter/material.dart';
import 'package:learning_app/presentation/pages/animation/animation_page.dart';
import 'package:learning_app/presentation/pages/auth/login/login_page.dart';
import 'package:learning_app/presentation/pages/auth/user_details/user_details_page.dart';
import 'package:learning_app/presentation/pages/home/home_page.dart';
import 'package:learning_app/presentation/pages/internalization/internaliaztion_page.dart';
import 'package:learning_app/presentation/pages/provider/provider_page.dart';
import 'package:learning_app/presentation/pages/random_dog/random_dog_page.dart';
import 'package:learning_app/presentation/pages/routes/route_page.dart';
import 'package:learning_app/presentation/pages/stream/stream_page.dart';
import 'package:learning_app/presentation/routes/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case homePageRoute:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
          settings: RouteSettings(name: homePageRoute),
        );
      case providerPageRoute:
        return MaterialPageRoute(
          builder: (_) => ProviderPage(),
          settings: RouteSettings(name: providerPageRoute),
        );
      case streamPageRoute:
        return MaterialPageRoute(
          builder: (_) => StreamPage(),
          settings: RouteSettings(name: streamPageRoute),
        );
      case animationPageRoute:
        return MaterialPageRoute(
          builder: (_) => AnimationPage(),
          settings: RouteSettings(name: animationPageRoute),
        );
      case routePageRoute:
        if (args is RoutePageArguments) {
          return MaterialPageRoute(
            builder: (_) => RoutePage(title: args.title, body: args.body),
            settings: RouteSettings(name: routePageRoute),
          );
        }
        break;
      case randomDogPageRoute:
        return MaterialPageRoute(
          builder: (_) => RandomDogPage(),
          settings: RouteSettings(name: randomDogPageRoute),
        );
      case loginPageRoute:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
          settings: RouteSettings(name: loginPageRoute),
        );
      case userDetailsPageRoute:
        return MaterialPageRoute(
          builder: (_) => UserDetailsPage(),
          settings: RouteSettings(name: userDetailsPageRoute),
        );
      case internalizationPageRoute:
        return MaterialPageRoute(
          builder: (_) => InternalizationPage(),
          settings: RouteSettings(name: internalizationPageRoute),
        );
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
