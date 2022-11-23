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
      business: Business.fromJson(json['business'] as Map<String, dynamic>),
      // businessId: json['businessId'] as int,
      // businessName: json['businessName'] as String,
      partner: Partner.fromJson(json['partner'] as Map<String, dynamic>),
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
      'business': instance.business,
      'partner': instance.partner,
      // 'businessId': instance.businessId,
      // 'businessName': instance.businessName,
    };

Partner _$PartnerFromJson(Map<String, dynamic> json) => Partner(
      isPartner: json['isPartner'] as int,
      expireDate: json['expireDate'] as int,
    );

Map<String, dynamic> _$PartnerToJson(Partner instance) => <String, dynamic>{
      'isPartner': instance.isPartner,
      'expireDate': instance.expireDate,
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

Business _$StoreInfoFromJson(Map<String, dynamic> json) => Business(
      storeName: json['storeName'] as String,
      roleName: json['roleName'] as String,
      roleId: json['roleId'] as int,
      businessName: json['businessName'] as String,
      storeId: json['storeId'] as int,
      businessId: json['businessId'] as int,
    );

Map<String, dynamic> _$StoreInfoToJson(Business instance) => <String, dynamic>{
      'storeName': instance.storeName,
      'roleName': instance.roleName,
      'businessName':instance.businessName,
      'roleId': instance.roleId,
      'storeId': instance.storeId,
      'businessId': instance.businessId,
    };
