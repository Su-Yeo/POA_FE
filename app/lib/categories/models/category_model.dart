import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

enum Category {
  drawing,
  webtoon,
  photography,
  characterGoods,
  beauty,
  living,
  fashionAccessories,
  pets,
  music,
}

// String useCategory(Category category) {
//   switch (category) {
//     case Category.drawing:
//       return "그림";
//     case Category.webtoon:
//       return "웹툰";
//     case Category.photography:
//       return "사진";
//     case Category.characterGoods:
//       return "캐릭터·굿즈";
//     case Category.beauty:
//       return "화장품·뷰티";
//     case Category.living:
//       return "홈·리빙";
//     case Category.fashionAccessories:
//       return "패션·액세서리";
//     case Category.pets:
//       return "반려동물";
//     case Category.music:
//       return "음악·공연";
//   }
// }

@JsonSerializable()
class CategoryModel {
  final int index;
  final Category category;

  CategoryModel({
    required this.index,
    required this.category,
  });

  factory CategoryModel.fronJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
