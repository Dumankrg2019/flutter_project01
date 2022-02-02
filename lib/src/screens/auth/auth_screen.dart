import 'package:flutter/cupertino.dart';


class AuthScreen  extends StatelessWidget {
  const AuthScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFF3F4F6),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border(),
        middle: Text('Авторизация'),
      ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              CupertinoTextField(
                  placeholder: 'Логин или почта',
                padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
                decoration: BoxDecoration(
                  color: CupertinoColors.white
                  ),
                ),

              Container(
                height: 1,
                color: Color(0xFFE0E6ED),
                margin: const EdgeInsets.symmetric(horizontal: 16),
              ),

              CupertinoTextField(
                  placeholder: 'Пароль',
                padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
                decoration: BoxDecoration(
                    color: CupertinoColors.white
                ),
                ),

              SizedBox(height: 32,),

             Padding(
               padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                      color: Color(0xFF4631D2),
                      child: Text('Войти',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: () {}),
             ),
              SizedBox(height: 19,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CupertinoButton(
                    color: Color(0xFF4631D2),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text('Зарегистрироваться',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: () {}),
              ),

            ],
          ),
        )
    );
  }
}
