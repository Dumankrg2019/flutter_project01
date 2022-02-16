import 'package:json_annotation/json_annotation.dart';

part 'schedule_item.g.dart';

@JsonSerializable()
class ScheduleItemModel {
  final int? id;
  final String? opening;
  final String? closing;

  ScheduleItemModel({
    required this.id,
    required this.opening,
    required this.closing
  });

  factory ScheduleItemModel.fromJson(Map<String, dynamic> json) =>_$ScheduleItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleItemModelToJson(this);
}