import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consignment_info_model.g.dart';

@JsonSerializable()
class ConsignmentInfoModel extends Equatable {
  final int id;
  final int status;
  final Car car;
  final String contractSn;
  final num contractSignAt;
  final String saleAmount;
  final num saleAt;
  final String paymentAmount;
  final String paymentProof;
  final num paymentCreatedAt;
  final Customer customer;

  factory ConsignmentInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ConsignmentInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConsignmentInfoModelToJson(this);
  @override
  List<Object?> get props => [
        id,
        status,
        car,
        contractSn,
        contractSignAt,
        saleAmount,
        saleAt,
        paymentAmount,
        customer,
        paymentProof,
        paymentCreatedAt
      ];

  const ConsignmentInfoModel({
    required this.id,
    required this.status,
    required this.car,
    required this.contractSn,
    required this.contractSignAt,
    required this.saleAmount,
    required this.saleAt,
    required this.paymentAmount,
    required this.paymentProof,
    required this.paymentCreatedAt,
    required this.customer,
  });
}

@JsonSerializable()
class Car extends Equatable {
  final int id;
  final String mainPhoto;
  final String modelName;
  final num licensingDate;
  final String mileage;
  final String price;
  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this);
  const Car({
    required this.id,
    required this.mainPhoto,
    required this.modelName,
    required this.licensingDate,
    required this.mileage,
    required this.price,
  });
  @override
  List<Object?> get props =>
      [id, mainPhoto, modelName, licensingDate, mileage, price];
}

@JsonSerializable()
class Customer extends Equatable {
  final int id;
  final String nickname;
  final String mobile;
  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
  const Customer({
    required this.id,
    required this.nickname,
    required this.mobile,
  });
  @override
  List<Object?> get props => [id, nickname, mobile];
}
