import 'package:cloud_car/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staff_all_model.g.dart';

@JsonSerializable()
class StaffAllModel extends Equatable {
  final int id;
  final String name;
  final String phone;
  final int auditStatus; // 1 = 待审核 2 = 审核通过
  final int roleId;
  final String roleName;
  final int gender;
  final int brokerId;

  Gender get genderEM => Gender.getValue(gender);

  Role get roleEM => Role.getValueN(roleId);

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        auditStatus,
        roleId,
        roleName,
        gender,
        brokerId,
      ];

  factory StaffAllModel.fromJson(Map<String, dynamic> json) =>
      _$StaffAllModelFromJson(json);

  Map<String, dynamic> toJson() => _$StaffAllModelToJson(this);

  const StaffAllModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.auditStatus,
    required this.roleId,
    required this.roleName,
    required this.gender,
    required this.brokerId,
  });

  StaffAllModel copyWith({
    int? id,
    String? name,
    String? phone,
    int? auditStatus,
    int? roleId,
    String? roleName,
    int? gender,
    int? brokerId,
  }) {
    return StaffAllModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      auditStatus: auditStatus ?? this.auditStatus,
      roleId: roleId ?? this.roleId,
      roleName: roleName ?? this.roleName,
      gender: gender ?? this.gender,
      brokerId: brokerId ?? this.brokerId,
    );
  }
}
