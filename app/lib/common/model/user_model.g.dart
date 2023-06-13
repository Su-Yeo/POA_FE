// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['user_id'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      nick: json['nick'] as String,
      profileUrl: json['profile_url'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'user_id': instance.userId,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'nick': instance.nick,
      'profile_url': instance.profileUrl,
      'address': instance.address,
    };
