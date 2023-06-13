import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(
    name: 'user_id',
  )
  final int userId;
  final String email;
  final String name;
  final String phone;
  final String nick;
  @JsonKey(
    name: 'profile_url',
  )
  final String profileUrl;
  final String address;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.phone,
    required this.nick,
    required this.profileUrl,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
