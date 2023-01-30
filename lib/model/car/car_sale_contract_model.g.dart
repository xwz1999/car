// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_sale_contract_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarSaleContractModel _$CarSaleContractModelFromJson(
        Map<String, dynamic> json) =>
    CarSaleContractModel(
      carId: json['carId'] as int,
      payType: json['payType'] as int,
      transferType: json['transferType'] as int,
      priceInfo: PriceInfo.fromJson(json['priceInfo'] as Map<String, dynamic>),
      customerId: json['customerId'] as int?,
      masterInfo:
          MasterInfo.fromJson(json['masterInfo'] as Map<String, dynamic>),
      thirdPartInfo:
          ThirdPartInfo.fromJson(json['thirdPartInfo'] as Map<String, dynamic>),
      remark: json['remark'] as String,
      customerChannel: json['customerChannel'] as int?,
    );

Map<String, dynamic> _$CarSaleContractModelToJson(
        CarSaleContractModel instance) =>
    <String, dynamic>{
      'carId': instance.carId,
      'payType': instance.payType,
      'transferType': instance.transferType,
      'priceInfo': instance.priceInfo,
      'customerId': instance.customerId,
      'customerChannel': instance.customerChannel,
      'masterInfo': instance.masterInfo,
      'thirdPartInfo': instance.thirdPartInfo,
      'remark': instance.remark,
    };

PriceInfo _$PriceInfoFromJson(Map<String, dynamic> json) => PriceInfo(
      dealPrice: json['dealPrice'] as String,
      deposit: json['deposit'] as String,
      downPayment: json['downPayment'] as String,
      deliverDate: json['deliverDate'] as String,
      deliverAddress: json['deliverAddress'] as String,
      transferFee: json['transferFee'] as String,
      transferFeeHolder: json['transferFeeHolder'] as int,
      agentFee: json['agentFee'] as String,
      agentFeeHolder: json['agentFeeHolder'] as int,
    );

Map<String, dynamic> _$PriceInfoToJson(PriceInfo instance) => <String, dynamic>{
      'dealPrice': instance.dealPrice,
      'deposit': instance.deposit,
      'downPayment': instance.downPayment,
      'deliverDate': instance.deliverDate,
      'deliverAddress': instance.deliverAddress,
      'transferFee': instance.transferFee,
      'transferFeeHolder': instance.transferFeeHolder,
      'agentFee': instance.agentFee,
      'agentFeeHolder': instance.agentFeeHolder,
    };

MasterInfo _$MasterInfoFromJson(Map<String, dynamic> json) => MasterInfo(
      name: json['name'] as String,
      phone: json['phone'] as String,
      idCard: json['idCard'] as String,
      address: json['address'] as String,
      bank: json['bank'] as String,
      bankCard: json['bankCard'] as String,
      bankAccount: json['bankAccount'] as String,
    );

Map<String, dynamic> _$MasterInfoToJson(MasterInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'idCard': instance.idCard,
      'address': instance.address,
      'bank': instance.bank,
      'bankCard': instance.bankCard,
      'bankAccount': instance.bankAccount,
    };

ThirdPartInfo _$ThirdPartInfoFromJson(Map<String, dynamic> json) =>
    ThirdPartInfo(
      kind: json['kind'] as int,
      storeId: json['storeId'] as int,
      saleServiceFeeRate: json['saleServiceFeeRate'] as String,
      purchaseServiceFeeRate: json['purchaseServiceFeeRate'] as String,
    );

Map<String, dynamic> _$ThirdPartInfoToJson(ThirdPartInfo instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'storeId': instance.storeId,
      'saleServiceFeeRate': instance.saleServiceFeeRate,
      'purchaseServiceFeeRate': instance.purchaseServiceFeeRate,
    };
