// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatorModel _$CreatorModelFromJson(Map<String, dynamic> json) => CreatorModel(
      name: json['name'] as String,
      profileUrl: json['profile_url'] as String,
      story: json['story'] as String,
      disabledType: json['disabled_type'] as String,
      disabledText: json['disabled_text'] as String,
      artworkDtoList: (json['artworkDtoList'] as List<dynamic>)
          .map((e) => ArtWorkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreatorModelToJson(CreatorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profile_url': instance.profileUrl,
      'story': instance.story,
      'disabled_type': instance.disabledType,
      'disabled_text': instance.disabledText,
      'artworkDtoList': instance.artworkDtoList,
    };
