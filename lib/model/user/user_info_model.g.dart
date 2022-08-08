// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      inviteCode: json['inviteCode'] as String,
      nickname: json['nickname'] as String,
      headImg: json['headImg'] as String,
      level: json['level'] as int,
      phone: json['phone'] as String,
      gender: json['gender'] as int,
      data: ExtraData.fromJson(json['data'] as Map<String, dynamic>),
      store: StoreInfo.fromJson(json['store'] as Map<String, dynamic>),
      businessId: json['businessId'] as int,
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'inviteCode': instance.inviteCode,
      'nickname': instance.nickname,
      'headImg': instance.headImg,
      'level': instance.level,
      'phone': instance.phone,
      'gender': instance.gender,
      'data': instance.data,
      'store': instance.store,
      'businessId': instance.businessId,
    };

ExtraData _$ExtraDataFromJson(Map<String, dynamic> json) => ExtraData(
      assessCount: json['assessCount'] as int,
      balance: json['balance'] as String,
      inviteCount: json['inviteCount'] as int,
    );

Map<String, dynamic> _$ExtraDataToJson(ExtraData instance) => <String, dynamic>{
      'assessCount': instance.assessCount,
      'balance': instance.balance,
      'inviteCount': instance.inviteCount,
    };

StoreInfo _$StoreInfoFromJson(Map<String, dynamic> json) => StoreInfo(
      storeName: json['storeName'] as String,
      roleName: json['roleName'] as String,
      roleId: json['roleId'] as int,
    );

Map<String, dynamic> _$StoreInfoToJson(StoreInfo instance) => <String, dynamic>{
      'storeName': instance.storeName,
      'roleName': instance.roleName,
      'roleId': instance.roleId,
    };
