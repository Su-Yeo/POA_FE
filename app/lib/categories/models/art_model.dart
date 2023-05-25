import 'package:json_annotation/json_annotation.dart';

part 'art_model.g.dart';

@JsonSerializable()
class ArtModel {
  // 작품의 고유 아이디
  final int artId;

  // 작가 이름 (creatorId)
  final String creatorName;

  // 작가 아바타 (DB상 없음)
  final String creatorAvatar;

  // 작품 사진이 여러 개 (String -> List<String>)
  final List<String> artImages;

  // 작품 타이틀
  final String artTitle;

  // 작품 소개 (2줄 정도)
  final String artContent;

  // 작품 카테고리
  final String artCategory;

  // 작품 태그 (DB상 없음)
  final List<String>? artTags;

  // 작품 생성일
  final String created;

  // 작품 수정일
  final String? updated;

  // 받은 좋아요 수 (DB상 없음)
  final int totalFavCount;

  // 펀딩 작품인지 그냥 작품인지 (기본값 true)
  final bool isOnFunding;

  // 펀딩 시작일 (ex: '2023-03-15' ?? 20230315 파싱여부)
  final String? fundingStartDate;

  // 펀딩기간 (ex: 30이면 지정일로부터 30일까지)
  final int? fundingPeriod;

  // 펀딩금액
  final int? fundingPrice;

  ArtModel({
    required this.artId,
    required this.creatorName,
    required this.creatorAvatar,
    required this.artImages,
    required this.artTitle,
    required this.artContent,
    required this.artCategory,
    this.artTags,
    required this.created,
    this.updated,
    this.totalFavCount = 0,
    this.isOnFunding = true,
    this.fundingStartDate,
    this.fundingPeriod,
    this.fundingPrice,
  });

  factory ArtModel.fronJson(Map<String, dynamic> json) =>
      _$ArtModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArtModelToJson(this);
}
