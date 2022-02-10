import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial());

  final Dio dio = Dio();

  @override
  Stream<RegistrationState> mapEventToState(
      RegistrationEvent register,
      ) async* {

    yield RegistrationInLoading();

    if(register is RegistrationInPressed) {
      print('Я работаю и отправляю запрос на сервер!! - Registration');
      try {
        Response response = await dio.post(
            'http://api.codeunion.kz/api/v1/auth/registration/customer/new',
            data: {
              'nickname': register.nickname,
              'phone': register.phone,
              'email': register.email,
              'password': register.password,
            }
        );

        yield RegistrationInLoaded();

      } on DioError catch(e) {
        yield RegistrationInFailed(message: 'Неправильный логин или пароль');
        throw e;
      } catch (e) {
        yield RegistrationInFailed(message: 'Произшла ошибка');
        throw e;
      }
    }
  }

}
