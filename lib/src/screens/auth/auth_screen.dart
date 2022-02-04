import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/common/constants/padding_constans.dart';
import 'package:first_project01/src/common/widgets/custom_button.dart';
import 'package:first_project01/src/common/widgets/custom_text_field.dart';
import 'package:first_project01/src/common/widgets/custom_text_field_divider.dart';
import 'package:first_project01/src/router/routing_const.dart';
import 'package:first_project01/src/screens/auth/widgets/custom_button_to_register.dart';
import 'package:first_project01/src/screens/register/register_streen.dart';
import 'package:flutter/cupertino.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

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
              CustomTextField(placeholder: 'Логин или почта'),
              CustomTextFieldDivider(),
              CustomTextField(placeholder: 'Пароль'),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: AppPaddings.horizontal,
                child: CupertinoBtn(
                  label: 'Войти',
                ),
              ),
              SizedBox(
                height: 19,
              ),
              Padding(
                padding: AppPaddings.horizontal,
                child: CupertinoBtnToRegister(
                  label: 'Зарегистрироваться',
                ),
              ),
            ],
          ),
        ));
  }
}



