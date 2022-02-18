part of 'ribbon_bloc.dart';

@immutable
abstract class RibbonEvent {}

class RibbonGot extends RibbonEvent {
}

class ClickItemOfRibbon extends RibbonEvent {

  final String? index;

  ClickItemOfRibbon({required this.index});
}

class LikeOrDislikeClick extends RibbonEvent {

  final int? idRestaurant;
  bool? isFavorite;

  LikeOrDislikeClick({required this.idRestaurant, required this.isFavorite});
}
