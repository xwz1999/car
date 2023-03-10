import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consignment_list_model.g.dart';


@JsonSerializable()
class ConsignmentListModel extends Equatable{
  final int id;
  final String contractSn;
  final String modelName;
  final String customerName;
  final int status;
  final num signAt;
    factory ConsignmentListModel.fromJson(Map<String, dynamic> json) =>_$ConsignmentListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConsignmentListModelToJson(this);
  const ConsignmentListModel({
    required this.id,
    required this.contractSn,
    required this.modelName,
    required this.customerName,
    required this.status,
    required this.signAt,
  });
  @override
  List<Object?> get props => [contractSn,modelName,customerName,status,signAt,];
}