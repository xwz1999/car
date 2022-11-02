import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'broker_model.g.dart';

@JsonSerializable()
class BrokerModel extends Equatable {
  final int id;
  final String nickname;
  final String phone;
  final int gender;
  final int businessId;
  final String businessNo;
  final String businessName;
  final String businessAddress;
  final String businessPhone;
  final String roleName;

  @override
  List<Object?> get props => [
        id,
        nickname,
        phone,
        businessId,
        businessNo,
        businessName,
        businessAddress,
        businessPhone,
    roleName
      ];

  factory BrokerModel.fromJson(Map<String, dynamic> json) =>
      _$BrokerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrokerModelToJson(this);

  const BrokerModel({
    required this.id,
    required this.nickname,
    required this.phone,
    required this.gender,
    required this.businessId,
    required this.businessNo,
    required this.businessName,
    required this.businessAddress,
    required this.businessPhone,
    required this.roleName
  });
}
