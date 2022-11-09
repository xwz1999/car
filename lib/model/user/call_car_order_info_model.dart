import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/ui/user/user_order/status.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'call_car_order_info_model.g.dart';

@JsonSerializable()
class CallCarOrderInfoModel extends Equatable {
  final int id;
  final String modelName;
  final String mainPhoto;
  final int licensingDate;
  final String mileage;
  final String carPrice;
  final int createdAt;
  final int status;
  final int reserveAt;
  final String address;
  final String remark;
  final String amount;
  final CallCarPay payInfo;
  final CallCarRefund refundInfo;
  final int transfer;
  final CallCarBrokerInfo customerInfo;
  final CallCarBrokerInfo brokerInfo;

  factory CallCarOrderInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CallCarOrderInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CallCarOrderInfoModelToJson(this);

  CallCarStatus get statusEm => CallCarStatus.getValue(status);

  @override
  List<Object?> get props => [
        id,
        modelName,
        mainPhoto,
        licensingDate,
        mileage,
        carPrice,
        createdAt,
        status,
        customerInfo,
        brokerInfo,
        reserveAt,
        address,
        remark,
        amount,
        payInfo,
        refundInfo,
        transfer,
      ];

  const CallCarOrderInfoModel({
    required this.id,
    required this.modelName,
    required this.mainPhoto,
    required this.licensingDate,
    required this.mileage,
    required this.carPrice,
    required this.createdAt,
    required this.status,
    required this.reserveAt,
    required this.address,
    required this.remark,
    required this.amount,
    required this.payInfo,
    required this.refundInfo,
    required this.transfer,
    required this.customerInfo,
    required this.brokerInfo,
  });
}

@JsonSerializable()
class CallCarPay extends Equatable {
  final int id;
  final int payType;
  final String amount;
  final int payTime;

  factory CallCarPay.fromJson(Map<String, dynamic> json) =>
      _$CallCarPayFromJson(json);

  Map<String, dynamic> toJson() => _$CallCarPayToJson(this);

  PayType get payTypeEM => PayType.getValue(payType);

  @override
  List<Object?> get props => [
        id,
        payType,
        payTime,
        amount,
      ];

  const CallCarPay({
    required this.id,
    required this.payType,
    required this.amount,
    required this.payTime,
  });
}

@JsonSerializable()
class CallCarRefund extends Equatable {
  final int id;
  final int createdAt;
  final String reason;
  final String proof;
  final int status; // 1=未审核 2=审核通过 3=审核驳回
  final int auditAt;
  final String rejectReason;

  factory CallCarRefund.fromJson(Map<String, dynamic> json) =>
      _$CallCarRefundFromJson(json);

  Map<String, dynamic> toJson() => _$CallCarRefundToJson(this);

  @override
  List<Object?> get props => [
        id,
        createdAt,
        reason,
        proof,
        status,
        auditAt,
        rejectReason,
      ];

  const CallCarRefund({
    required this.id,
    required this.createdAt,
    required this.reason,
    required this.proof,
    required this.status,
    required this.auditAt,
    required this.rejectReason,
  });
}

@JsonSerializable()
class CallCarCustomerInfo extends Equatable {
  final String name;
  final String phone;

  factory CallCarCustomerInfo.fromJson(Map<String, dynamic> json) =>
      _$CallCarCustomerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CallCarCustomerInfoToJson(this);

  @override
  List<Object?> get props => [
        name,
        phone,
      ];

  const CallCarCustomerInfo({
    required this.name,
    required this.phone,
  });
}

@JsonSerializable()
class CallCarBrokerInfo extends Equatable {
  final String name;
  final String phone;

  factory CallCarBrokerInfo.fromJson(Map<String, dynamic> json) =>
      _$CallCarBrokerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CallCarBrokerInfoToJson(this);

  @override
  List<Object?> get props => [
        name,
        phone,
      ];

  const CallCarBrokerInfo({
    required this.name,
    required this.phone,
  });
}
