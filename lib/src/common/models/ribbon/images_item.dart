
import 'package:json_annotation/json_annotation.dart';

part 'images_item.g.dart';

@JsonSerializable()
class ImagesItemModel {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'restaurant_id')
  final int? restaurant_id;

  ImagesItemModel({
    required this.id,
    required this.url,
    required this.restaurant_id,
  });

  factory ImagesItemModel.fromJson(Map<String, dynamic> json) =>_$ImagesItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesItemModelToJson(this);
}