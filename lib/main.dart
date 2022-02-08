import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/router/router.dart';
import 'package:first_project01/src/router/routing_const.dart';
import 'package:first_project01/src/screens/auth/auth_screen.dart';
import 'package:first_project01/src/screens/main_screen/MainScreen.dart';
import 'package:first_project01/src/screens/register/register_streen.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tokens');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String initialRoute = AuthRoute;
  @override
  void initState() {
    Box tokensBox = Hive.box('tokens');

    if(tokensBox.get('access') != null || tokensBox.get('refresh') != null) {
      print('Open MainScreen');
      initialRoute = MainRoute;
    } else {
      print('no user access data');
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: initialRoute,
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
      ),
    );
  }
}