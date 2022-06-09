import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_statistics_model.g.dart';

@JsonSerializable()
class OrderStatisticsModel extends Equatable {
  final int saleCount;
  final int consignmentCount;
  final int dealerConsignmentCount;
  final int callCarCount;

  factory OrderStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderStatisticsModelFromJson(json);

  static OrderStatisticsModel get init =>
    const  OrderStatisticsModel(saleCount: 0,
          consignmentCount: 0,
          dealerConsignmentCount: 0,
          callCarCount: 0);

  const OrderStatisticsModel({
    required this.saleCount,
    required this.consignmentCount,
    required this.dealerConsignmentCount,
    required this.callCarCount,
  });

  @override
  List<Object?> get props =>
      [
        saleCount,
        consignmentCount,
        dealerConsignmentCount,
        callCarCount,
      ];
}
