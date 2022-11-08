// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndividualModel _$IndividualModelFromJson(Map<String, dynamic> json) =>
    IndividualModel(
      id: json['id'] as int,
      status: json['status'] as int,
      StatusName: json['StatusName'] as String,
      model: Model.fromJson(json['model'] as Map<String, dynamic>),
      car: Car.fromJson(json['car'] as Map<String, dynamic>),
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
      pay: Pay.fromJson(json['pay'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndividualModelToJson(IndividualModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'StatusName': instance.StatusName,
      'model': instance.model,
      'car': instance.car,
      'contract': instance.contract,
      'customer': instance.customer,
      'pay': instance.pay,
    };

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      id: json['id'] as int,
      mainPhoto: json['mainPhoto'] as String,
      licensingDate: json['licensingDate'] as int,
      mileage: json['mileage'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'id': instance.id,
      'mainPhoto': instance.mainPhoto,
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

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      id: json['id'] as int,
      name: json['name'] as String,
      price:json['price'] as String
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Contract _$ContractFromJson(Map<String, dynamic> json) => Contract(
      contractSn: json['contractSn'] as String,
      contractSignAt: json['contractSignAt'] as int,
      vin: json['vin'] as String,
      engine: json['engine'] as String,
      color: json['color'] as String,
      mileage: json['mileage'] as String,
      keyCount: json['keyCount'] as int,
      compulsoryInsurance: json['compulsoryInsurance'] as int,
      compulsoryInsuranceDate: json['compulsoryInsuranceDate'] as int,
      commercialInsurance: json['commercialInsurance'] as int,
      commercialInsuranceDate: json['commercialInsuranceDate'] as int,
      commercialInsurancePrice: json['commercialInsurancePrice'] as String,
    );

Map<String, dynamic> _$ContractToJson(Contract instance) => <String, dynamic>{
      'contractSn': instance.contractSn,
      'contractSignAt': instance.contractSignAt,
      'vin': instance.vin,
      'engine': instance.engine,
      'color': instance.color,
      'mileage': instance.mileage,
      'keyCount': instance.keyCount,
      'compulsoryInsurance': instance.compulsoryInsurance,
      'compulsoryInsuranceDate': instance.compulsoryInsuranceDate,
      'commercialInsurance': instance.commercialInsurance,
      'commercialInsuranceDate': instance.commercialInsuranceDate,
      'commercialInsurancePrice': instance.commercialInsurancePrice,
    };

Pay _$PayFromJson(Map<String, dynamic> json) => Pay(
      saleAmount: json['saleAmount'] as String,
      saleAt: json['saleAt'] as int,
      paymentAmount: json['paymentAmount'] as String,
      paymentProof: json['paymentProof'] as String,
      paymentCreatedAt: json['paymentCreatedAt'] as int,
    );

Map<String, dynamic> _$PayToJson(Pay instance) => <String, dynamic>{
      'saleAmount': instance.saleAmount,
      'saleAt': instance.saleAt,
      'paymentAmount': instance.paymentAmount,
      'paymentProof': instance.paymentProof,
      'paymentCreatedAt': instance.paymentCreatedAt,
    };
