
import 'package:json_annotation/json_annotation.dart';

import 'images_item.dart';

part 'restaurent_item.g.dart';

@JsonSerializable()
class RestaurentItemModel {
  @JsonKey(name: 'is_favourite')
  final bool? isFavourite;

  final int? id;
  final String? title;
  final String? description;
  @JsonKey(name: 'schedule_id')
  final int? scheduleId;
  @JsonKey(name: 'coords_id')
  final int? coordsId;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'images')
  final List<ImagesItemModel>? images;

  RestaurentItemModel({
    required this.isFavourite,
    required this.id,
    required this.title,
    required this.description,
    required this.scheduleId,
    required this.coordsId,
    required this.userId,
    required this.images,
  });

  factory RestaurentItemModel.fromJson(Map<String, dynamic> json) =>_$RestaurentItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurentItemModelToJson(this);
}