import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'edit_list_model.g.dart';

@JsonSerializable()
class EditListModel extends Equatable {
  final int id;
  final int carId;
  final String mainPhoto;
  final String modelName;
  final String mileage;
  final num licensingDate;
  final int brokerId;
  final String brokerName;
  final int dealerId;
  final String dealerName;
  final int auditStatus;
  final String auditStatusName;
  final num dealerAuditAt;
  final num createdAt;

  factory EditListModel.fromJson(Map<String, dynamic> json) =>
      _$EditListModelFromJson(json);


  const EditListModel({
    required this.id,
    required this.carId,
    required this.mainPhoto,
    required this.modelName,
    required this.mileage,
    required this.licensingDate,
    required this.brokerId,
    required this.brokerName,
    required this.dealerId,
    required this.dealerName,
    required this.auditStatus,
    required this.auditStatusName,
    required this.dealerAuditAt,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        carId,
        mainPhoto,
        modelName,
        mileage,
        licensingDate,
        brokerId,
        brokerName,
        dealerId,
        dealerName,
        auditStatus,
        auditStatusName,
        dealerAuditAt,
        createdAt,
      ];
}
