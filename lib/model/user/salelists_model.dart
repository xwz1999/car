import 'package:cloud_car/ui/user/user_order/status.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'salelists_model.g.dart';

@JsonSerializable()
class SalelistsModel extends Equatable {
  final int id;
  final int status;
  final int createdAt;
  final String mainPhoto;
  final String modelName;
  final int licensingDate;
  final String mileage;
  final String amount;
  final String deposit;
  final String downPayment;
  final String balancePayment;

  factory SalelistsModel.fromJson(Map<String, dynamic> json) =>
      _$SalelistsModelFromJson(json);

  OrderSaleStatus get statusEnum => OrderSaleStatus.getStatus(status);

  //OrderSaleStatus get statusEnum1 => OrderSaleStatus.getStatus1(statusEnum.str);

  @override
  List<Object?> get props => [
        id,
        status,
        createdAt,
        mainPhoto,
        modelName,
        licensingDate,
        mileage,
        amount,
        deposit,
        downPayment,
        balancePayment
      ];

  const SalelistsModel({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.mainPhoto,
    required this.modelName,
    required this.licensingDate,
    required this.mileage,
    required this.amount,
    required this.deposit,
    required this.downPayment,
    required this.balancePayment,
  });
}
