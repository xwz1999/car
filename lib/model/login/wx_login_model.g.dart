// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wx_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WxLoginModel _$WxLoginModelFromJson(Map<String, dynamic> json) => WxLoginModel(
      isBind: json['isBind'] as bool,
      bindToken: json['bindToken'] as String,
      loginInfo: LoginInfo.fromJson(json['loginInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WxLoginModelToJson(WxLoginModel instance) =>
    <String, dynamic>{
      'isBind': instance.isBind,
      'bindToken': instance.bindToken,
      'loginInfo': instance.loginInfo,
    };

LoginInfo _$LoginInfoFromJson(Map<String, dynamic> json) => LoginInfo(
      token: json['token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginInfoToJson(LoginInfo instance) => <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      nickname: json['nickname'] as String,
      headImg: json['headImg'] as String,
      level: json['level'] as int,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'headImg': instance.headImg,
      'level': instance.level,
    };
