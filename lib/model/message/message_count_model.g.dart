// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageCountModel _$MessageCountModelFromJson(Map<String, dynamic> json) =>
    MessageCountModel(
      normalCount: json['normalCount'] as int,
      customerNormalCount: json['customerNormalCount'] as int,
      customerPayCount: json['customerPayCount'] as int,
      customerTrailCount: json['customerTrailCount'] as int,
      customerInviteCount: json['customerInviteCount'] as int,
      customerCareCount: json['customerCareCount'] as int,
      billCount: json['billCount'] as int,
      carAuditCount: json['carAuditCount'] as int,
    );

Map<String, dynamic> _$MessageCountModelToJson(MessageCountModel instance) =>
    <String, dynamic>{
      'normalCount': instance.normalCount,
      'customerNormalCount': instance.customerNormalCount,
      'customerPayCount': instance.customerPayCount,
      'customerTrailCount': instance.customerTrailCount,
      'customerInviteCount': instance.customerInviteCount,
      'customerCareCount': instance.customerCareCount,
      'billCount': instance.billCount,
      'carAuditCount': instance.carAuditCount,
    };
