// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_amount_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarAmountModel _$CarAmountModelFromJson(Map<String, dynamic> json) =>
    CarAmountModel(
      deposit: json['deposit'] as String,
      downPayment: json['downPayment'] as String,
      balancePayment: json['balancePayment'] as String,
      serviceFee: json['serviceFee'] as String,
      serviceFeeRate: json['serviceFeeRate'] as String,
    );

Map<String, dynamic> _$CarAmountModelToJson(CarAmountModel instance) =>
    <String, dynamic>{
      'deposit': instance.deposit,
      'downPayment': instance.downPayment,
      'balancePayment': instance.balancePayment,
      'serviceFee': instance.serviceFee,
      'serviceFeeRate': instance.serviceFeeRate,
    };
