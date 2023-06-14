import 'package:json_annotation/json_annotation.dart';

part 'art_work_model.g.dart';

@JsonSerializable()
class ArtWorkModel {
  @JsonKey(
    name: 'artwork_id',
  )
  final int artworkId;
  @JsonKey(
    name: 'user_id',
  )
  final int userId;
  @JsonKey(
    name: 'user_name',
  )
  final String userName;
  @JsonKey(
    name: 'file_url',
  )
  final String fileUrl;
  final String title;

  final String content;
  @JsonKey(
    name: 'artwork_price',
  )
  final int artworkPrice;
  @JsonKey(
    name: 'artwork_size',
  )
  final String artworkSize;
  @JsonKey(
    name: 'artwork_state',
  )
  final int artworkState;
  final bool like;

  ArtWorkModel({
    required this.artworkId,
    required this.userId,
    required this.userName,
    required this.fileUrl,
    required this.title,
    required this.content,
    required this.artworkPrice,
    required this.artworkSize,
    required this.artworkState,
    required this.like,
  });

  factory ArtWorkModel.fromJson(Map<String, dynamic> json) =>
      _$ArtWorkModelFromJson(json);
}
