import 'package:cloud_car/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staffinfo_model.g.dart';

@JsonSerializable()
class StaffInfoModel extends Equatable {
  final int id;
  final String name;
  final int gender;
  final String phone;
  final int storeId;
  final String storeName;
  final int roleId;
  final String roleName;
  final String commission;
  final int status;
  final int auditStatus;

  factory StaffInfoModel.fromJson(Map<String, dynamic> json) =>
      _$StaffInfoModelFromJson(json);

  Gender get genderEm => Gender.getValue(gender);

  Role get roleEm => Role.getValueN(roleId);

  static StaffInfoModel get init => const StaffInfoModel(
      id: 0,
      name: '',
      gender: 0,
      phone: '',
      storeId: 0,
      storeName: '',
      roleId: 0,
      roleName: '',
      commission: '',
      status: 0,
      auditStatus: 0);

  @override
  List<Object?> get props => [
        id,
        name,
        gender,
        phone,
        storeId,
        storeName,
        roleId,
        roleName,
        commission,
        status,
        auditStatus,
      ];

  const StaffInfoModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.phone,
    required this.storeId,
    required this.storeName,
    required this.roleId,
    required this.roleName,
    required this.commission,
    required this.status,
    required this.auditStatus,
  });
}
