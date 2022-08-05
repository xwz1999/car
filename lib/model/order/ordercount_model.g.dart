// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordercount_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdercountModel _$OrdercountModelFromJson(Map<String, dynamic> json) =>
    OrdercountModel(
      saleCount: json['saleCount'] as int,
      consignmentCount: json['consignmentCount'] as int,
      dealerConsignmentCount: json['dealerConsignmentCount'] as int,
      callCarCount: json['callCarCount'] as int,
    );

Map<String, dynamic> _$OrdercountModelToJson(OrdercountModel instance) =>
    <String, dynamic>{
      'saleCount': instance.saleCount,
      'consignmentCount': instance.consignmentCount,
      'dealerConsignmentCount': instance.dealerConsignmentCount,
      'callCarCount': instance.callCarCount,
    };
