import 'package:json_annotation/json_annotation.dart';

part 'art_work_model.g.dart';

@JsonSerializable()
class ArtWorkModel {
  final int artworkId;
  final int userId;
  @JsonKey(
    fromJson: pathToUrl,
  )
  final String fileUrl;
  final String title;
  final String creator;
  final String creatorIntroduce;
  final String disableType;
  final String disableContent;
  final String content;
  final int artworkPrice;
  final String artworkSize;
  final int likeCnt;

  ArtWorkModel({
    required this.artworkId,
    required this.userId,
    required this.fileUrl,
    required this.title,
    required this.content,
    required this.artworkPrice,
    required this.artworkSize,
    required this.likeCnt,
    required this.creator,
    required this.creatorIntroduce,
    required this.disableType,
    required this.disableContent,
  });

  static pathToUrl(String value) {
    return "http://192.168.71.5:8080/$value";
  }

  factory ArtWorkModel.fromJson(Map<String, dynamic> json) =>
      _$ArtWorkModelFromJson(json);
}
