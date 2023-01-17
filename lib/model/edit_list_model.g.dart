// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditListModel _$EditListModelFromJson(Map<String, dynamic> json) =>
    EditListModel(
      id: json['id'] as int,
      carId: json['carId'] as int,
      mainPhoto: json['mainPhoto'] as String,
      modelName: json['modelName'] as String,
      mileage: json['mileage'] as String,
      licensingDate: json['licensingDate'] as num,
      brokerId: json['brokerId'] as int,
      brokerName: json['brokerName'] as String,
      dealerId: json['dealerId'] as int,
      dealerName: json['dealerName'] as String,
      auditStatus: json['auditStatus'] as int,
      auditStatusName: json['auditStatusName'] as String,
      dealerAuditAt: json['dealerAuditAt'] as num,
      createdAt: json['createdAt'] as num,
    );

// Map<String, dynamic> _$EditListModelToJson(EditListModel instance) =>
//     <String, dynamic>{
//       'id': instance.id,
//       'carId': instance.carId,
//       'mainPhoto': instance.mainPhoto,
//       'modelName': instance.modelName,
//       'mileage': instance.mileage,
//       'licensingDate': instance.licensingDate,
//       'brokerId': instance.brokerId,
//       'brokerName': instance.brokerName,
//       'dealerId': instance.dealerId,
//       'dealerName': instance.dealerName,
//       'auditStatus': instance.auditStatus,
//       'auditStatusName': instance.auditStatusName,
//       'dealerAuditAt': instance.dealerAuditAt,
//       'createdAt': instance.createdAt,
//     };
