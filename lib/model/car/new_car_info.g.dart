// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_car_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewCarInfo _$NewCarInfoFromJson(Map<String, dynamic> json) => NewCarInfo(
      carInfo: CarNewInfo.fromJson(json['carInfo'] as Map<String, dynamic>),
      isSelf: json['isSelf'] as int,
      isSelfStore: json['isSelfStore'] as int,
      IsSelfBusiness: json['IsSelfBusiness'] as int,
    );

Map<String, dynamic> _$NewCarInfoToJson(NewCarInfo instance) =>
    <String, dynamic>{
      'carInfo': instance.carInfo,
      'isSelf': instance.isSelf,
      'isSelfStore': instance.isSelfStore,
      'IsSelfBusiness': instance.IsSelfBusiness,
    };

CarNewInfo _$CarNewInfoFromJson(Map<String, dynamic> json) => CarNewInfo(
      id: json['id'] as int,
      modelName: json['modelName'] as String,
      vin: json['vin'] as String,
      carSn: json['carSn'] as String,
      collect: json['collect'] as int,
      browse: json['browse'] as int,
      transfer: json['transfer'] as int,
      price: json['price'] as String,
      lastPrice: json['lastPrice'] as String,
      downPayment: json['downPayment'] as String,
      source: json['source'] as String,
      sourceId: json['sourceId'] as int,
      type: json['type'] as String,
      engineNo: json['engineNo'] as String,
      licensingDate: json['licensingDate'] as int,
      color: json['color'] as String,
      interiorColor: json['interiorColor'] as String,
      temporaryLicensePlate: json['temporaryLicensePlate'] as String,
      parkingNo: json['parkingNo'] as int,
      emissionStandard: json['emissionStandard'] as String,
      useCharacter: json['useCharacter'] as String,
      Mileage: json['Mileage'] as String,
      marketDate: json['marketDate'] as int,
      newCarGuidePrice: json['newCarGuidePrice'] as String,
      purchaseTax: json['purchaseTax'] as String,
      installationCost: json['installationCost'] as String,
      location: json['location'] as String,
      condition: json['condition'] as String,
      carPhotos: (json['carPhotos'] as List<dynamic>)
          .map((e) => ImagePhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      interiorPhotos: (json['interiorPhotos'] as List<dynamic>)
          .map((e) => ImagePhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      defectPhotos: (json['defectPhotos'] as List<dynamic>)
          .map((e) => ImagePhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      reportPhotos: (json['reportPhotos'] as List<dynamic>)
          .map((e) => ImagePhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      brokerInfo:
          BrokerInfo.fromJson(json['brokerInfo'] as Map<String, dynamic>),
      modelInfo: ModelInfo.fromJson(json['modelInfo'] as Map<String, dynamic>),
      priceInfo: PriceInfo.fromJson(json['priceInfo'] as Map<String, dynamic>),
      certificateInfo: CertificateInfo.fromJson(
          json['certificateInfo'] as Map<String, dynamic>),
      contractMasterInfo: ContractMasterInfo.fromJson(
          json['contractMasterInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CarNewInfoToJson(CarNewInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modelName': instance.modelName,
      'vin': instance.vin,
      'carSn': instance.carSn,
      'collect': instance.collect,
      'browse': instance.browse,
      'transfer': instance.transfer,
      'price': instance.price,
      'lastPrice': instance.lastPrice,
      'downPayment': instance.downPayment,
      'source': instance.source,
      'sourceId': instance.sourceId,
      'type': instance.type,
      'engineNo': instance.engineNo,
      'licensingDate': instance.licensingDate,
      'color': instance.color,
      'interiorColor': instance.interiorColor,
      'temporaryLicensePlate': instance.temporaryLicensePlate,
      'parkingNo': instance.parkingNo,
      'emissionStandard': instance.emissionStandard,
      'useCharacter': instance.useCharacter,
      'Mileage': instance.Mileage,
      'marketDate': instance.marketDate,
      'newCarGuidePrice': instance.newCarGuidePrice,
      'purchaseTax': instance.purchaseTax,
      'installationCost': instance.installationCost,
      'location': instance.location,
      'condition': instance.condition,
      'carPhotos': instance.carPhotos,
      'interiorPhotos': instance.interiorPhotos,
      'defectPhotos': instance.defectPhotos,
      'reportPhotos': instance.reportPhotos,
      'brokerInfo': instance.brokerInfo,
      'modelInfo': instance.modelInfo,
      'priceInfo': instance.priceInfo,
      'certificateInfo': instance.certificateInfo,
      'contractMasterInfo': instance.contractMasterInfo,
    };

ImagePhoto _$ImagePhotoFromJson(Map<String, dynamic> json) => ImagePhoto(
      photo: json['photo'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$ImagePhotoToJson(ImagePhoto instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'text': instance.text,
    };

BrokerInfo _$BrokerInfoFromJson(Map<String, dynamic> json) => BrokerInfo(
      brokerId: json['brokerId'] as int,
      brokerNickname: json['brokerNickname'] as String,
      brokerHeadImg: json['brokerHeadImg'] as String,
      brokerPhone: json['brokerPhone'] as String,
    );

Map<String, dynamic> _$BrokerInfoToJson(BrokerInfo instance) =>
    <String, dynamic>{
      'brokerId': instance.brokerId,
      'brokerNickname': instance.brokerNickname,
      'brokerHeadImg': instance.brokerHeadImg,
      'brokerPhone': instance.brokerPhone,
    };

ModelInfo _$ModelInfoFromJson(Map<String, dynamic> json) => ModelInfo(
      year: json['year'] as int,
      price: json['price'] as String,
      liter: json['liter'] as String,
      dischargeStandard: json['dischargeStandard'] as String,
      fuelTypeName: json['fuelTypeName'] as String,
      enginePower: json['enginePower'] as int,
      enginePowerKw: json['enginePowerKw'] as int,
      isGreen: json['isGreen'] as int,
      modelCode: json['modelCode'] as String,
      driveName: json['driveName'] as String,
      driveType: json['driveType'] as String,
      modelStatus: json['modelStatus'] as String,
      gearType: json['gearType'] as String,
      marketDate: json['marketDate'] as String,
      minRegYear: json['minRegYear'] as String,
      maxRegYear: json['maxRegYear'] as String,
      stopMakeYear: json['stopMakeYear'] as String,
      intake: json['intake'] as String,
      seatNumber: json['seatNumber'] as String,
      bodyType: json['bodyType'] as String,
      doorNumber: json['doorNumber'] as int,
      carStruct: json['carStruct'] as String,
      isParallel: json['isParallel'] as int,
      priceAllowance: json['priceAllowance'] as String,
    );

Map<String, dynamic> _$ModelInfoToJson(ModelInfo instance) => <String, dynamic>{
      'year': instance.year,
      'price': instance.price,
      'liter': instance.liter,
      'dischargeStandard': instance.dischargeStandard,
      'fuelTypeName': instance.fuelTypeName,
      'enginePower': instance.enginePower,
      'enginePowerKw': instance.enginePowerKw,
      'isGreen': instance.isGreen,
      'modelCode': instance.modelCode,
      'driveName': instance.driveName,
      'driveType': instance.driveType,
      'modelStatus': instance.modelStatus,
      'gearType': instance.gearType,
      'marketDate': instance.marketDate,
      'minRegYear': instance.minRegYear,
      'maxRegYear': instance.maxRegYear,
      'stopMakeYear': instance.stopMakeYear,
      'intake': instance.intake,
      'seatNumber': instance.seatNumber,
      'bodyType': instance.bodyType,
      'doorNumber': instance.doorNumber,
      'carStruct': instance.carStruct,
      'isParallel': instance.isParallel,
      'priceAllowance': instance.priceAllowance,
    };

PriceInfo _$PriceInfoFromJson(Map<String, dynamic> json) => PriceInfo(
      purchasePrice: json['purchasePrice'] as String,
      salePrice: json['salePrice'] as String,
    );

Map<String, dynamic> _$PriceInfoToJson(PriceInfo instance) => <String, dynamic>{
      'purchasePrice': instance.purchasePrice,
      'salePrice': instance.salePrice,
    };

CertificateInfo _$CertificateInfoFromJson(Map<String, dynamic> json) =>
    CertificateInfo(
      transfer: json['transfer'] as int,
      keyCount: json['keyCount'] as int,
      compulsoryInsurance: json['compulsoryInsurance'] as int,
      compulsoryInsuranceDate: json['compulsoryInsuranceDate'] as int,
      commercialInsurance: json['commercialInsurance'] as int,
      commercialInsuranceDate: json['commercialInsuranceDate'] as int,
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

ContractMasterInfo _$ContractMasterInfoFromJson(Map<String, dynamic> json) =>
    ContractMasterInfo(
      name: json['name'] as String,
      idCard: json['idCard'] as String,
      phone: json['phone'] as String,
      bankCard: json['bankCard'] as String,
      bank: json['bank'] as String,
    );

Map<String, dynamic> _$ContractMasterInfoToJson(ContractMasterInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'idCard': instance.idCard,
      'phone': instance.phone,
      'bankCard': instance.bankCard,
      'bank': instance.bank,
    };
