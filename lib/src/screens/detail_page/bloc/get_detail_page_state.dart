part of 'get_detail_page_bloc.dart';

@immutable
abstract class GetDetailPageState {}

class GetDetailPageInitial extends GetDetailPageState {}

class GetDetailPageLoading extends GetDetailPageState{}

class GetDetailPageLoaded extends GetDetailPageState{
  final List<RestaurentItemModel> restaurents;

  GetDetailPageLoaded({required this.restaurents});
}

class GetDetailPageFailed extends GetDetailPageState{}

