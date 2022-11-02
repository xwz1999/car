import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_statistics_model.g.dart';

@JsonSerializable()
class OrderStatisticsModel extends Equatable {
  final int saleCount;
  final int consignmentCount;
  final int businessConsignmentCount;
  final int callCarCount;

  factory OrderStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderStatisticsModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderStatisticsModelToJson(this);
  static OrderStatisticsModel get init =>
    const  OrderStatisticsModel(saleCount: 0,
          consignmentCount: 0,
        businessConsignmentCount: 0,
          callCarCount: 0);

  const OrderStatisticsModel({
    required this.saleCount,
    required this.consignmentCount,
    required this.businessConsignmentCount,
    required this.callCarCount,
  });

  @override
  List<Object?> get props =>
      [
        saleCount,
        consignmentCount,
        businessConsignmentCount,
        callCarCount,
      ];
}
