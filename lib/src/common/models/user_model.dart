import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int? id;
  final String? email;
  final String? nickname;

  UserModel({
    required this.id,
    required this.email,
    required this.nickname
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>_$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}