import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'common_contact_model.g.dart';

@JsonSerializable()
class CommonContactModel extends Equatable {
  final int id;
  final String name;
  final String phone;
  final int gender;
  final String roleName;
  final int roleId;

  @override
  List<Object?> get props => [id,name,phone,gender,roleName,roleId,];



  factory CommonContactModel.fromJson(Map<String, dynamic> json) =>
      _$CommonContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommonContactModelToJson(this);

  const CommonContactModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.gender,
    required this.roleName,
    required this.roleId,
  });
}
