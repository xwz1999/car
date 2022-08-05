import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

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

  Map<String, dynamic> toJson() => _$CarAmountModelToJson(this);

  const CarAmountModel({
    required this.deposit,
    required this.downPayment,
    required this.balancePayment,
    required this.serviceFee,
    required this.serviceFeeRate,
  });

  @override
  List<Object?> get props => [
        deposit,
        downPayment,
        balancePayment,
        serviceFee,
        serviceFeeRate,
      ];
}
