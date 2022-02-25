import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:first_project01/src/common/models/ribbon/restaurent_item.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final Dio dio;
  FavoriteBloc({required this.dio}) : super(FavoriteInitial());
  final Box tokensBox = Hive.box('tokens');

  @override
  Stream<FavoriteState> mapEventToState(
      FavoriteEvent favoriteEvent,
      ) async* {

    if(favoriteEvent is getFavoriteList) {
      yield FavoriteLoading();

      try{

        dio.options.headers["authorization"] =
        'Bearer ${tokensBox.get('access')}';
        Response response = await dio.get('likes/all');
        var results = (response.data['restaurants'] as List)
            .map((e) => RestaurentItemModel.fromJson(e)).toList();
        yield FavoriteLoaded(restaurents: results);
      } on DioError catch(e) {
        yield FavoriteFailed();
        throw e;
      }

    }
  }
}
