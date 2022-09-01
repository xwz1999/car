// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_car_order_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallCarOrderInfoModel _$CallCarOrderInfoModelFromJson(
        Map<String, dynamic> json) =>
    CallCarOrderInfoModel(
      id: json['id'] as int,
      modelName: json['modelName'] as String,
      mainPhoto: json['mainPhoto'] as String,
      licensingDate: json['licensingDate'] as int,
      mileage: json['mileage'] as String,
      carPrice: json['carPrice'] as String,
      createdAt: json['createdAt'] as int,
      status: json['status'] as int,
      reserveAt: json['reserveAt'] as int,
      address: json['address'] as String,
      remark: json['remark'] as String,
      amount: json['amount'] as String,
      payInfo: CallCarPay.fromJson(json['payInfo'] as Map<String, dynamic>),
      refundInfo:
          CallCarRefund.fromJson(json['refundInfo'] as Map<String, dynamic>),
      transfer: json['transfer'] as int,
      customerInfo: CallCarBrokerInfo.fromJson(
          json['customerInfo'] as Map<String, dynamic>),
      brokerInfo: CallCarBrokerInfo.fromJson(
          json['brokerInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CallCarOrderInfoModelToJson(
        CallCarOrderInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modelName': instance.modelName,
      'mainPhoto': instance.mainPhoto,
      'licensingDate': instance.licensingDate,
      'mileage': instance.mileage,
      'carPrice': instance.carPrice,
      'createdAt': instance.createdAt,
      'status': instance.status,
      'reserveAt': instance.reserveAt,
      'address': instance.address,
      'remark': instance.remark,
      'amount': instance.amount,
      'payInfo': instance.payInfo,
      'refundInfo': instance.refundInfo,
      'transfer': instance.transfer,
      'customerInfo': instance.customerInfo,
      'brokerInfo': instance.brokerInfo,
    };

CallCarPay _$CallCarPayFromJson(Map<String, dynamic> json) => CallCarPay(
      id: json['id'] as int,
      payType: json['payType'] as int,
      amount: json['amount'] as String,
      payTime: json['payTime'] as int,
    );

Map<String, dynamic> _$CallCarPayToJson(CallCarPay instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payType': instance.payType,
      'amount': instance.amount,
      'payTime': instance.payTime,
    };

CallCarRefund _$CallCarRefundFromJson(Map<String, dynamic> json) =>
    CallCarRefund(
      id: json['id'] as int,
      createdAt: json['createdAt'] as int,
      reason: json['reason'] as String,
      proof: json['proof'] as String,
      status: json['status'] as int,
      auditAt: json['auditAt'] as int,
      rejectReason: json['rejectReason'] as String,
    );

Map<String, dynamic> _$CallCarRefundToJson(CallCarRefund instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'reason': instance.reason,
      'proof': instance.proof,
      'status': instance.status,
      'auditAt': instance.auditAt,
      'rejectReason': instance.rejectReason,
    };

CallCarCustomerInfo _$CallCarCustomerInfoFromJson(Map<String, dynamic> json) =>
    CallCarCustomerInfo(
      name: json['name'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$CallCarCustomerInfoToJson(
        CallCarCustomerInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
    };

CallCarBrokerInfo _$CallCarBrokerInfoFromJson(Map<String, dynamic> json) =>
    CallCarBrokerInfo(
      name: json['name'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$CallCarBrokerInfoToJson(CallCarBrokerInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
    };
