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
    yield RibbonLoading();
    print('Я работаю Ribbon');
      if(eventRibbon is RibbonGot) {
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
      } else if(eventRibbon is ClickItemOfRibbon) {
        print(eventRibbon.index);
        tokensBox.put('idRestaurent', eventRibbon.index);
        yield OnItemClickingOfRibbon();
      } else if(eventRibbon is LikeOrDislikeClick) {
          if(eventRibbon.isFavorite ?? false) {

          } else {

          }
      }
    }

}
