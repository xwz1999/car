import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'consignment_model.g.dart';


@JsonSerializable()
class ConsignmentModel extends Equatable{
  final int id;
  final String contractSn;
  final String modelName;
  final String customerName;
  final int status;
  final String statusName;
  final num signAt;
  final String essFileUrl;

    factory ConsignmentModel.fromJson(Map<String, dynamic> json) =>_$ConsignmentModelFromJson(json);
    Map<String,dynamic> toJson()=> _$ConsignmentModelToJson(this);

  const ConsignmentModel({
    required this.id,
    required this.contractSn,
    required this.modelName,
    required this.customerName,
    required this.status,
    required this.statusName,
    required this.signAt,
    required this.essFileUrl,
  });
  @override
  List<Object?> get props => [id,contractSn,modelName,customerName,status,statusName,signAt,essFileUrl,];
}