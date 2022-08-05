import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ordercount_model.g.dart';


@JsonSerializable()
class OrdercountModel extends Equatable{
  final int saleCount;
  final int consignmentCount;
  final int dealerConsignmentCount;
  final int callCarCount;
    factory OrdercountModel.fromJson(Map<String, dynamic> json) =>_$OrdercountModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrdercountModelToJson(this);
  const OrdercountModel({
    required this.saleCount,
    required this.consignmentCount,
    required this.dealerConsignmentCount,
    required this.callCarCount,
  });
  @override
  List<Object?> get props => [saleCount,consignmentCount,dealerConsignmentCount,callCarCount,];
}