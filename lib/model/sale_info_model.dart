import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'sale_info_model.g.dart';

@JsonSerializable()
class SaleInfoModel extends Equatable {
  final int id;
  final int status;
  final String statusName;
  final int thirdPartKind;
  final String thirdPartKindName;
  final num createdAt;
  final BaseInfo baseInfo;
  final BrokerInfo brokerInfo;
  final BrokerInfo customerInfo;
  final MasterInfo buyerMasterInfo;
  final SourceDealerInfo sellerDealerInfo;
  final BrokerInfo sellerCustomerInfo;
  final DealerAuditInfo dealerAuditInfo;
  final SourceDealerInfo thirdPartInfo;

  factory SaleInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaleInfoModelToJson(this);

  const SaleInfoModel({
    required this.id,
    required this.status,
    required this.statusName,
    required this.thirdPartKind,
    required this.thirdPartKindName,
    required this.createdAt,
    required this.baseInfo,
    required this.brokerInfo,
    required this.customerInfo,
    required this.buyerMasterInfo,
    required this.sellerDealerInfo,
    required this.sellerCustomerInfo,
    required this.dealerAuditInfo,
    required this.thirdPartInfo,
  });

  @override
  List<Object?> get props => [
        status,
        statusName,
        thirdPartKind,
        thirdPartKindName,
        createdAt,
        baseInfo,
        brokerInfo,
        customerInfo,
        buyerMasterInfo,
        sellerDealerInfo,
        sellerCustomerInfo,
        dealerAuditInfo,
        thirdPartInfo,
      ];
}

@JsonSerializable()
class BaseInfo extends Equatable {
  final int carId;
  final int modelId;
  final String modelName;
  final String contractSn;
  final String amount;
  final String deposit;
  final String downPayment;
  final String balancePayment;
  final String saleServiceFee;
  final String saleServiceFeeRate;
  final String purchaseServiceFee;
  final String purchaseServiceFeeRate;

  factory BaseInfo.fromJson(Map<String, dynamic> json) =>
      _$BaseInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BaseInfoToJson(this);

  const BaseInfo({
    required this.carId,
    required this.modelId,
    required this.modelName,
    required this.contractSn,
    required this.amount,
    required this.deposit,
    required this.downPayment,
    required this.balancePayment,
    required this.saleServiceFee,
    required this.saleServiceFeeRate,
    required this.purchaseServiceFee,
    required this.purchaseServiceFeeRate,
  });

  @override
  List<Object?> get props => [
        carId,
        modelId,
        modelName,
        contractSn,
        amount,
        deposit,
        downPayment,
        balancePayment,
        saleServiceFee,
        saleServiceFeeRate,
        purchaseServiceFee,
        purchaseServiceFeeRate,
      ];
}

@JsonSerializable()
class BrokerInfo extends Equatable {
  final int id;
  final String name;
  final String tel;

  factory BrokerInfo.fromJson(Map<String, dynamic> json) =>
      _$BrokerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BrokerInfoToJson(this);

  const BrokerInfo({
    required this.id,
    required this.name,
    required this.tel,
  });

  @override
  List<Object?> get props => [id, name, tel];
}

@JsonSerializable()
class MasterInfo extends Equatable {
  final int id;
  final String name;
  final String phone;
  final String address;
  final String idCard;
  final String bankCard;
  final String bank;
  final String bankAccount;

  factory MasterInfo.fromJson(Map<String, dynamic> json) =>
      _$MasterInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MasterInfoToJson(this);

  const MasterInfo({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.idCard,
    required this.bankCard,
    required this.bank,
    required this.bankAccount,
  });

  @override
  List<Object?> get props => [
        name,
        phone,
        address,
        idCard,
        bankCard,
        bank,
        bankAccount,
      ];
}

@JsonSerializable()
class SourceDealerInfo extends Equatable {
  final int id;
  final String name;
  final int ownerBrokerId;
  final String ownerBrokerName;
  final String ownerBrokerTel;

  factory SourceDealerInfo.fromJson(Map<String, dynamic> json) =>
      _$SourceDealerInfoFromJson(json);

  const SourceDealerInfo({
    required this.id,
    required this.name,
    required this.ownerBrokerId,
    required this.ownerBrokerName,
    required this.ownerBrokerTel,
  });

  @override
  List<Object?> get props => [
        name,
        ownerBrokerId,
        ownerBrokerName,
        ownerBrokerTel,
      ];
}

@JsonSerializable()
class DealerAuditInfo extends Equatable {
  final int id;
  final num dealerAuditAt;
  final String deaerRejectReason;

  factory DealerAuditInfo.fromJson(Map<String, dynamic> json) =>
      _$DealerAuditInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DealerAuditInfoToJson(this);

  const DealerAuditInfo({
    required this.id,
    required this.dealerAuditAt,
    required this.deaerRejectReason,
  });

  @override
  List<Object?> get props => [
        id,
        dealerAuditAt,
        deaerRejectReason,
      ];
}
