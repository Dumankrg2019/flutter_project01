import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'like_func_event.dart';
part 'like_func_state.dart';

class LikeFuncBloc extends Bloc<LikeFuncEvent, LikeFuncState> {
  final Dio dio;
  LikeFuncBloc({required this.dio}) : super(LikeFuncInitial());

  final Box tokensBox = Hive.box('tokens');

  @override
  Stream<LikeFuncState> mapEventToState(
      LikeFuncEvent likeEvent,
      ) async* {

    if(likeEvent is LikeFuncPressed) {
      yield LikeFuncLoading();

      if(likeEvent.isFavorite ?? false) {
        try {
          dio.options.headers["authorization"] =
          'Bearer ${tokensBox.get('access')}';
          Response response = await dio.delete(
              'http://api.codeunion.kz/api/v1/likes/${likeEvent.idRestaurant}');

          yield LikeFuncLoaded();
        } on DioError catch (e) {
          throw e;
        }
      } else {
        try {
          dio.options.headers["authorization"] =
          'Bearer ${tokensBox.get('access')}';
          Response response = await dio.post(
              'http://api.codeunion.kz/api/v1/likes/new',
              data: {'restaurant_id': likeEvent.idRestaurant}
          );
          yield LikeFuncLoaded();
        } on DioError catch (e) {
          throw e;
        }
      }

    }
  }

}
