// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staffinfo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffInfoModel _$StaffInfoModelFromJson(Map<String, dynamic> json) =>
    StaffInfoModel(
      id: json['id'] as int,
      name: json['name'] as String,
      gender: json['gender'] as int,
      phone: json['phone'] as String,
      storeId: json['storeId'] as int,
      storeName: json['storeName'] as String,
      roleId: json['roleId'] as int,
      roleName: json['roleName'] as String,
      commission: json['commission'] as String,
      status: json['status'] as int,
      auditStatus: json['auditStatus'] as int,
    );

Map<String, dynamic> _$StaffInfoModelToJson(StaffInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'phone': instance.phone,
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'roleId': instance.roleId,
      'roleName': instance.roleName,
      'commission': instance.commission,
      'status': instance.status,
      'auditStatus': instance.auditStatus,
    };
