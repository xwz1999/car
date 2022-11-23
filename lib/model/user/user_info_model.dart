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
  final Business business;
  final Partner partner;

  //
  // final int businessId; // 1= 云云问车 2=其他
  // final String businessName;

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
      // businessId: 0,
      // businessName: '',
      data: ExtraData(
        assessCount: 0,
        inviteCount: 0,
        balance: '',
      ),
      business: Business(storeName: '', roleName: '', roleId: 0,businessId: 0,businessName: '',storeId: 0), partner: Partner(expireDate: 0, isPartner: 0));

  PermissionLevel get levelEM => PermissionLevel.getValue(level);

  Gender get genderEM => Gender.getValue(gender);



  @override
  List<Object?> get props => [
        inviteCode,
        nickname,
        headImg,
        level,
        phone,
        gender,
        data,
        business,
        // businessId
      ];

  const UserInfoModel({
    required this.inviteCode,
    required this.nickname,
    required this.headImg,
    required this.level,
    required this.phone,
    required this.gender,
    required this.data,
    required this.business,
    // required this.businessId,
    // required this.businessName,
    required this.partner,
  });

  UserInfoModel copyWith({
    String? inviteCode,
    String? nickname,
    String? headImg,
    int? level,
    String? phone,
    int? gender,
    ExtraData? data,
    Business? business,
    //
    // int? businessId,
    // String? businessName,
    Partner? partner
  }) {
    return UserInfoModel(
      inviteCode: inviteCode ?? this.inviteCode,
      nickname: nickname ?? this.nickname,
      headImg: headImg ?? this.headImg,
      level: level ?? this.level,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      data: data ?? this.data,
      business: business ?? this.business,
      // businessId: businessId ?? this.businessId,
      // businessName: businessName ?? this.businessName,
      partner: partner??this.partner,
    );
  }
}


@JsonSerializable()
class Partner extends Equatable{
  final int isPartner;
  final int expireDate;
  @override
  List<Object?> get props => [isPartner,expireDate,];

  const Partner({
    required this.isPartner,
    required this.expireDate,
  });

  Map<String, dynamic> toJson() => _$PartnerToJson(this);
  factory Partner.fromJson(Map<String, dynamic> json) =>_$PartnerFromJson(json);


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
class Business extends Equatable {
  final String storeName;
  final String roleName;
  final String businessName;
  final int roleId;
  final int storeId;
  final int businessId;

  const Business({
    required this.storeName,
    required this.roleName,
    required this.businessName,
    required this.roleId,
    required this.storeId,
    required this.businessId,
  });

  BusinessAscription get businessAscription =>
      BusinessAscription.getValue(businessId);

  factory Business.fromJson(Map<String, dynamic> json) =>
      _$StoreInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StoreInfoToJson(this);

  Role get roleEM => Role.getValueN(roleId);

  @override
  List<Object?> get props => [storeName, roleName, roleId,businessName,storeId,businessId];
}
