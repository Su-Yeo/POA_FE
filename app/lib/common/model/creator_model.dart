import 'package:app/common/model/art_work_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'creator_model.g.dart';

@JsonSerializable()
class CreatorModel {
  final String name;
  @JsonKey(
    name: 'profile_url',
  )
  final String profileUrl;
  final String story;
  @JsonKey(
    name: 'disabled_type',
  )
  final String disabledType;
  @JsonKey(
    name: 'disabled_text',
  )
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

  factory CreatorModel.fromJson(Map<String, dynamic> json) =>
      _$CreatorModelFromJson(json);
}
