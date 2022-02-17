part of 'ribbon_bloc.dart';

@immutable
abstract class RibbonState {}

class RibbonInitial extends RibbonState {}

class RibbonLoading extends RibbonState {}

class RibbonLoaded extends RibbonState {
  final List<RestaurentItemModel> restaurents;

  RibbonLoaded({required this.restaurents});
}

class OnItemClickingOfRibbon extends RibbonState {}

class RibbonFailed extends RibbonState {
  final String? message;

  RibbonFailed({required this.message});
}
