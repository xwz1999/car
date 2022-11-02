// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatisticsModel _$OrderStatisticsModelFromJson(
        Map<String, dynamic> json) =>
    OrderStatisticsModel(
      saleCount: json['saleCount'] as int,
      consignmentCount: json['consignmentCount'] as int,
      businessConsignmentCount: json['businessConsignmentCount'] as int,
      callCarCount: json['callCarCount'] as int,
    );

Map<String, dynamic> _$OrderStatisticsModelToJson(
        OrderStatisticsModel instance) =>
    <String, dynamic>{
      'saleCount': instance.saleCount,
      'consignmentCount': instance.consignmentCount,
      'businessConsignmentCount': instance.businessConsignmentCount,
      'callCarCount': instance.callCarCount,
    };
