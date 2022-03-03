part of 'like_func_bloc.dart';

@immutable
abstract class LikeFuncState {}

class LikeFuncInitial extends LikeFuncState {}

class LikeFuncLoading extends LikeFuncState{}

class LikeFuncLoaded extends LikeFuncState{
}

class LikeFuncFailed extends LikeFuncState{}
