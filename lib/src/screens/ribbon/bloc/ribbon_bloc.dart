import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:first_project01/src/common/models/ribbon/restaurent_item.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'ribbon_event.dart';
part 'ribbon_state.dart';

class RibbonBloc extends Bloc<RibbonEvent, RibbonState> {
  final Dio dio;
  RibbonBloc({required this.dio}) : super(RibbonInitial());

  final Box tokensBox = Hive.box('tokens');

  @override
  Stream<RibbonState> mapEventToState(
      RibbonEvent eventRibbon,
      ) async* {

    print('Я работаю Ribbon');
      if(eventRibbon is RibbonGot) {
        yield RibbonLoading();
        try {
          dio.options.headers["authorization"] =
          'Bearer ${tokensBox.get('access')}';
          Response response = await dio.get(
              'http://api.codeunion.kz/api/v1/restaurants/all?page=1&perPage=10');

          var results = (response.data['restaurants'] as List)
              .map((e) => RestaurentItemModel.fromJson(e))
              .toList();

          yield RibbonLoaded(restaurents: results);
        } on DioError catch (e) {
          yield RibbonFailed(message: 'Ошибка загрузки');
          throw e;
        }
       }
      else if(eventRibbon is LikeOrDislikeClick) {
          if(eventRibbon.isFavorite ?? false) {
            try {
              dio.options.headers["authorization"] =
              'Bearer ${tokensBox.get('access')}';
              Response response = await dio.delete(
                  'http://api.codeunion.kz/api/v1/likes/${eventRibbon.idRestaurant}');

              //yield LikeOrDislikeState();
            } on DioError catch (e) {
              //yield RibbonFailed(message: 'Ошибка дизлайка\n ${e.response!.data['message']}');
              throw e;
            }
          } else {
            try {
              dio.options.headers["authorization"] =
              'Bearer ${tokensBox.get('access')}';
              Response response = await dio.post(
                  'http://api.codeunion.kz/api/v1/likes/new',
              data: {'restaurant_id': eventRibbon.idRestaurant}
              );
            } on DioError catch (e) {
              //yield RibbonFailed(message: 'Ошибка поставки лайка \n ${e.response!.data['message']}');
              throw e;
            }
          }
      }
    }

}
