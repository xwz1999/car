// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'Individual_consignment_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndividualConsignmentInfoModel _$IndividualConsignmentInfoModelFromJson(
        Map<String, dynamic> json) =>
    IndividualConsignmentInfoModel(
      id: json['id'] as int,
      status: json['status'] as int,
      car: Car.fromJson(json['car'] as Map<String, dynamic>),
      contractSn: json['contractSn'] as String,
      contractSignAt: json['contractSignAt'] as int,
      saleAmount: json['saleAmount'] as String,
      saleAt: json['saleAt'] as int,
      paymentAmount: json['paymentAmount'] as String,
      paymentProof: json['paymentProof'] as String,
      paymentCreatedAt: json['paymentCreatedAt'] as int,
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      id: json['id'] as int,
      mainPhoto: json['mainPhoto'] as String,
      modelName: json['modelName'] as String,
      licensingDate: json['licensingDate'] as int,
      mileage: json['mileage'] as String,
      price: json['price'] as String,
    );

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as int,
      nickname: json['nickname'] as String,
      mobile: json['mobile'] as String,
    );
