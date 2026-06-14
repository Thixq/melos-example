import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(checked: true)
class UserModel {
  /// The `id` field is required and must be provided when creating an instance of `UserModel`.
  final String id;

  /// The `name` field is required and must be provided when creating an instance of `UserModel`.
  final String name;

  final String? email;

  UserModel({required this.id, required this.name, this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
