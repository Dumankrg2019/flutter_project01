import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/screens/auth/auth_screen.dart';
import 'package:first_project01/src/screens/profile/profile_screen.dart';
import 'package:first_project01/src/screens/register/register_streen.dart';
import 'package:first_project01/src/screens/ribbon/ribbon_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
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
                return RibbonScreen();
              case 1:
                return RegisterScreen();
              case 2:
                return AuthScreen();
              case 3:
                return ProfileScreen();
              default:
                return AuthScreen();
            }
          });
        });
  }
}
