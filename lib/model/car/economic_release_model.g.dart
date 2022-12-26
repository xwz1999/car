// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'economic_release_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EconomicReleaseModel _$EconomicReleaseModelFromJson(
        Map<String, dynamic> json) =>
    EconomicReleaseModel(
      id: json['id'] as int,
      source: json['source'] as int,
      sourceName: json['sourceName'] as String,
      mainPhoto: json['mainPhoto'] as String,
      modelName: json['modelName'] as String,
      mileage: json['mileage'] as String,
      status: json['status'] as int,
      statusName: json['statusName'] as String,
      brokerId: json['brokerId'] as int,
      brokerName: json['brokerName'] as String,
      customerId: json['customerId'] as int,
      customerName: json['customerName'] as String,
      dealerId: json['dealerId'] as int,
      dealerName: json['dealerName'] as String,
      dealerAuditAt: json['dealerAuditAt'] as num,
      auditAt: json['auditAt'] as num,
      createdAt: json['createdAt'] as num,
    );

Map<String, dynamic> _$EconomicReleaseModelToJson(
        EconomicReleaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'source': instance.source,
      'sourceName': instance.sourceName,
      'mainPhoto': instance.mainPhoto,
      'modelName': instance.modelName,
      'mileage': instance.mileage,
      'status': instance.status,
      'statusName': instance.statusName,
      'brokerId': instance.brokerId,
      'brokerName': instance.brokerName,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'dealerId': instance.dealerId,
      'dealerName': instance.dealerName,
      'dealerAuditAt': instance.dealerAuditAt,
      'auditAt': instance.auditAt,
      'createdAt': instance.createdAt,
    };
