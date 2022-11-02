// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrokerModel _$BrokerModelFromJson(Map<String, dynamic> json) => BrokerModel(
      id: json['id'] as int,
      nickname: json['nickname'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as int,
      businessId: json['businessId'] as int,
      businessNo: json['businessNo'] as String,
      businessName: json['businessName'] as String,
      businessAddress: json['businessAddress'] as String,
      businessPhone: json['businessPhone'] as String,
      roleName: json['roleName'] as String,
    );

Map<String, dynamic> _$BrokerModelToJson(BrokerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'phone': instance.phone,
      'gender': instance.gender,
      'businessId': instance.businessId,
      'businessNo': instance.businessNo,
      'businessName': instance.businessName,
      'businessAddress': instance.businessAddress,
      'businessPhone': instance.businessPhone,
      'roleName': instance.roleName,
    };
