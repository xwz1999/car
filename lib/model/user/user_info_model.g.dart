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
      data: ExtraData.fromJson(json['data'] as Map<String, dynamic>),
      store: StoreInfo.fromJson(json['store'] as Map<String, dynamic>),
    );

ExtraData _$ExtraDataFromJson(Map<String, dynamic> json) => ExtraData(
      assessCount: json['assessCount'] as int,
      balance: json['balance'] as String,
      inviteCount: json['inviteCount'] as int,
    );

StoreInfo _$StoreInfoFromJson(Map<String, dynamic> json) => StoreInfo(
      storeName: json['storeName'] as String,
      roleName: json['roleName'] as String,
    );
