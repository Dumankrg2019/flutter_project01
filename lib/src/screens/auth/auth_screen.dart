import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/common/constants/padding_constans.dart';
import 'package:first_project01/src/common/widgets/custom_button.dart';
import 'package:first_project01/src/common/widgets/custom_text_field.dart';
import 'package:first_project01/src/common/widgets/custom_text_field_divider.dart';
import 'package:first_project01/src/router/routing_const.dart';
import 'package:first_project01/src/screens/register/register_streen.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Dio dio = Dio();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showOrHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
          border: Border(),
          middle: Text('Авторизация'),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(placeholder: 'Логин или почта',
                controller: emailController,
              ),
              CustomTextFieldDivider(),
              CustomTextField(placeholder: 'Пароль',
                controller: passwordController,
                showOrHideIconForPassword: showOrHidePassword,
                showOrHideInputType: true,
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: AppPaddings.horizontal,
                child: CupertinoBtn(
                  label: 'Войти',
                  onPressed: () async {

                    Box tokensBox = Hive.box('tokens');

                      print('войти');
                      try {
                        Response response = await dio.post('http://api.codeunion.kz/api/v1/auth/login',
                            data: {
                              'email': emailController.text,
                              'password': passwordController.text
                            }
                        );
                        tokensBox.put('access', response.data['tokens']['accessToken']);
                        tokensBox.put('refresh', response.data['tokens']['refreshToken']);
                        print(tokensBox.get('access'));
                        print(tokensBox.get('refresh'));
                        Navigator.pushReplacementNamed(context, MainRoute);
                      } on DioError catch(e) {
                        print(e.response!.data);
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text('Ошибка'),
                                content: Text('Неправильный  логин или пароль!'),
                                actions: [
                                  CupertinoButton(
                                      child: Text('ОК'),
                                      onPressed: () => Navigator.pop(context)
                                  )
                                ],
                              );
                            }
                        );
                        throw e;
                      }
                    },
                ),
              ),
              SizedBox(
                height: 19,
              ),
              Padding(
                padding: AppPaddings.horizontal,
                child: CupertinoBtn(
                  label: 'Зарегистрироваться',
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterRoute);
                    },
                )
              ),
            ],
          ),
        ));
  }
}


