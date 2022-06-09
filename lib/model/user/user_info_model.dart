import 'package:cloud_car/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  String inviteCode;
  String nickname;
  String headImg;
  int level;
  String phone;
  int gender;
  ExtraData data;
  StoreInfo store;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  static UserInfoModel get fail => UserInfoModel(
      inviteCode: '',
      nickname: '',
      headImg: '',
      level: 0,
      phone: '',
      gender: 0,
      data: const ExtraData(
        assessCount: 0,
        inviteCount: 0,
        balance: '',
      ),
      store: const StoreInfo(storeName: '', roleName: ''));

  Map<int, String> get levelMap => {
        1: '基础用户',
        2: '独立合伙人',
        3: '入驻商',
      };

  Gender1 get genderEM => Gender1.getValue(gender);

//<editor-fold desc="Data Methods">

  UserInfoModel({
    required this.inviteCode,
    required this.nickname,
    required this.headImg,
    required this.level,
    required this.phone,
    required this.gender,
    required this.data,
    required this.store,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserInfoModel &&
          runtimeType == other.runtimeType &&
          inviteCode == other.inviteCode &&
          nickname == other.nickname &&
          headImg == other.headImg &&
          level == other.level &&
          phone == other.phone &&
          gender == other.gender &&
          data == other.data &&
          store == other.store);

  @override
  int get hashCode =>
      inviteCode.hashCode ^
      nickname.hashCode ^
      headImg.hashCode ^
      level.hashCode ^
      phone.hashCode ^
      gender.hashCode ^
      data.hashCode ^
      store.hashCode;

  @override
  String toString() {
    return 'UserInfoModel{ inviteCode: $inviteCode, nickname: $nickname, headImg: $headImg, level: $level, phone: $phone, gender: $gender, data: $data, store: $store,}';
  }

  UserInfoModel copyWith({
    String? inviteCode,
    String? nickname,
    String? headImg,
    int? level,
    String? phone,
    int? gender,
    ExtraData? data,
    StoreInfo? store,
  }) {
    return UserInfoModel(
      inviteCode: inviteCode ?? this.inviteCode,
      nickname: nickname ?? this.nickname,
      headImg: headImg ?? this.headImg,
      level: level ?? this.level,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      data: data ?? this.data,
      store: store ?? this.store,
    );
  }

//</editor-fold>
}

@JsonSerializable()
class ExtraData extends Equatable {
  final int assessCount;
  final String balance;
  final int inviteCount;

  factory ExtraData.fromJson(Map<String, dynamic> json) =>
      _$ExtraDataFromJson(json);

  const ExtraData({
    required this.assessCount,
    required this.balance,
    required this.inviteCount,
  });

  @override
  List<Object?> get props => [
        assessCount,
        balance,
        inviteCount,
      ];
}

@JsonSerializable()
class StoreInfo extends Equatable {
  final String storeName;
  final String roleName;

  const StoreInfo({
    required this.storeName,
    required this.roleName,
  });

  factory StoreInfo.fromJson(Map<String, dynamic> json) =>
      _$StoreInfoFromJson(json);

  @override
  List<Object?> get props => [
        storeName,
        roleName,
      ];
}
