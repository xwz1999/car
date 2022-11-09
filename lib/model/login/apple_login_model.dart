import 'package:cloud_car/model/login/wx_login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apple_login_model.g.dart';

@JsonSerializable()
class AppleLoginModel extends Equatable {
  final bool isBind;
  final String bindToken;
  final LoginInfo loginInfo;

  factory AppleLoginModel.fromJson(Map<String, dynamic> json) =>
      _$AppleLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppleLoginModelToJson(this);

  @override
  List<Object?> get props => [
        isBind,
        bindToken,
        loginInfo,
      ];

  const AppleLoginModel({
    required this.isBind,
    required this.bindToken,
    required this.loginInfo,
  });
}
