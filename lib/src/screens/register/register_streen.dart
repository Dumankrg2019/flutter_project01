import 'package:dio/dio.dart';
import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/common/widgets/custom_button.dart';
import 'package:first_project01/src/common/widgets/custom_text_field.dart';
import 'package:first_project01/src/common/widgets/custom_text_field_divider.dart';
import 'package:first_project01/src/router/routing_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Dio dio = Dio();
  final TextEditingController  loginController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Color(0xFFF3F4F6),
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
          border: Border(),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
          ),
          middle: Text('Регистрация'),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 32,
              ),
              CustomTextField(
                placeholder: 'Логин',
                controller: loginController,
              ),
              CustomTextFieldDivider(),
              CustomTextField(
                placeholder: 'Телефон',
                controller: phoneController,
              ),
              CustomTextFieldDivider(),
              CustomTextField(
                placeholder: 'Почта',
                controller: emailController,
              ),
              CustomTextFieldDivider(),
              CustomTextField(
                placeholder: 'Пароль',
                showOrHideIconForPassword: true,
                showOrHideInputType: true,
                controller: passwordController,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: CupertinoBtn(
                      label: 'Создать аккаунт',
                      onPressed: () async {

                        try{
                          Response response = await dio.post(
                              'http://api.codeunion.kz/api/v1/auth/registration/customer/new',
                            data: {
                                'nickname': loginController.text,
                                'phone': phoneController.text,
                                'email': emailController.text,
                                'password': passwordController.text,
                              }
                          );
                          Navigator.pushReplacementNamed(context, AuthRoute);
                        } on DioError catch (e) {
                          print(e.response!.data);
                          showCupertinoModalPopup(
                             context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: Text('Ошибка'),
                                  content: Text('Неправильно веденные  данные \n'
                                      '${e.response!.data['message']}'),
                                  actions: [
                                    CupertinoButton(
                                        child: Text('Ок'),
                                        onPressed: () => Navigator.pop(context)
                                    )
                                  ],
                                );
                              }
                         );
                        }
                      },
                    ),
                  ),
                ),
              )),
              SizedBox(
                height: 42,
              )
            ],
          ),
        ));
  }
}
