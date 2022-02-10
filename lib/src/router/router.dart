import 'package:first_project01/src/router/routing_const.dart';
import 'package:first_project01/src/screens/auth/auth_screen.dart';
import 'package:first_project01/src/screens/auth/bloc/log_in_bloc.dart';
import 'package:first_project01/src/screens/main_screen/MainScreen.dart';
import 'package:first_project01/src/screens/register/bloc/registration_bloc.dart';
import 'package:first_project01/src/screens/register/register_streen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthRoute:
        return CupertinoPageRoute(
            builder: (context) =>
                BlocProvider(
                  create: (context) => LogInBloc(),
                  child: AuthScreen()
                )
        );
      case RegisterRoute:
        return CupertinoPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => RegistrationBloc(),
              child: RegisterScreen(),
            )
        );
      case MainRoute:
        return CupertinoPageRoute(
            builder: (context) => MainScreen()
        );
      default:
        return CupertinoPageRoute(
            builder: (context) => AuthScreen()
        );
    }
  }
}