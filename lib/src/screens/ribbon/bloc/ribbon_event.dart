part of 'ribbon_bloc.dart';

@immutable
abstract class RibbonEvent {}

class RibbonGot extends RibbonEvent {
}

class ClickItemOfRibbon extends RibbonEvent {

  final String? index;

  ClickItemOfRibbon({required this.index});
}
