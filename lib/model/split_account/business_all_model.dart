import 'package:cloud_car/model/user/staff_all_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'business_all_model.g.dart';

@JsonSerializable()
class BusinessAllModel extends Equatable {
  final int id;
  final String name;
  final List<StaffAllModel> staffs;

  factory BusinessAllModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessAllModelFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessAllModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        staffs,
      ];

  const BusinessAllModel({
    required this.id,
    required this.name,
    required this.staffs,
  });
}
