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
