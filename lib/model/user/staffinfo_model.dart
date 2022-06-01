import 'package:cloud_car/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staffinfo_model.g.dart';

@JsonSerializable()
class StaffinfoModel extends Equatable {
  //JsonKey(name)
  final int Id;
  final String Name;
  final int Gender;
  final String Phone;
  final int StoreId;
  final String StoreName;
  final int RoleId;
  final String RoleName;
  final String Commission;
  final int Status;
  final int AuditStatus;

  factory StaffinfoModel.fromJson(Map<String, dynamic> json) =>
      _$StaffinfoModelFromJson(json);

  Gender2 get genderEM => Gender2.getValue(Gender);

  RoleN get roleEm => RoleN.getValue(RoleId);

  static StaffinfoModel get init => const StaffinfoModel(
    Id: 0,
        Name: '',
        Gender: 0,
        Phone: '',
        StoreId: 0,
        StoreName: '',
        RoleId: 1,
        RoleName: '',
        Commission: '',
        Status: 0,
        AuditStatus: 2,
      );

  const StaffinfoModel({
    required this.Id,
    required this.Name,
    required this.Gender,
    required this.Phone,
    required this.StoreId,
    required this.StoreName,
    required this.RoleId,
    required this.RoleName,
    required this.Commission,
    required this.Status,
    required this.AuditStatus,
  });

  @override
  List<Object?> get props => [
        Name,
        Gender,
        Phone,
        StoreId,
        StoreName,
        RoleId,
        RoleName,
        Commission,
        Status,
        AuditStatus,
      ];
}
