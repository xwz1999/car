// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_all_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffAllModel _$StaffAllModelFromJson(Map<String, dynamic> json) =>
    StaffAllModel(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      auditStatus: json['auditStatus'] as int,
      roleId: json['roleId'] as int,
      roleName: json['roleName'] as String,
      gender: json['gender'] as int,
      brokerId: json['brokerId'] as int,
    );

Map<String, dynamic> _$StaffAllModelToJson(StaffAllModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'auditStatus': instance.auditStatus,
      'roleId': instance.roleId,
      'roleName': instance.roleName,
      'gender': instance.gender,
      'brokerId': instance.brokerId,
    };
