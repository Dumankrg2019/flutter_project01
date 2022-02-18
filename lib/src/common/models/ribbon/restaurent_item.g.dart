// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurent_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurentItemModel _$RestaurentItemModelFromJson(Map<String, dynamic> json) =>
    RestaurentItemModel(
      isFavourite: json['is_favourite'] as bool?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      scheduleId: json['schedule_id'] as int?,
      coordsId: json['coords_id'] as int?,
      userId: json['user_id'] as int?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImagesItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      schedule:
          ScheduleItemModel.fromJson(json['schedule'] as Map<String, dynamic>),
      coords: CoordsItemModel.fromJson(json['coords'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RestaurentItemModelToJson(
        RestaurentItemModel instance) =>
    <String, dynamic>{
      'is_favourite': instance.isFavourite,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'schedule_id': instance.scheduleId,
      'coords_id': instance.coordsId,
      'user_id': instance.userId,
      'images': instance.images,
      'schedule': instance.schedule,
      'coords': instance.coords,
    };
