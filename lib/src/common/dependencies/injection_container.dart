
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

initGetIt() {
  getIt.registerLazySingleton<Dio>(
          () => Dio(BaseOptions(baseUrl: 'http://api.codeunion.kz/api/v1/'))
  );
}