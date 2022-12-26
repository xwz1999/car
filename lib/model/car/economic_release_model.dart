import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'economic_release_model.g.dart';

@JsonSerializable()
class EconomicReleaseModel extends Equatable {
  final int id;
  final int source;
  final String sourceName;
  final String mainPhoto;
  final String modelName;
  final String mileage;
  final int status;
  final String statusName;
  final int brokerId;
  final String brokerName;
  final int customerId;
  final String customerName;
  final int dealerId;
  final String dealerName;
  final num dealerAuditAt;
  final num auditAt;
  final num createdAt;

  factory EconomicReleaseModel.fromJson(Map<String, dynamic> json) =>
      _$EconomicReleaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EconomicReleaseModelToJson(this);

  static EconomicReleaseModel get init => const EconomicReleaseModel(
        id: 0,
        source: 0,
        sourceName: '',
        mainPhoto: '',
        modelName: '',
        mileage: '',
        status: 0,
        statusName: '',
        brokerId: 0,
        brokerName: '',
        customerId: 0,
        customerName: '',
        dealerId: 0,
        dealerName: '',
        dealerAuditAt: 0,
        auditAt: 0,
        createdAt: 0,
      );

  const EconomicReleaseModel({
    required this.id,
    required this.source,
    required this.sourceName,
    required this.mainPhoto,
    required this.modelName,
    required this.mileage,
    required this.status,
    required this.statusName,
    required this.brokerId,
    required this.brokerName,
    required this.customerId,
    required this.customerName,
    required this.dealerId,
    required this.dealerName,
    required this.dealerAuditAt,
    required this.auditAt,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        source,
        sourceName,
        mainPhoto,
        modelName,
        mileage,
        status,
        statusName,
        brokerId,
        brokerName,
        customerId,
        customerName,
        dealerId,
        dealerName,
        dealerAuditAt,
        auditAt,
        createdAt,
      ];
}
