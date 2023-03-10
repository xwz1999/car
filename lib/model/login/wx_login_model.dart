import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wx_login_model.g.dart';

@JsonSerializable()
class WxLoginModel extends Equatable {
  final bool isBind;
  final String bindToken;
  final LoginInfo loginInfo;

  factory WxLoginModel.fromJson(Map<String, dynamic> json) =>
      _$WxLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$WxLoginModelToJson(this);
  const WxLoginModel({
    required this.isBind,
    required this.bindToken,
    required this.loginInfo,
  });

  @override
  List<Object?> get props => [
        isBind,
        bindToken,
        loginInfo,
      ];
}

@JsonSerializable()
class LoginInfo extends Equatable {
  final String token;
  final User user;

  factory LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginInfoToJson(this);
  const LoginInfo({
    required this.token,
    required this.user,
  });

  @override
  List<Object?> get props => [token, user];
}

@JsonSerializable()
class User extends Equatable {
  final String nickname;
  final String headImg;
  final int level;

  const User({
    required this.nickname,
    required this.headImg,
    required this.level,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
  @override
  List<Object?> get props => [
        nickname,
        headImg,
        level,
      ];
}
