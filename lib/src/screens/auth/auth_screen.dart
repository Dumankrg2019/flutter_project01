import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/common/constants/padding_constans.dart';
import 'package:first_project01/src/common/widgets/custom_button.dart';
import 'package:first_project01/src/common/widgets/custom_text_field.dart';
import 'package:first_project01/src/common/widgets/custom_text_field_divider.dart';
import 'package:first_project01/src/router/routing_const.dart';
import 'package:first_project01/src/screens/register/register_streen.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Dio dio = Dio();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: AppPaddings.horizontal,
                child: CupertinoBtn(
                  label: 'Войти',
                  onPressed: () async {
                      print('войти');
                      try {
                        Response response = await dio.post('http://api.codeunion.kz/api/v1/auth/login',
                            data: {
                              'email': emailController.text,
                              'password': passwordController.text
                            }
                        );
                        print(response.data['tokens']['accessToken']);
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


