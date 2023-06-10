// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buying_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyingModel _$BuyingModelFromJson(Map<String, dynamic> json) => BuyingModel(
      artworkId: json['artworkId'] as int,
      userId: json['userId'] as int,
      buyAddress: json['buyAddress'] as String,
      payPrice: json['payPrice'] as int,
      visible: json['visible'] as int,
      buyState: json['buyState'] as int,
      buyInfoId: json['buyInfoId'] as int,
    );

Map<String, dynamic> _$BuyingModelToJson(BuyingModel instance) =>
    <String, dynamic>{
      'artworkId': instance.artworkId,
      'userId': instance.userId,
      'buyAddress': instance.buyAddress,
      'payPrice': instance.payPrice,
      'visible': instance.visible,
      'buyState': instance.buyState,
      'buyInfoId': instance.buyInfoId,
    };
