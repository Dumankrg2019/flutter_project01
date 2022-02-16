// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coords_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordsItemModel _$CoordsItemModelFromJson(Map<String, dynamic> json) =>
    CoordsItemModel(
      id: json['id'] as int?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      addressName: json['address_name'] as String?,
    );

Map<String, dynamic> _$CoordsItemModelToJson(CoordsItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'address_name': instance.addressName,
    };
