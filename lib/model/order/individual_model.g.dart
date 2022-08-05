// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndividualModel _$IndividualModelFromJson(Map<String, dynamic> json) =>
    IndividualModel(
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

Map<String, dynamic> _$IndividualModelToJson(IndividualModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'car': instance.car,
      'contractSn': instance.contractSn,
      'contractSignAt': instance.contractSignAt,
      'saleAmount': instance.saleAmount,
      'saleAt': instance.saleAt,
      'paymentAmount': instance.paymentAmount,
      'paymentProof': instance.paymentProof,
      'paymentCreatedAt': instance.paymentCreatedAt,
      'customer': instance.customer,
    };

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      id: json['id'] as int,
      mainPhoto: json['mainPhoto'] as String,
      modelName: json['modelName'] as String,
      licensingDate: json['licensingDate'] as int,
      mileage: json['mileage'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'id': instance.id,
      'mainPhoto': instance.mainPhoto,
      'modelName': instance.modelName,
      'licensingDate': instance.licensingDate,
      'mileage': instance.mileage,
      'price': instance.price,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as int,
      nickname: json['nickname'] as String,
      mobile: json['mobile'] as String,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'mobile': instance.mobile,
    };
