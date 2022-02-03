import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Color(0xFFF3F4F6),
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.white,
          border: Border(),
          leading: Icon(Icons.keyboard_arrow_left, color: Colors.black,),
          middle: Text('Регистрация'),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 32,),
              CupertinoTextField(
                placeholder: 'Логин',
                padding:
                const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
                decoration: BoxDecoration(color: CupertinoColors.white),
              ),
              Container(
                height: 1,
                color: Color(0xFFE0E6ED),
                margin: const EdgeInsets.symmetric(horizontal: 16),
              ),
              CupertinoTextField(
                placeholder: 'Телефон',
                padding:
                const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
                decoration: BoxDecoration(color: CupertinoColors.white),
              ),
              Container(
                height: 1,
                color: Color(0xFFE0E6ED),
                margin: const EdgeInsets.symmetric(horizontal: 16),
              ),
              CupertinoTextField(
                placeholder: 'Почта',
                padding:
                const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
                decoration: BoxDecoration(color: CupertinoColors.white),
              ),
              Container(
                height: 1,
                color: Color(0xFFE0E6ED),
                margin: const EdgeInsets.symmetric(horizontal: 16),
              ),
              const CupertinoTextField(
                placeholder: 'Пароль',
                padding:
                EdgeInsets.symmetric(vertical: 19, horizontal: 16),
                decoration: BoxDecoration(color: CupertinoColors.white),
                suffix: Icon(Icons.visibility_off, color: Colors.black,),

              ),
              Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                          color: Color(0xFF4631D2),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Создать аккаунт',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {}),
                    ),
                  ),
              )
              ),
              SizedBox(height: 42,)
            ],
          ),
        ));
  }
}
