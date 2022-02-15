// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesItemModel _$ImagesItemModelFromJson(Map<String, dynamic> json) =>
    ImagesItemModel(
      id: json['id'] as int?,
      url: json['url'] as String?,
      restaurant_id: json['restaurant_id'] as int?,
    );

Map<String, dynamic> _$ImagesItemModelToJson(ImagesItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'restaurant_id': instance.restaurant_id,
    };
