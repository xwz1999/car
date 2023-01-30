// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditInfoModel _$EditInfoModelFromJson(Map<String, dynamic> json) =>
    EditInfoModel(
      rejectReason: json['rejectReason'] as String,
      carInfo: CarInfos.fromJson(json['carInfo'] as Map<String, dynamic>),
      auditStatus: json['auditStatus'] as int,
      auditStatusName: json['auditStatusName'] as String,
      dealerAuditAt: json['dealerAuditAt'] as num,
      createdAt: json['createdAt'] as num,
    );

Map<String, dynamic> _$EditInfoModelToJson(EditInfoModel instance) =>
    <String, dynamic>{
      'carInfo': instance.carInfo,
      'auditStatus': instance.auditStatus,
      'auditStatusName': instance.auditStatusName,
      'dealerAuditAt': instance.dealerAuditAt,
      'createdAt': instance.createdAt,
      'rejectReason': instance.rejectReason,
    };

PurchaseInfoS _$PurchaseInfoSFromJson(Map<String, dynamic> json) =>
    PurchaseInfoS(
      price: json['price'] as String,
      date: json['date'] as num,
      liaison: json['liaison'] as String,
    );

Map<String, dynamic> _$PurchaseInfoSToJson(PurchaseInfoS instance) =>
    <String, dynamic>{
      'price': instance.price,
      'date': instance.date,
      'liaison': instance.liaison,
    };

CarInfos _$CarInfosFromJson(Map<String, dynamic> json) => CarInfos(
      id: json['id'] as int,
      modelId: json['modelId'] as int,
      modelName: json['modelName'] as String,
      status: json['status'] as int,
      statusName: json['statusName'] as String,
      theUpper: json['theUpper'] as int,
      theUpperName: json['theUpperName'] as String,
      vin: json['vin'] as String,
      carSn: json['carSn'] as String,
      collect: json['collect'] as int,
      isCollect: json['isCollect'] as int,
      browse: json['browse'] as int,
      transfer: json['transfer'] as int,
      price: json['price'] as String,
      lastPrice: json['lastPrice'] as String,
      downPayment: json['downPayment'] as String,
      sourceName: json['sourceName'] as String,
      source: json['source'] as int,
      dealerId: json['dealerId'] as int,
      dealerName: json['dealerName'] as String,
      dealerSn: json['dealerSn'] as String,
      locationCityId: json['locationCityId'] as int,
      attributionCityId: json['attributionCityId'] as int,
      remark: json['remark'] as String,
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
          .map((e) => CarPhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
      interiorPhotos: (json['interiorPhotos'] as List<dynamic>)
          .map((e) => CarPhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
      defectPhotos: (json['defectPhotos'] as List<dynamic>)
          .map((e) => CarPhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataPhotos: (json['dataPhotos'] as List<dynamic>)
          .map((e) => CarPhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
      brokerInfo:
          BrokerInfo.fromJson(json['brokerInfo'] as Map<String, dynamic>),
      modelInfo: ModelInfo.fromJson(json['modelInfo'] as Map<String, dynamic>),
      priceInfo: PriceInfo.fromJson(json['priceInfo'] as Map<String, dynamic>),
      purchaseInfo:
          PurchaseInfoS.fromJson(json['purchaseInfo'] as Map<String, dynamic>),
      certificateInfo: CertificateInfo.fromJson(
          json['certificateInfo'] as Map<String, dynamic>),
      contractMasterInfo: ContractMasterInfo.fromJson(
          json['contractMasterInfo'] as Map<String, dynamic>),
      stockStatus: json['stockStatus'] as int,
      stockStatusName: json['stockStatusName'] as String,
    );

Map<String, dynamic> _$CarInfosToJson(CarInfos instance) => <String, dynamic>{
      'id': instance.id,
      'modelId': instance.modelId,
      'modelName': instance.modelName,
      'status': instance.status,
      'statusName': instance.statusName,
      'theUpper': instance.theUpper,
      'theUpperName': instance.theUpperName,
      'vin': instance.vin,
      'carSn': instance.carSn,
      'collect': instance.collect,
      'isCollect': instance.isCollect,
      'browse': instance.browse,
      'transfer': instance.transfer,
      'price': instance.price,
      'lastPrice': instance.lastPrice,
      'downPayment': instance.downPayment,
      'sourceName': instance.sourceName,
      'source': instance.source,
      'dealerId': instance.dealerId,
      'dealerName': instance.dealerName,
      'dealerSn': instance.dealerSn,
      'locationCityId': instance.locationCityId,
      'attributionCityId': instance.attributionCityId,
      'remark': instance.remark,
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
      'modelInfo': instance.modelInfo,
      'priceInfo': instance.priceInfo,
      'purchaseInfo': instance.purchaseInfo,
      'certificateInfo': instance.certificateInfo,
      'contractMasterInfo': instance.contractMasterInfo,
      'stockStatus': instance.stockStatus,
      'stockStatusName': instance.stockStatusName,
    };
