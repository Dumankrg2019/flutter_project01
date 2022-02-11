import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:first_project01/src/common/models/tokens_model.dart';
import 'package:first_project01/src/common/models/user_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final Dio dio;
  LogInBloc({required this.dio}) : super(LogInInitial());


  final Box tokensBox = Hive.box('tokens');

  @override
  Stream<LogInState> mapEventToState(
      LogInEvent event,
      ) async* {
    yield LogInLoading();

    print('Я работаю и отправляю запрос на сервер!!');
    if (event is LogInPressed) {
      try {
        Response response = await dio.post('auth/login',
            data: {'email': event.email, 'password': event.password});
        //конвертирование  полей  токена в  созщданную модель
        TokensModel tokensModel =
        TokensModel.fromJson(response.data['tokens']);

        //конвертирование  полей  user в  созщданную модель
        UserModel userInfo = UserModel.fromJson(response.data['user']);

        //запись userInfo в localStorage
        tokensBox.put('email', userInfo.email);
        tokensBox.put('nickname', userInfo.nickname);

        //запись токена в localStorage
        tokensBox.put('access', tokensModel.access);
        tokensBox.put('refresh', tokensModel.refresh);

        print(tokensBox.get('access'));
        print(tokensBox.get('refresh'));
        //Navigator.pushReplacementNamed(context, MainRoute);
        yield LogInLoaded();
      } on DioError catch (e) {
        yield LogInFailed(message: 'Неправильный логин или пароль');
        throw e;
      } catch (e) {
        yield LogInFailed(message: 'Произошла ошибка');
        throw e;
      }
    }
  }


}
