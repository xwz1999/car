// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consignment_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsignmentListModel _$ConsignmentListModelFromJson(
        Map<String, dynamic> json) =>
    ConsignmentListModel(
      id: json['id'] as int,
      contractSn: json['contractSn'] as String,
      modelName: json['modelName'] as String,
      brokerId: json['brokerId'] as int,
      brokerName: json['brokerName'] as String,
      customerId: json['customerId'] as int,
      customerName: json['customerName'] as String,
      status: json['status'] as int,
      statusName: json['statusName'] as String,
      dealerId: json['dealerId'] as int,
      dealerName: json['dealerName'] as String,
      dealerAuditAt: json['dealerAuditAt'] as num,
      signAt: json['signAt'] as num,
      essFileUrl: json['essFileUrl'] as String,
      createdAt: json['createdAt'] as num,
    );

Map<String, dynamic> _$ConsignmentListModelToJson(
        ConsignmentListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contractSn': instance.contractSn,
      'modelName': instance.modelName,
      'brokerId': instance.brokerId,
      'brokerName': instance.brokerName,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'status': instance.status,
      'statusName': instance.statusName,
      'dealerId': instance.dealerId,
      'dealerName': instance.dealerName,
      'dealerAuditAt': instance.dealerAuditAt,
      'signAt': instance.signAt,
      'essFileUrl': instance.essFileUrl,
      'createdAt': instance.createdAt,
    };
