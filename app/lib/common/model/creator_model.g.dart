// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatorModel _$CreatorModelFromJson(Map<String, dynamic> json) => CreatorModel(
      name: json['name'] as String,
      profileUrl: CreatorModel.pathToUrl(json['profileUrl'] as String),
      story: json['story'] as String,
      disabledType: json['disabledType'] as String,
      disabledText: json['disabledText'] as String,
      artworkDtoList: (json['artworkDtoList'] as List<dynamic>)
          .map((e) => ArtWorkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreatorModelToJson(CreatorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profileUrl': instance.profileUrl,
      'story': instance.story,
      'disabledType': instance.disabledType,
      'disabledText': instance.disabledText,
      'artworkDtoList': instance.artworkDtoList,
    };
