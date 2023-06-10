// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      nick: json['nick'] as String,
      profileUrl: UserModel.pathToUrl(json['profileUrl'] as String),
      address: json['address'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'nick': instance.nick,
      'profileUrl': instance.profileUrl,
      'address': instance.address,
    };
