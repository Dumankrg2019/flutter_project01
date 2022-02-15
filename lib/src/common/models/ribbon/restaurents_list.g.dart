// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurents_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurentsModel _$RestaurentsModelFromJson(Map<String, dynamic> json) =>
    RestaurentsModel(
      count: json['count'] as int?,
      restaurants: (json['restaurants'] as List<dynamic>?)
          ?.map((e) => RestaurentItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurentsModelToJson(RestaurentsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'restaurants': instance.restaurants,
    };
