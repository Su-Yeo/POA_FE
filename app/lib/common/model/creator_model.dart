import 'package:app/common/model/art_work_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'creator_model.g.dart';

@JsonSerializable()
class CreatorModel {
  final String name;
  @JsonKey(
    fromJson: pathToUrl,
  )
  final String profileUrl;
  final String story;
  final String disabledType;
  final String disabledText;
  final List<ArtWorkModel> artworkDtoList;

  CreatorModel({
    required this.name,
    required this.profileUrl,
    required this.story,
    required this.disabledType,
    required this.disabledText,
    required this.artworkDtoList,
  });

  static pathToUrl(String value) {
    return "http://192.168.71.5:8080/$value";
  }

  factory CreatorModel.fromJson(Map<String, dynamic> json) =>
      _$CreatorModelFromJson(json);
}
