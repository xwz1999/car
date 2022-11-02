import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_list_model.g.dart';

@JsonSerializable()
class CustomerListModel extends Equatable {
  final int id;
  final String nickname;
  final int gender;
  final String mobile;
  final String realName;
  final String idCard;
  final int isImportant;
  final String brokerName;
  final String trailContent;
  final int trailCreatedAt;
  final int createdAt;

  factory CustomerListModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerListModelToJson(this);
  const CustomerListModel({
    required this.id,
    required this.nickname,
    required this.gender,
    required this.isImportant,
    required this.brokerName,
    required this.trailContent,
    required this.trailCreatedAt,
    required this.createdAt,
    required this.mobile,
    required this.idCard,
    required this.realName
  });
  
  
  @override
  List<Object?> get props => [id,nickname,gender,isImportant,brokerName,trailContent,trailCreatedAt,createdAt,mobile,idCard,realName];
  
}
