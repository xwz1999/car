import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consignment_list_model.g.dart';

@JsonSerializable()
class ConsignmentListModel extends Equatable {
  final int id;
  final String contractSn;

  // final int carId;
  final String modelName;

  // final int brokerId;
  // final String brokerName;
  // final int customerId;
  final String customerName;
  final int status;
  final String statusName;

  // final num dealerAuditAt;
  final num signAt;
  final String essFileUrl;

  // final num createdAt;

  factory ConsignmentListModel.fromJson(Map<String, dynamic> json) =>
      _$ConsignmentListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConsignmentListModelToJson(this);

  const ConsignmentListModel({
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
  List<Object?> get props => [
        id,
        contractSn,
        modelName,
        customerName,
        status,
        statusName,
        signAt,
        essFileUrl,
      ];
}
