import 'package:flutter/cupertino.dart';


class AuthScreen  extends StatelessWidget {
  const AuthScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Авторизация'),
      ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 16, left: 16),
                child: CupertinoTextField(
                  placeholder: 'Логин или почта',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16, left: 16),
                child: CupertinoTextField(
                  placeholder: 'Пароль',
                ),
              ),
              SizedBox(height: 32,),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: CupertinoButton.filled(
                      child: Text('Войти'),
                      onPressed: () {}),
                ),
              ),
              SizedBox(height: 19,),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: CupertinoButton.filled(
                      child: Text('Зарегистрироваться'),
                      onPressed: () {}),
                ),
              )
            ],
          ),
        )
    );
  }
}
