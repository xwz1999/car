// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleInfoModel _$SaleInfoModelFromJson(Map<String, dynamic> json) =>
    SaleInfoModel(
      id: json['id'] as int,
      status: json['status'] as int,
      statusName: json['statusName'] as String,
      thirdPartKind: json['thirdPartKind'] as int,
      thirdPartKindName: json['thirdPartKindName'] as String,
      createdAt: json['createdAt'] as num,
      baseInfo: BaseInfo.fromJson(json['baseInfo'] as Map<String, dynamic>),
      brokerInfo:
          BrokerInfo.fromJson(json['brokerInfo'] as Map<String, dynamic>),
      customerInfo:
          BrokerInfo.fromJson(json['customerInfo'] as Map<String, dynamic>),
      buyerMasterInfo:
          MasterInfo.fromJson(json['buyerMasterInfo'] as Map<String, dynamic>),
      sellerDealerInfo: SourceDealerInfo.fromJson(
          json['sellerDealerInfo'] as Map<String, dynamic>),
      sellerCustomerInfo: BrokerInfo.fromJson(
          json['sellerCustomerInfo'] as Map<String, dynamic>),
      dealerAuditInfo: DealerAuditInfo.fromJson(
          json['dealerAuditInfo'] as Map<String, dynamic>),
      thirdPartInfo: SourceDealerInfo.fromJson(
          json['thirdPartInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SaleInfoModelToJson(SaleInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'statusName': instance.statusName,
      'thirdPartKind': instance.thirdPartKind,
      'thirdPartKindName': instance.thirdPartKindName,
      'createdAt': instance.createdAt,
      'baseInfo': instance.baseInfo,
      'brokerInfo': instance.brokerInfo,
      'customerInfo': instance.customerInfo,
      'buyerMasterInfo': instance.buyerMasterInfo,
      'sellerDealerInfo': instance.sellerDealerInfo,
      'sellerCustomerInfo': instance.sellerCustomerInfo,
      'dealerAuditInfo': instance.dealerAuditInfo,
      'thirdPartInfo': instance.thirdPartInfo,
    };

BaseInfo _$BaseInfoFromJson(Map<String, dynamic> json) => BaseInfo(
      carId: json['carId'] as int,
      modelId: json['modelId'] as int,
      modelName: json['modelName'] as String,
      contractSn: json['contractSn'] as String,
      amount: json['amount'] as String,
      deposit: json['deposit'] as String,
      downPayment: json['downPayment'] as String,
      balancePayment: json['balancePayment'] as String,
      saleServiceFee: json['saleServiceFee'] as String,
      saleServiceFeeRate: json['saleServiceFeeRate'] as String,
      purchaseServiceFee: json['purchaseServiceFee'] as String,
      purchaseServiceFeeRate: json['purchaseServiceFeeRate'] as String,
    );

Map<String, dynamic> _$BaseInfoToJson(BaseInfo instance) => <String, dynamic>{
      'carId': instance.carId,
      'modelId': instance.modelId,
      'modelName': instance.modelName,
      'contractSn': instance.contractSn,
      'amount': instance.amount,
      'deposit': instance.deposit,
      'downPayment': instance.downPayment,
      'balancePayment': instance.balancePayment,
      'saleServiceFee': instance.saleServiceFee,
      'saleServiceFeeRate': instance.saleServiceFeeRate,
      'purchaseServiceFee': instance.purchaseServiceFee,
      'purchaseServiceFeeRate': instance.purchaseServiceFeeRate,
    };

BrokerInfo _$BrokerInfoFromJson(Map<String, dynamic> json) => BrokerInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      tel: json['tel'] as String,
    );

Map<String, dynamic> _$BrokerInfoToJson(BrokerInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tel': instance.tel,
    };

MasterInfo _$MasterInfoFromJson(Map<String, dynamic> json) => MasterInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      idCard: json['idCard'] as String,
      bankCard: json['bankCard'] as String,
      bank: json['bank'] as String,
      bankAccount: json['bankAccount'] as String,
    );

Map<String, dynamic> _$MasterInfoToJson(MasterInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'idCard': instance.idCard,
      'bankCard': instance.bankCard,
      'bank': instance.bank,
      'bankAccount': instance.bankAccount,
    };

SourceDealerInfo _$SourceDealerInfoFromJson(Map<String, dynamic> json) =>
    SourceDealerInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      ownerBrokerId: json['ownerBrokerId'] as int,
      ownerBrokerName: json['ownerBrokerName'] as String,
      ownerBrokerTel: json['ownerBrokerTel'] as String,
    );

Map<String, dynamic> _$SourceDealerInfoToJson(SourceDealerInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ownerBrokerId': instance.ownerBrokerId,
      'ownerBrokerName': instance.ownerBrokerName,
      'ownerBrokerTel': instance.ownerBrokerTel,
    };

DealerAuditInfo _$DealerAuditInfoFromJson(Map<String, dynamic> json) =>
    DealerAuditInfo(
      id: json['id'] as int,
      dealerAuditAt: json['dealerAuditAt'] as num,
      deaerRejectReason: json['deaerRejectReason'] as String,
    );

Map<String, dynamic> _$DealerAuditInfoToJson(DealerAuditInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dealerAuditAt': instance.dealerAuditAt,
      'deaerRejectReason': instance.deaerRejectReason,
    };
