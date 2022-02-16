part of 'ribbon_bloc.dart';

@immutable
abstract class RibbonEvent {}

class RibbonGot extends RibbonEvent {
    late final List<RestaurentItemModel> restaurent;

    RibbonGot({required this.restaurent});
}
