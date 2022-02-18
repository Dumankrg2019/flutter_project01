// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleItemModel _$ScheduleItemModelFromJson(Map<String, dynamic> json) =>
    ScheduleItemModel(
      id: json['id'] as int?,
      opening: json['opening'] as String?,
      closing: json['closing'] as String?,
    );

Map<String, dynamic> _$ScheduleItemModelToJson(ScheduleItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'opening': instance.opening,
      'closing': instance.closing,
    };
