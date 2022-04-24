// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  String inviteCode;
  String nickname;
  String headImg;
  int level;
  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

//<editor-fold desc="Data Methods">

  UserInfoModel({
    required this.inviteCode,
    required this.nickname,
    required this.headImg,
    required this.level,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserInfoModel &&
          runtimeType == other.runtimeType &&
          inviteCode == other.inviteCode &&
          nickname == other.nickname &&
          headImg == other.headImg &&
          level == other.level);

  @override
  int get hashCode =>
      inviteCode.hashCode ^
      nickname.hashCode ^
      headImg.hashCode ^
      level.hashCode;

  @override
  String toString() {
    return 'UserInfoModel{' +
        ' inviteCode: $inviteCode,' +
        ' nickname: $nickname,' +
        ' headImg: $headImg,' +
        ' level: $level,' +
        '}';
  }

  UserInfoModel copyWith({
    String? inviteCode,
    String? nickname,
    String? headImg,
    int? level,
  }) {
    return UserInfoModel(
      inviteCode: inviteCode ?? this.inviteCode,
      nickname: nickname ?? this.nickname,
      headImg: headImg ?? this.headImg,
      level: level ?? this.level,
    );
  }


//</editor-fold>
}
