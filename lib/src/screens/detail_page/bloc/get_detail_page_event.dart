part of 'get_detail_page_bloc.dart';

@immutable
abstract class GetDetailPageEvent {}

class GetDetailPageInfo extends GetDetailPageEvent{
  final String? idRestaurent;

  GetDetailPageInfo({ required this.idRestaurent});
}