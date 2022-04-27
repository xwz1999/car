import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'lists_model.g.dart';

@JsonSerializable()
class ListsModel extends Equatable {
  final int id;
  final String orderSn;
  final int status;
  final int auditStatus;
  final String modeName;
  final int licensingDate;
  final String mileage;
  final String price;
  final int createdAt;

  // ignore: prefer_const_constructors_in_immutables

  factory ListsModel.fromJson(Map<String, dynamic> json) =>
      _$ListsModelFromJson(json);

  const ListsModel({
    required this.id,
    required this.orderSn,
    required this.status,
    required this.auditStatus,
    required this.modeName,
    required this.licensingDate,
    required this.mileage,
    required this.price,
    required this.createdAt,
  });
  
  @override
  List<Object?> get props => [id,orderSn,status,auditStatus,modeName,licensingDate,mileage,price,createdAt,];
}
