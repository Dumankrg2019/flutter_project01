// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurent_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurentItemModel _$RestaurentItemModelFromJson(Map<String, dynamic> json) =>
    RestaurentItemModel(
      is_favourite: json['is_favourite'] as bool?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      schedule_id: json['schedule_id'] as int?,
      coords_id: json['coords_id'] as int?,
      user_id: json['user_id'] as int?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImagesItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurentItemModelToJson(
        RestaurentItemModel instance) =>
    <String, dynamic>{
      'is_favourite': instance.is_favourite,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'schedule_id': instance.schedule_id,
      'coords_id': instance.coords_id,
      'user_id': instance.user_id,
      'images': instance.images,
    };
