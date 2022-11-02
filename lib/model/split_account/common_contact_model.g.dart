// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonContactModel _$CommonContactModelFromJson(Map<String, dynamic> json) =>
    CommonContactModel(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as int,
      roleName: json['roleName'] as String,
      roleId: json['roleId'] as int,
    );

Map<String, dynamic> _$CommonContactModelToJson(CommonContactModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'gender': instance.gender,
      'roleName': instance.roleName,
      'roleId': instance.roleId,
    };
