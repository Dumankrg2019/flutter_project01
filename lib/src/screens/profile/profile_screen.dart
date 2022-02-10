import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/router/routing_const.dart';
import 'package:first_project01/src/screens/auth/auth_screen.dart';
import 'package:first_project01/src/screens/auth/bloc/log_in_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Box tokensBox = Hive.box('tokens');
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        border: Border(),
        middle: Text('Профиль'),
      ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 32,),
              Center(child: SvgPicture.asset('images/svg/profile.svg')),
              SizedBox(height: 15,),
              Text(tokensBox.get('email').toString(), style: TextStyle(
                  fontSize: 24,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 12,),
              Text(tokensBox.get('nickname').toString(), style: TextStyle(
                  fontSize: 16,
                  color: AppColors.grey,
                  fontWeight: FontWeight.normal
              ),
              ),
              SizedBox(height: 27,),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                      onPressed: () {
                        Box tokensBox = Hive.box('tokens');
                        tokensBox.delete('access');
                        tokensBox.delete('refresh');
                       // Navigator.pushReplacementNamed(context, AuthRoute);
                       //  Navigator.push(context,
                       //      MaterialPageRoute(
                       //          builder: (context) => MyApp()
                       //      )
                       //  );
                        Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                create: (context) => LogInBloc(),
                                child: AuthScreen()
                            )
                          )
                        );
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Выйти', style: TextStyle(
                          color: AppColors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.white
                  ),
                  ),
              )
            ],
          ),
        )
    );
  }
}
