import 'package:json_annotation/json_annotation.dart';

part 'buying_model.g.dart';

@JsonSerializable()
class BuyingModel {
  final int artworkId;
  final int userId;
  final String buyAddress;
  final int payPrice;
  final int visible;
  final int buyState;
  final int buyInfoId;

  BuyingModel({
    required this.artworkId,
    required this.userId,
    required this.buyAddress,
    required this.payPrice,
    required this.visible,
    required this.buyState,
    required this.buyInfoId,
  });

  factory BuyingModel.fromJson(Map<String, dynamic> json) =>
      _$BuyingModelFromJson(json);
}
