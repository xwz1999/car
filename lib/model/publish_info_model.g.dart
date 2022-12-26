// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publish_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublishInfoModel _$PublishInfoModelFromJson(Map<String, dynamic> json) =>
    PublishInfoModel(
      id: json['id'] as int,
      status: json['status'] as int,
      statusName: json['statusName'] as String,
      theUpper: json['theUpper'] as int,
      theUpperName: json['theUpperName'] as String,
      source: json['source'] as int,
      sourceName: json['sourceName'] as String,
      baseInfo: BaseInfo.fromJson(json['baseInfo'] as Map<String, dynamic>),
      brokerInfo:
          BrokerInfo.fromJson(json['brokerInfo'] as Map<String, dynamic>),
      dealerInfo:
          DealerInfo.fromJson(json['dealerInfo'] as Map<String, dynamic>),
      customerInfo:
          BrokerInfo.fromJson(json['customerInfo'] as Map<String, dynamic>),
      photos: Photos.fromJson(json['photos'] as Map<String, dynamic>),
      priceInfo: PriceInfo.fromJson(json['priceInfo'] as Map<String, dynamic>),
      certificateInfo: CertificateInfo.fromJson(
          json['certificateInfo'] as Map<String, dynamic>),
      dealerAuditAt: json['dealerAuditAt'] as num,
      deaerRejectReason: json['deaerRejectReason'] as String,
      auditAt: json['auditAt'] as num,
      rejectReason: json['rejectReason'] as String,
      createdAt: json['createdAt'] as num,
    );

Map<String, dynamic> _$PublishInfoModelToJson(PublishInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'statusName': instance.statusName,
      'theUpper': instance.theUpper,
      'theUpperName': instance.theUpperName,
      'source': instance.source,
      'sourceName': instance.sourceName,
      'baseInfo': instance.baseInfo,
      'brokerInfo': instance.brokerInfo,
      'dealerInfo': instance.dealerInfo,
      'customerInfo': instance.customerInfo,
      'photos': instance.photos,
      'priceInfo': instance.priceInfo,
      'certificateInfo': instance.certificateInfo,
      'dealerAuditAt': instance.dealerAuditAt,
      'deaerRejectReason': instance.deaerRejectReason,
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
      licensingDate: json['licensingDate'] as num,
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
          .map((e) => ImagePhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      interiorPhotos: (json['interiorPhotos'] as List<dynamic>)
          .map((e) => ImagePhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      defectPhotos: (json['defectPhotos'] as List<dynamic>)
          .map((e) => ImagePhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataPhotos: (json['dataPhotos'] as List<dynamic>)
          .map((e) => ImagePhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PhotosToJson(Photos instance) => <String, dynamic>{
      'carPhotos': instance.carPhotos,
      'interiorPhotos': instance.interiorPhotos,
      'defectPhotos': instance.defectPhotos,
      'dataPhotos': instance.dataPhotos,
    };

certificateInfo _$certificateInfoFromJson(Map<String, dynamic> json) =>
    certificateInfo(
      transfer: json['transfer'] as int,
      keyCount: json['keyCount'] as int,
      compulsoryInsurance: json['compulsoryInsurance'] as int,
      compulsoryInsuranceDate: json['compulsoryInsuranceDate'] as num,
      commercialInsurance: json['commercialInsurance'] as int,
      commercialInsuranceDate: json['commercialInsuranceDate'] as num,
      commercialInsurancePrice: json['commercialInsurancePrice'] as String,
    );

Map<String, dynamic> _$certificateInfoToJson(certificateInfo instance) =>
    <String, dynamic>{
      'transfer': instance.transfer,
      'keyCount': instance.keyCount,
      'compulsoryInsurance': instance.compulsoryInsurance,
      'compulsoryInsuranceDate': instance.compulsoryInsuranceDate,
      'commercialInsurance': instance.commercialInsurance,
      'commercialInsuranceDate': instance.commercialInsuranceDate,
      'commercialInsurancePrice': instance.commercialInsurancePrice,
    };
