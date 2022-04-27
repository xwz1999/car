import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'customer_detail_model.g.dart';

@JsonSerializable()
class CustomerDetailModel extends Equatable {
  final int id;
  final String mobile;
  final String nickname;
  final int gender;
  final int isImportant;
  final String brokerName;
  final String trailContent;
  final int trailCreatedAt;
  final int createdAt;

  factory CustomerDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailModelFromJson(json);

  const CustomerDetailModel({
    required this.id,
    required this.mobile,
    required this.nickname,
    required this.gender,
    required this.isImportant,
    required this.brokerName,
    required this.trailContent,
    required this.trailCreatedAt,
    required this.createdAt,
  });
  
  @override
  List<Object?> get props => [id,mobile,nickname,gender,isImportant,brokerName,trailContent,trailCreatedAt,createdAt,];
  
}
