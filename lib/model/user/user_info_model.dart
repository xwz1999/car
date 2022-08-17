import 'package:cloud_car/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel extends Equatable {
  final String inviteCode;
  final String nickname;
  final String headImg;
  final int level;
  final String phone;
  final int gender;
  final ExtraData data;
  final StoreInfo store;
  final int businessId; // 1= 云云问车 2=其他
  final String businessName;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);

  static UserInfoModel get fail => const UserInfoModel(
      inviteCode: '',
      nickname: '',
      headImg: '',
      level: 0,
      phone: '',
      gender: 0,
      businessId: 0,
      businessName: '',
      data: ExtraData(
        assessCount: 0,
        inviteCount: 0,
        balance: '',
      ),
      store: StoreInfo(storeName: '', roleName: '', roleId: 0));

  @Deprecated('已弃用')
  Map<int, String> get levelMap => {
        1: '基础用户',
        2: '独立合伙人',
        3: '入驻商',
      };

  Gender get genderEM => Gender.getValue(gender);

  bool get isHomeStore => businessId == 1;

  @override
  List<Object?> get props => [
        inviteCode,
        nickname,
        headImg,
        level,
        phone,
        gender,
        data,
        store,
        businessId
      ];

  const UserInfoModel({
    required this.inviteCode,
    required this.nickname,
    required this.headImg,
    required this.level,
    required this.phone,
    required this.gender,
    required this.data,
    required this.store,
    required this.businessId,
    required this.businessName,
  });

  UserInfoModel copyWith({
    String? inviteCode,
    String? nickname,
    String? headImg,
    int? level,
    String? phone,
    int? gender,
    ExtraData? data,
    StoreInfo? store,
    int? businessId,
    String? businessName,
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
      businessId: businessId ?? this.businessId,
      businessName: businessName ?? this.businessName,
    );
  }
}

@JsonSerializable()
class ExtraData extends Equatable {
  final int assessCount;
  final String balance;
  final int inviteCount;

  factory ExtraData.fromJson(Map<String, dynamic> json) =>
      _$ExtraDataFromJson(json);

  Map<String, dynamic> toJson() => _$ExtraDataToJson(this);

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
  final int roleId;

  const StoreInfo({
    required this.storeName,
    required this.roleName,
    required this.roleId,
  });

  factory StoreInfo.fromJson(Map<String, dynamic> json) =>
      _$StoreInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StoreInfoToJson(this);

  Role get roleEM => Role.getValueN(roleId);

  @override
  List<Object?> get props => [storeName, roleName, roleId];
}
