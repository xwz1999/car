import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'car_amount_model.g.dart';

@JsonSerializable()
class CarAmountModel extends Equatable {
  final String deposit;
  final String downPayment;
  final String balancePayment;
  final String serviceFee;
  final String serviceFeeRate;

  factory CarAmountModel.fromJson(Map<String, dynamic> json) =>
      _$CarAmountModelFromJson(json);

  const CarAmountModel({
    required this.deposit,
    required this.downPayment,
    required this.balancePayment,
    required this.serviceFee,
    required this.serviceFeeRate,
  });
  @override
  List<Object?> get props => [deposit,downPayment,balancePayment,serviceFee,serviceFeeRate,];
}
