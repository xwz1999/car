// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publish_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublishInfoModel _$PublishInfoModelFromJson(Map<String, dynamic> json) =>
    PublishInfoModel(
      id: json['id'] as int,
      modelId: json['modelId'] as int,
      modelName: json['modelName'] as String,
      status: json['status'] as int,
      statusName: json['statusName'] as String,
      theUpper: json['theUpper'] as int,
      theUpperName: json['theUpperName'] as String,
      vin: json['vin'] as String,
      transfer: json['transfer'] as int,
      price: json['price'] as String,
      lastPrice: json['lastPrice'] as String,
      downPayment: json['downPayment'] as String,
      source: json['source'] as int,
      sourceName: json['sourceName'] as String,
      type: json['type'] as String,
      engineNo: json['engineNo'] as String,
      licensingDate: json['licensingDate'] as num,
      color: json['color'] as String,
      interiorColor: json['interiorColor'] as String,
      temporaryLicensePlate: json['temporaryLicensePlate'] as String,
      parkingNo: json['parkingNo'] as String,
      useCharacter: json['useCharacter'] as String,
      mileage: json['mileage'] as String,
      purchaseTax: json['purchaseTax'] as String,
      installationCost: json['installationCost'] as String,
      location: json['location'] as String,
      attribution: json['attribution'] as String,
      condition: json['condition'] as String,
      carPhotos: (json['carPhotos'] as List<dynamic>)
          .map((e) => ImagePhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
      interiorPhotos: (json['interiorPhotos'] as List<dynamic>)
          .map((e) => ImagePhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
      defectPhotos: (json['defectPhotos'] as List<dynamic>)
          .map((e) => ImagePhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataPhotos: (json['dataPhotos'] as List<dynamic>)
          .map((e) => ImagePhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
      brokerInfo:
          BrokerInfo.fromJson(json['brokerInfo'] as Map<String, dynamic>),
      dealerInfo:
          DealerInfo.fromJson(json['dealerInfo'] as Map<String, dynamic>),
      modelInfo: ModelInfo.fromJson(json['modelInfo'] as Map<String, dynamic>),
      priceInfo: PriceInfo.fromJson(json['priceInfo'] as Map<String, dynamic>),
      purchaseInfo:
          PurchaseInfos.fromJson(json['purchaseInfo'] as Map<String, dynamic>),
      certificateInfo: CertificateInfo.fromJson(
          json['certificateInfo'] as Map<String, dynamic>),
      contractMasterInfo: ContractMasterInfo.fromJson(
          json['contractMasterInfo'] as Map<String, dynamic>),
      dealerAuditAt: json['dealerAuditAt'] as num,
      dealerRejectReason: json['dealerRejectReason'] as String,
      auditAt: json['auditAt'] as num,
      rejectReason: json['rejectReason'] as String,
      createdAt: json['createdAt'] as num,
    );

Map<String, dynamic> _$PublishInfoModelToJson(PublishInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modelId': instance.modelId,
      'modelName': instance.modelName,
      'status': instance.status,
      'statusName': instance.statusName,
      'theUpper': instance.theUpper,
      'theUpperName': instance.theUpperName,
      'vin': instance.vin,
      'transfer': instance.transfer,
      'price': instance.price,
      'lastPrice': instance.lastPrice,
      'downPayment': instance.downPayment,
      'sourceName': instance.sourceName,
      'source': instance.source,
      'type': instance.type,
      'engineNo': instance.engineNo,
      'licensingDate': instance.licensingDate,
      'color': instance.color,
      'interiorColor': instance.interiorColor,
      'temporaryLicensePlate': instance.temporaryLicensePlate,
      'parkingNo': instance.parkingNo,
      'useCharacter': instance.useCharacter,
      'mileage': instance.mileage,
      'purchaseTax': instance.purchaseTax,
      'installationCost': instance.installationCost,
      'location': instance.location,
      'attribution': instance.attribution,
      'condition': instance.condition,
      'carPhotos': instance.carPhotos,
      'interiorPhotos': instance.interiorPhotos,
      'defectPhotos': instance.defectPhotos,
      'dataPhotos': instance.dataPhotos,
      'brokerInfo': instance.brokerInfo,
      'dealerInfo': instance.dealerInfo,
      'modelInfo': instance.modelInfo,
      'priceInfo': instance.priceInfo,
      'purchaseInfo': instance.purchaseInfo,
      'certificateInfo': instance.certificateInfo,
      'contractMasterInfo': instance.contractMasterInfo,
      'dealerAuditAt': instance.dealerAuditAt,
      'dealerRejectReason': instance.dealerRejectReason,
      'auditAt': instance.auditAt,
      'rejectReason': instance.rejectReason,
      'createdAt': instance.createdAt,
    };

BaseInfo _$BaseInfoFromJson(Map<String, dynamic> json) => BaseInfo(
      type: json['type'] as int,
      typeName: json['typeName'] as String,
      modelId: json['modelId'] as int,
      modelName: json['modelName'] as String,
      vin: json['vin'] as String,
      engineNo: json['engineNo'] as String,
      licensingDate: json['licensingDate'] as int,
      color: json['color'] as String,
      interiorColor: json['interiorColor'] as String,
      temporaryLicensePlate: json['temporaryLicensePlate'] as String,
      parkingNo: json['parkingNo'] as String,
      useCharacter: json['useCharacter'] as String,
      shamMileage: json['shamMileage'] as String,
      purchaseTax: json['purchaseTax'] as String,
      installationCost: json['installationCost'] as String,
      location: json['location'] as String,
      attribution: json['attribution'] as String,
      condition: json['condition'] as String,
      remark: json['remark'] as String,
    );

Map<String, dynamic> _$BaseInfoToJson(BaseInfo instance) => <String, dynamic>{
      'type': instance.type,
      'typeName': instance.typeName,
      'modelId': instance.modelId,
      'modelName': instance.modelName,
      'vin': instance.vin,
      'engineNo': instance.engineNo,
      'licensingDate': instance.licensingDate,
      'color': instance.color,
      'interiorColor': instance.interiorColor,
      'temporaryLicensePlate': instance.temporaryLicensePlate,
      'parkingNo': instance.parkingNo,
      'useCharacter': instance.useCharacter,
      'shamMileage': instance.shamMileage,
      'purchaseTax': instance.purchaseTax,
      'installationCost': instance.installationCost,
      'location': instance.location,
      'attribution': instance.attribution,
      'condition': instance.condition,
      'remark': instance.remark,
    };

BrokerInfo _$BrokerInfoFromJson(Map<String, dynamic> json) => BrokerInfo(
      brokerId: json['brokerId'] as int,
      brokerNickname: json['brokerNickname'] as String,
      brokerPhone: json['brokerPhone'] as String,
      brokerHeadImg: json['brokerHeadImg'] as String,
    );

Map<String, dynamic> _$BrokerInfoToJson(BrokerInfo instance) =>
    <String, dynamic>{
      'brokerId': instance.brokerId,
      'brokerNickname': instance.brokerNickname,
      'brokerPhone': instance.brokerPhone,
      'brokerHeadImg': instance.brokerHeadImg,
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

Photos _$PhotosFromJson(Map<String, dynamic> json) => Photos(
      carPhotos: (json['carPhotos'] as List<dynamic>)
          .map((e) => ImagePhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
      interiorPhotos: (json['interiorPhotos'] as List<dynamic>)
          .map((e) => ImagePhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
      defectPhotos: (json['defectPhotos'] as List<dynamic>)
          .map((e) => ImagePhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataPhotos: (json['dataPhotos'] as List<dynamic>)
          .map((e) => ImagePhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PhotosToJson(Photos instance) => <String, dynamic>{
      'carPhotos': instance.carPhotos,
      'interiorPhotos': instance.interiorPhotos,
      'defectPhotos': instance.defectPhotos,
      'dataPhotos': instance.dataPhotos,
    };

ImagePhotos _$ImagePhotosFromJson(Map<String, dynamic> json) => ImagePhotos(
      photo: json['photo'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$ImagePhotosToJson(ImagePhotos instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'text': instance.text,
    };

CertificateInfo _$CertificateInfoFromJson(Map<String, dynamic> json) =>
    CertificateInfo(
      transfer: json['transfer'] as int,
      keyCount: json['keyCount'] as int,
      compulsoryInsurance: json['compulsoryInsurance'] as int,
      compulsoryInsuranceDate: json['compulsoryInsuranceDate'] as num,
      commercialInsurance: json['commercialInsurance'] as int,
      commercialInsuranceDate: json['commercialInsuranceDate'] as num,
      commercialInsurancePrice: json['commercialInsurancePrice'] as String,
    );

Map<String, dynamic> _$CertificateInfoToJson(CertificateInfo instance) =>
    <String, dynamic>{
      'transfer': instance.transfer,
      'keyCount': instance.keyCount,
      'compulsoryInsurance': instance.compulsoryInsurance,
      'compulsoryInsuranceDate': instance.compulsoryInsuranceDate,
      'commercialInsurance': instance.commercialInsurance,
      'commercialInsuranceDate': instance.commercialInsuranceDate,
      'commercialInsurancePrice': instance.commercialInsurancePrice,
    };

PurchaseInfos _$PurchaseInfosFromJson(Map<String, dynamic> json) =>
    PurchaseInfos(
      price: json['price'] as String,
      date: json['date'] as num,
      liaison: json['liaison'] as String,
    );

Map<String, dynamic> _$PurchaseInfosToJson(PurchaseInfos instance) =>
    <String, dynamic>{
      'price': instance.price,
      'date': instance.date,
      'liaison': instance.liaison,
    };
