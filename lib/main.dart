import 'package:first_project01/src/router/router.dart';
import 'package:first_project01/src/screens/auth/auth_screen.dart';
import 'package:first_project01/src/screens/register/register_streen.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      onGenerateRoute: AppRouter.generateRoute,
      home: AuthScreen(),
    );
  }

}