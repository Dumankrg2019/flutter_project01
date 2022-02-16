import 'package:json_annotation/json_annotation.dart';

part 'coords_item.g.dart';

@JsonSerializable()
class CoordsItemModel {
  final int? id;
  final double? longitude;
  final double? latitude;
  @JsonKey(name: 'address_name')
  final String? addressName;

  CoordsItemModel({
    required this.id,
    required this.longitude,
    required this.latitude,
    required this.addressName
  });

  factory CoordsItemModel.fromJson(Map<String, dynamic> json) =>_$CoordsItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoordsItemModelToJson(this);
}
