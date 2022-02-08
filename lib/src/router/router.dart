import 'package:first_project01/src/router/routing_const.dart';
import 'package:first_project01/src/screens/auth/auth_screen.dart';
import 'package:first_project01/src/screens/main_screen/MainScreen.dart';
import 'package:first_project01/src/screens/register/register_streen.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthRoute:
        return CupertinoPageRoute(
            builder: (context) => AuthScreen()
        );
      case RegisterRoute:
        return CupertinoPageRoute(
            builder: (context) => RegisterScreen()
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