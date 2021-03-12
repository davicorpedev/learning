import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/auth/auth_cubit.dart';
import 'package:learning_app/injection_container.dart';
import 'package:learning_app/presentation/internalization_common.dart';
import 'package:learning_app/presentation/routes/route_generator.dart';
import 'package:learning_app/presentation/routes/routes.dart';

class App extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning App',
      initialRoute: homePageRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: _navigatorKey,
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      builder: (context, child) {
        return BlocProvider<AuthCubit>(
          create: (context) => sl<AuthCubit>()..getUser(),
          child: BlocListener<AuthCubit, AuthState>(
            child: child,
            listener: (_, state) {
              if (state is UserLoggedOut) {
                _navigator!.popUntil(ModalRoute.withName(homePageRoute));
                _navigator!.pushNamed(loginPageRoute);
              } else if (state is UserLoggedIn) {
                _navigator!.pushNamed(userDetailsPageRoute);
              }
            },
          ),
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
