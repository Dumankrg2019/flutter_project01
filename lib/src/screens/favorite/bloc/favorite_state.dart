part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState{}

class FavoriteLoaded extends FavoriteState{
  final List<RestaurentItemModel> restaurents;

  FavoriteLoaded({required this.restaurents});
}

class FavoriteFailed extends FavoriteState {}
