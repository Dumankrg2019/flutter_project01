part of 'like_func_bloc.dart';

@immutable
abstract class LikeFuncEvent {}

class LikeFuncPressed extends LikeFuncEvent{

  final int? idRestaurant;
  bool? isFavorite;

  LikeFuncPressed({required this.idRestaurant, required this.isFavorite});
}