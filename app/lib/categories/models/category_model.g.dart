// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      index: json['index'] as int,
      category: $enumDecode(_$CategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'index': instance.index,
      'category': _$CategoryEnumMap[instance.category]!,
    };

const _$CategoryEnumMap = {
  Category.drawing: 'drawing',
  Category.webtoon: 'webtoon',
  Category.photography: 'photography',
  Category.characterGoods: 'characterGoods',
  Category.beauty: 'beauty',
  Category.living: 'living',
  Category.fashionAccessories: 'fashionAccessories',
  Category.pets: 'pets',
  Category.music: 'music',
};
