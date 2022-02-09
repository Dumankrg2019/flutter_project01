import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/common/constants/padding_constans.dart';
import 'package:first_project01/src/common/models/tokens_model.dart';
import 'package:first_project01/src/common/models/user_model.dart';
import 'package:first_project01/src/common/widgets/custom_button.dart';
import 'package:first_project01/src/common/widgets/custom_text_field.dart';
import 'package:first_project01/src/common/widgets/custom_text_field_divider.dart';
import 'package:first_project01/src/router/routing_const.dart';
import 'package:first_project01/src/screens/auth/bloc/log_in_bloc.dart';
import 'package:first_project01/src/screens/register/register_streen.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              CustomTextField(
                placeholder: 'Логин или почта',
                controller: emailController,
              ),
              CustomTextFieldDivider(),
              CustomTextField(
                placeholder: 'Пароль',
                controller: passwordController,
                showOrHideIconForPassword: showOrHidePassword,
                showOrHideInputType: true,
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: AppPaddings.horizontal,
                child: BlocConsumer<LogInBloc, LogInState>(
                  listener: (context, state) {
                    if (state is LogInLoaded) {
                      Navigator.pushReplacementNamed(context, MainRoute);
                    } else if (state is LogInFailed) {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text('Ошибка'),
                              content: Text(state.message ?? ''),
                              actions: [
                                CupertinoButton(
                                    child: Text('ОК'),
                                    onPressed: () => Navigator.pop(context))
                              ],
                            );
                          });
                    }
                  },
                  builder: (context, state) {
                    return CupertinoBtn(
                        label: 'Войти',
                        onPressed: state is LogInLoading ? () {} : () {
                          context.read<LogInBloc>().add(
                            LogInPressed(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        }
                    );
                  },
                ),
              ),
              SizedBox(
                height: 19,
              ),
            ],
          ),
        ));
  }
}
