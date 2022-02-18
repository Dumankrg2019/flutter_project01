import 'package:first_project01/src/common/models/ribbon/restaurent_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurents_list.g.dart';

@JsonSerializable()
class RestaurentsModel {
  final int? count;
  final List<RestaurentItemModel>? restaurants;

  RestaurentsModel({
    required this.count,
    required this.restaurants
  });

  factory RestaurentsModel.fromJson(Map<String, dynamic> json) =>_$RestaurentsModelFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurentsModelToJson(this);
}
