import 'package:dio/dio.dart';
import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/common/dependencies/injection_container.dart';
import 'package:first_project01/src/router/router.dart';
import 'package:first_project01/src/screens/auth/auth_screen.dart';
import 'package:first_project01/src/screens/auth/bloc/log_in_bloc.dart';
import 'package:first_project01/src/screens/profile/profile_screen.dart';
import 'package:first_project01/src/screens/register/bloc/registration_bloc.dart';
import 'package:first_project01/src/screens/register/register_streen.dart';
import 'package:first_project01/src/screens/ribbon/bloc/ribbon_bloc.dart';
import 'package:first_project01/src/screens/ribbon/ribbon_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'images/svg/lenta.svg',
                      color: AppColors.black,
                    ),
                    activeIcon: SvgPicture.asset(
                      'images/svg/lenta.svg',
                      color: AppColors.main,
                    ),
                    label: 'Лента'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'images/svg/map.svg',
                      color: AppColors.black,
                    ),
                    activeIcon: SvgPicture.asset(
                      'images/svg/map.svg',
                      color: AppColors.main,
                    ),
                    label: 'Карта'),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.heart,
                      color: AppColors.black,
                    ),
                    activeIcon: Icon(
                      CupertinoIcons.heart,
                      color: AppColors.main,
                    ),
                    label: 'Избранные'),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.person_crop_circle,
                      color: AppColors.black,
                    ),
                    activeIcon: Icon(
                      CupertinoIcons.person_crop_circle,
                      color: AppColors.main,
                    ),
                    label: 'Профиль'),
              ],
              activeColor:
                  AppColors.main //чтобы цвет текста менялся при активном нажатии
              ),
          tabBuilder: (context, index) {
            return CupertinoTabView(builder: (context) {
              switch (index) {
                case 0:
                  return BlocProvider(
                    create: (context) => RibbonBloc(dio: getIt<Dio>())..add(RibbonGot()),
                    child: RibbonScreen(),
                  );
                case 1:
                  return BlocProvider(
                    create: (context) => RegistrationBloc(dio: getIt<Dio>()),
                    child: RegisterScreen(),
                  );
                case 2:
                  return BlocProvider(
                    create: (context) => LogInBloc(dio: getIt<Dio>()),
                    child: AuthScreen(),
                  );
                case 3:
                  return ProfileScreen();
                default:
                  return AuthScreen();
              }
            },
            onGenerateRoute: AppRouter.generateRoute,
            );
          }),
    );
  }
}
