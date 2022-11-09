import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'individual_model.g.dart';

@JsonSerializable()
class IndividualModel extends Equatable {
  final int id;
  final int status;
  final String StatusName;
  final Model model;
  final Car car;
  final Contract contract;
  final Customer customer;
  final Pay pay;

  @override
  List<Object?> get props => [id,status,StatusName,model,car,contract,customer,pay,];



  factory IndividualModel.fromJson(Map<String, dynamic> json) =>
      _$IndividualModelFromJson(json);

  Map<String, dynamic> toJson() => _$IndividualModelToJson(this);

  const IndividualModel({
    required this.id,
    required this.status,
    required this.StatusName,
    required this.model,
    required this.car,
    required this.contract,
    required this.customer,
    required this.pay,
  });
}

@JsonSerializable()
class Car extends Equatable {
  final int id;
  final String mainPhoto;
  final int licensingDate;
  final String mileage;
  final String price;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this);

  const Car({
    required this.id,
    required this.mainPhoto,
    required this.licensingDate,
    required this.mileage,
    required this.price,
  });

  @override
  List<Object?> get props =>
      [id, mainPhoto, licensingDate, mileage, price];
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


@JsonSerializable()
class Model  extends Equatable{
  final int id;
  final String name;
  final String price;

  @override
  List<Object?> get props => [id,name,];

  factory Model.fromJson(Map<String, dynamic> json) =>_$ModelFromJson(json);

  const Model({
    required this.id,
    required this.name,
    required this.price
  });
}


@JsonSerializable()
class Contract extends Equatable{

  final String contractSn;
  final int contractSignAt;
  final String vin;
  final String engine;
  final String color;
  final String mileage;
  final int transfer;
  final int keyCount;
  final int licensingDate;
  final int compulsoryInsurance;
  final int compulsoryInsuranceDate;
  final int commercialInsurance;
  final int commercialInsuranceDate;
  final String commercialInsurancePrice;

  const Contract({
    required this.contractSn,
    required this.contractSignAt,
    required this.vin,
    required this.engine,
    required this.color,
    required this.mileage,
    required this.keyCount,
    required this.compulsoryInsurance,
    required this.compulsoryInsuranceDate,
    required this.commercialInsurance,
    required this.commercialInsuranceDate,
    required this.commercialInsurancePrice,
    required this.transfer,
    required this.licensingDate
  });

  @override
  List<Object?> get props => [contractSn,contractSignAt,vin,engine,color,mileage,keyCount,compulsoryInsurance,compulsoryInsuranceDate,commercialInsurance,commercialInsuranceDate,commercialInsurancePrice,transfer];

  factory Contract.fromJson(Map<String, dynamic> json) =>_$ContractFromJson(json);


}


@JsonSerializable()
class Pay extends Equatable{
  final String saleAmount;
  final int saleAt;
  final String paymentAmount;
  final String paymentProof;
  final int paymentCreatedAt;
  @override
  List<Object?> get props => [saleAmount,saleAt,paymentAmount,paymentProof,paymentCreatedAt,];

  const Pay({
    required this.saleAmount,
    required this.saleAt,
    required this.paymentAmount,
    required this.paymentProof,
    required this.paymentCreatedAt,
  });

  factory Pay.fromJson(Map<String, dynamic> json) =>_$PayFromJson(json);
}