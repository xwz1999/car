import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'storeall_model.g.dart';

@JsonSerializable()
class StoreallModel extends Equatable {
  final int id;
  final String name;
  final List<Staff>? staffs;



  factory StoreallModel.fromJson(Map<String, dynamic> json) =>
      _$StoreallModelFromJson(json);

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

  factory Staff.fromJson(Map<String, dynamic> json) => _$StaffFromJson(json);
  const Staff(this.id, this.name, this.phone, this.auditStatus, this.roleName);
  @override
  List<Object?> get props => [id, name, phone, auditStatus, roleName];
}
