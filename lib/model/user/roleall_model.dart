import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'roleall_model.g.dart';

@JsonSerializable()
class RoleallModel extends Equatable {
  final int id;
  final String name;
  final String describe;

  factory RoleallModel.fromJson(Map<String, dynamic> json) =>
      _$RoleallModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleallModelToJson(this);

  @override
  List<Object?> get props => [id, name, describe];

  const RoleallModel({
    required this.id,
    required this.name,
    required this.describe,
  });

  mapIndexed(Null Function(dynamic e, dynamic index) param0) {}

  map(Null Function(dynamic e, dynamic index) param0) {}
}
