// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_work_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtWorkModel _$ArtWorkModelFromJson(Map<String, dynamic> json) => ArtWorkModel(
      artworkId: json['artworkId'] as int,
      userId: json['userId'] as int,
      fileUrl: ArtWorkModel.pathToUrl(json['fileUrl'] as String),
      title: json['title'] as String,
      content: json['content'] as String,
      artworkPrice: json['artworkPrice'] as int,
      artworkSize: json['artworkSize'] as String,
      likeCnt: json['likeCnt'] as int,
      creator: json['creator'] as String,
      creatorIntroduce: json['creatorIntroduce'] as String,
      disableType: json['disableType'] as String,
      disableContent: json['disableContent'] as String,
    );

Map<String, dynamic> _$ArtWorkModelToJson(ArtWorkModel instance) =>
    <String, dynamic>{
      'artworkId': instance.artworkId,
      'userId': instance.userId,
      'fileUrl': instance.fileUrl,
      'title': instance.title,
      'creator': instance.creator,
      'creatorIntroduce': instance.creatorIntroduce,
      'disableType': instance.disableType,
      'disableContent': instance.disableContent,
      'content': instance.content,
      'artworkPrice': instance.artworkPrice,
      'artworkSize': instance.artworkSize,
      'likeCnt': instance.likeCnt,
    };
