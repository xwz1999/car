import 'package:cloud_car/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'storeall_model.g.dart';

@JsonSerializable()
class StoreallModel extends Equatable {
  final int id;
  final String name;
  final List<Staff>? staffs;

  factory StoreallModel.empty() {
    return const StoreallModel(
        id: 0,
        name: '入驻商',
    staffs: []);
  }

  factory StoreallModel.fromJson(Map<String, dynamic> json) =>
      _$StoreallModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreallModelToJson(this);

  @override
  List<Object?> get props => [id, name, staffs];

  const StoreallModel({
    required this.id,
    required this.name,
    required this.staffs,
  });
}

@JsonSerializable()
class Staff extends Equatable {
  final int id;
  final String name;
  final String phone;
  final int auditStatus;
  final String roleName;
  final int roleId;
  final int gender;
  final int brokerId;

  factory Staff.fromJson(Map<String, dynamic> json) => _$StaffFromJson(json);

  Map<String, dynamic> toJson() => _$StaffToJson(this);

  Gender get genderEM => Gender.getValue(gender);

  Role get roleEm => Role.getValue(roleName);

  @override
  List<Object?> get props => [id, name, phone, auditStatus, roleName, gender,brokerId];

  const Staff({
    required this.id,
    required this.name,
    required this.phone,
    required this.auditStatus,
    required this.roleName,
    required this.roleId,
    required this.gender,
    required this.brokerId,
  });
}
