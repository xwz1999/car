import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_count_model.g.dart';

@JsonSerializable()
class MessageCountModel extends Equatable {
  final int normalCount; // 常规消息
  final int customerNormalCount; // 用户消息
  final int customerPayCount; // 用户付款
  final int customerTrailCount; // 用户跟踪
  final int customerInviteCount; // 用户邀约
  final int customerCareCount; // 用户关怀
  final int billCount; // 分账
  final int carAuditCount; // 车辆审批
  final int contractAuditCount; //合同审核
  final int systemCount; //版本

  factory MessageCountModel.fromJson(Map<String, dynamic> json) =>
      _$MessageCountModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageCountModelToJson(this);

  static MessageCountModel get init => const MessageCountModel(
        normalCount: 0,
        customerNormalCount: 0,
        customerPayCount: 0,
        customerTrailCount: 0,
        customerInviteCount: 0,
        customerCareCount: 0,
        billCount: 0,
        carAuditCount: 0,
        contractAuditCount: 0,
        systemCount: 0,
      );

  @override
  List<Object?> get props => [
        normalCount,
        customerNormalCount,
        customerPayCount,
        customerTrailCount,
        customerInviteCount,
        customerCareCount,
        billCount,
        carAuditCount,
        contractAuditCount,
        systemCount,
      ];

  const MessageCountModel({
    required this.normalCount,
    required this.customerNormalCount,
    required this.customerPayCount,
    required this.customerTrailCount,
    required this.customerInviteCount,
    required this.customerCareCount,
    required this.billCount,
    required this.carAuditCount,
    required this.contractAuditCount,
    required this.systemCount,
  });
}
