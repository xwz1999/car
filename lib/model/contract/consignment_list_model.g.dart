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
      customerName: json['customerName'] as String,
      status: json['status'] as int,
      signAt: json['signAt'] as num,
    );

Map<String, dynamic> _$ConsignmentListModelToJson(
        ConsignmentListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contractSn': instance.contractSn,
      'modelName': instance.modelName,
      'customerName': instance.customerName,
      'status': instance.status,
      'signAt': instance.signAt,
    };
