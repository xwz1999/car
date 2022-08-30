// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apple_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppleLoginModel _$AppleLoginModelFromJson(Map<String, dynamic> json) =>
    AppleLoginModel(
      isBind: json['isBind'] as bool,
      bindToken: json['bindToken'] as String,
      loginInfo: LoginInfo.fromJson(json['loginInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppleLoginModelToJson(AppleLoginModel instance) =>
    <String, dynamic>{
      'isBind': instance.isBind,
      'bindToken': instance.bindToken,
      'loginInfo': instance.loginInfo,
    };
