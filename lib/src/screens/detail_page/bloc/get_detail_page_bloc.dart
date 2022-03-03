import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:first_project01/src/common/models/ribbon/restaurent_item.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'get_detail_page_event.dart';
part 'get_detail_page_state.dart';

class GetDetailPageBloc extends Bloc<GetDetailPageEvent, GetDetailPageState> {
  final Dio dio;
  GetDetailPageBloc({required this.dio}) : super(GetDetailPageInitial());
  final Box tokensBox = Hive.box('tokens');

  @override
  Stream<GetDetailPageState> mapEventToState(
      GetDetailPageEvent event,
      ) async* {

    if(event is GetDetailPageInfo) {
      yield GetDetailPageLoading();

      try {

        dio.options.headers["authorization"] =
        'Bearer ${tokensBox.get('access')}';

        Response response = await dio.get(
            'http://api.codeunion.kz/api/v1/restaurants/details/${event.idRestaurent}');

        var results = (response.data['restaurant'] as List)
            .map((e) => RestaurentItemModel.fromJson(e))
            .toList();

        yield GetDetailPageLoaded(restaurents: results);
      } on DioError catch(e) {
        yield GetDetailPageFailed();
        throw(e);
      }
    }
  }

}
