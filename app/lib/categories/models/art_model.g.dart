// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtModel _$ArtModelFromJson(Map<String, dynamic> json) => ArtModel(
      artId: json['artId'] as int,
      creatorName: json['creatorName'] as String,
      creatorAvatar: json['creatorAvatar'] as String,
      artImages:
          (json['artImages'] as List<dynamic>).map((e) => e as String).toList(),
      artTitle: json['artTitle'] as String,
      artContent: json['artContent'] as String,
      artCategory: json['artCategory'] as String,
      artTags:
          (json['artTags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      created: json['created'] as String,
      updated: json['updated'] as String?,
      totalFavCount: json['totalFavCount'] as int? ?? 0,
      isOnFunding: json['isOnFunding'] as bool? ?? true,
      fundingStartDate: json['fundingStartDate'] as String?,
      fundingPeriod: json['fundingPeriod'] as int?,
      fundingPrice: json['fundingPrice'] as int?,
    );

Map<String, dynamic> _$ArtModelToJson(ArtModel instance) => <String, dynamic>{
      'artId': instance.artId,
      'creatorName': instance.creatorName,
      'creatorAvatar': instance.creatorAvatar,
      'artImages': instance.artImages,
      'artTitle': instance.artTitle,
      'artContent': instance.artContent,
      'artCategory': instance.artCategory,
      'artTags': instance.artTags,
      'created': instance.created,
      'updated': instance.updated,
      'totalFavCount': instance.totalFavCount,
      'isOnFunding': instance.isOnFunding,
      'fundingStartDate': instance.fundingStartDate,
      'fundingPeriod': instance.fundingPeriod,
      'fundingPrice': instance.fundingPrice,
    };
