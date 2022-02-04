import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/common/widgets/custom_button.dart';
import 'package:first_project01/src/common/widgets/custom_text_field.dart';
import 'package:first_project01/src/common/widgets/custom_text_field_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
              ),
              CustomTextFieldDivider(),
              CustomTextField(
                placeholder: 'Телефон',
              ),
              CustomTextFieldDivider(),
              CustomTextField(
                placeholder: 'Почта',
              ),
              CustomTextFieldDivider(),
              CustomTextField(
                placeholder: 'Пароль',
                showOrHideIconForPassword: true,
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
