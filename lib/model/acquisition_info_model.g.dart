// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acquisition_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcquisitionInfoModel _$AcquisitionInfoModelFromJson(
        Map<String, dynamic> json) =>
    AcquisitionInfoModel(
      id: json['id'] as int,
      status: json['status'] as int,
      statusName: json['statusName'] as String,
      createdAt: json['createdAt'] as num,
      baseInfo: BaseInfo.fromJson(json['baseInfo'] as Map<String, dynamic>),
      dealerInfo:
          DealerInfo.fromJson(json['dealerInfo'] as Map<String, dynamic>),
      brokerInfo:
          BrokerInfo.fromJson(json['brokerInfo'] as Map<String, dynamic>),
      customerInfo:
          BrokerInfo.fromJson(json['customerInfo'] as Map<String, dynamic>),
      masterInfo:
          MasterInfo.fromJson(json['masterInfo'] as Map<String, dynamic>),
      priceInfo: PriceInfo.fromJson(json['priceInfo'] as Map<String, dynamic>),
      photos: Photos.fromJson(json['photos'] as Map<String, dynamic>),
      dealerAuditInfo: DealerAuditInfo.fromJson(
          json['dealerAuditInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AcquisitionInfoModelToJson(
        AcquisitionInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'statusName': instance.statusName,
      'createdAt': instance.createdAt,
      'baseInfo': instance.baseInfo,
      'dealerInfo': instance.dealerInfo,
      'brokerInfo': instance.brokerInfo,
      'customerInfo': instance.customerInfo,
      'masterInfo': instance.masterInfo,
      'priceInfo': instance.priceInfo,
      'photos': instance.photos,
      'dealerAuditInfo': instance.dealerAuditInfo,
    };

BaseInfo _$BaseInfoFromJson(Map<String, dynamic> json) => BaseInfo(
      modelId: json['modelId'] as int,
      modelName: json['modelName'] as String,
      contractSn: json['contractSn'] as String,
      vin: json['vin'] as String,
      engineNo: json['engineNo'] as String,
      licensingDate: json['licensingDate'] as num,
      licensePlate: json['licensePlate'] as String,
      useCharacter: json['useCharacter'] as String,
      mileage: json['mileage'] as String,
      compulsoryInsuranceDate: json['compulsoryInsuranceDate'] as num,
      condition: json['condition'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$BaseInfoToJson(BaseInfo instance) => <String, dynamic>{
      'modelId': instance.modelId,
      'modelName': instance.modelName,
      'contractSn': instance.contractSn,
      'vin': instance.vin,
      'engineNo': instance.engineNo,
      'licensingDate': instance.licensingDate,
      'licensePlate': instance.licensePlate,
      'useCharacter': instance.useCharacter,
      'mileage': instance.mileage,
      'compulsoryInsuranceDate': instance.compulsoryInsuranceDate,
      'condition': instance.condition,
      'color': instance.color,
    };

DealerInfo _$DealerInfoFromJson(Map<String, dynamic> json) => DealerInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      ownerBrokerId: json['ownerBrokerId'] as int,
      ownerBrokerName: json['ownerBrokerName'] as String,
      ownerBrokerTel: json['ownerBrokerTel'] as String,
    );

Map<String, dynamic> _$DealerInfoToJson(DealerInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ownerBrokerId': instance.ownerBrokerId,
      'ownerBrokerName': instance.ownerBrokerName,
      'ownerBrokerTel': instance.ownerBrokerTel,
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
      kind: json['kind'] as int,
      kindName: json['kindName'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      legalPerson: json['legalPerson'] as String,
      idCard: json['idCard'] as String,
      bankCard: json['bankCard'] as String,
      bank: json['bank'] as String,
    );

Map<String, dynamic> _$MasterInfoToJson(MasterInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'kindName': instance.kindName,
      'name': instance.name,
      'phone': instance.phone,
      'legalPerson': instance.legalPerson,
      'idCard': instance.idCard,
      'bankCard': instance.bankCard,
      'bank': instance.bank,
    };

PriceInfo _$PriceInfoFromJson(Map<String, dynamic> json) => PriceInfo(
      dealPrice: json['dealPrice'] as String,
      downPayment: json['downPayment'] as String,
      balancePayment: json['balancePayment'] as String,
      deliverDate: json['deliverDate'] as num,
    );

Map<String, dynamic> _$PriceInfoToJson(PriceInfo instance) => <String, dynamic>{
      'dealPrice': instance.dealPrice,
      'downPayment': instance.downPayment,
      'balancePayment': instance.balancePayment,
      'deliverDate': instance.deliverDate,
    };

Photos _$PhotosFromJson(Map<String, dynamic> json) => Photos(
      carPhotos: (json['carPhotos'] as List<dynamic>)
          .map((e) => ImagePhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataPhotos: (json['dataPhotos'] as List<dynamic>)
          .map((e) => ImagePhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PhotosToJson(Photos instance) => <String, dynamic>{
      'carPhotos': instance.carPhotos,
      'dataPhotos': instance.dataPhotos,
    };

DealerAuditInfo _$DealerAuditInfoFromJson(Map<String, dynamic> json) =>
    DealerAuditInfo(
      id: json['id'] as int,
      dealerAuditAt: json['dealerAuditAt'] as num,
      dealerRejectReason: json['dealerRejectReason'] as String,
    );

Map<String, dynamic> _$DealerAuditInfoToJson(DealerAuditInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dealerAuditAt': instance.dealerAuditAt,
      'dealerRejectReason': instance.dealerRejectReason,
    };
