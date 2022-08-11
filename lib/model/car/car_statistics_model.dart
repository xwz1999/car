import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'car_statistics_model.g.dart';

@JsonSerializable()
class CarStatisticsModel extends Equatable {
  final int sellCount;
  final int reserveCount;
  final int soldCount;
  final int backOutCount;
  final int allSellCount;

  factory CarStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$CarStatisticsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarStatisticsModelToJson(this);

  static CarStatisticsModel get init => const CarStatisticsModel(
      sellCount: 0,
      reserveCount: 0,
      soldCount: 0,
      backOutCount: 0,
      allSellCount: 0);

  @override
  List<Object?> get props => [
        sellCount,
        reserveCount,
        soldCount,
        backOutCount,
        allSellCount,
      ];

  const CarStatisticsModel({
    required this.sellCount,
    required this.reserveCount,
    required this.soldCount,
    required this.backOutCount,
    required this.allSellCount,
  });
}
