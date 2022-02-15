
import 'package:json_annotation/json_annotation.dart';

import 'images_item.dart';

part 'restaurent_item.g.dart';

@JsonSerializable()
class RestaurentItemModel {
  @JsonKey(name: 'is_favourite')
  final bool? is_favourite;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'schedule_id')
  final int? schedule_id;
  @JsonKey(name: 'coords_id')
  final int? coords_id;
  @JsonKey(name: 'user_id')
  final int? user_id;
  @JsonKey(name: 'images')
  final List<ImagesItemModel>? images;

  RestaurentItemModel({
    required this.is_favourite,
    required this.id,
    required this.title,
    required this.description,
    required this.schedule_id,
    required this.coords_id,
    required this.user_id,
    required this.images,
  });

  factory RestaurentItemModel.fromJson(Map<String, dynamic> json) =>_$RestaurentItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurentItemModelToJson(this);
}