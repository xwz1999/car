import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'car_price_history_model.g.dart';

@JsonSerializable()
class CarPriceHistoryModel extends Equatable {
  final String interiorPrice;
  final String exteriorPrice;
  final String preInteriorPrice;
  final String preExteriorPrice;
  final String description;
  final num createdAt;

  factory CarPriceHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$CarPriceHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarPriceHistoryModelToJson(this);

  const CarPriceHistoryModel({
    required this.interiorPrice,
    required this.exteriorPrice,
    required this.preInteriorPrice,
    required this.preExteriorPrice,
    required this.description,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        interiorPrice,
        exteriorPrice,
        preInteriorPrice,
        preExteriorPrice,
        description,
        createdAt,
      ];
}
