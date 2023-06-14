// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_work_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtWorkModel _$ArtWorkModelFromJson(Map<String, dynamic> json) => ArtWorkModel(
      artworkId: json['artwork_id'] as int,
      userId: json['user_id'] as int,
      userName: json['user_name'] as String,
      fileUrl: json['file_url'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      artworkPrice: json['artwork_price'] as int,
      artworkSize: json['artwork_size'] as String,
      artworkState: json['artwork_state'] as int,
      like: json['like'] as bool,
    );

Map<String, dynamic> _$ArtWorkModelToJson(ArtWorkModel instance) =>
    <String, dynamic>{
      'artwork_id': instance.artworkId,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'file_url': instance.fileUrl,
      'title': instance.title,
      'content': instance.content,
      'artwork_price': instance.artworkPrice,
      'artwork_size': instance.artworkSize,
      'artwork_state': instance.artworkState,
      'like': instance.like,
    };
