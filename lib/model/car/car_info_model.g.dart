// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarInfoModel _$CarInfoModelFromJson(Map<String, dynamic> json) => CarInfoModel(
      carInfo: CarCommonInfo.fromJson(json['carInfo'] as Map<String, dynamic>),
      isSelf: json['isSelf'] as int,
    );

Map<String, dynamic> _$CarInfoModelToJson(CarInfoModel instance) =>
    <String, dynamic>{
      'carInfo': instance.carInfo,
      'isSelf': instance.isSelf,
    };

CarCommonInfo _$CarCommonInfoFromJson(Map<String, dynamic> json) =>
    CarCommonInfo(
      id: json['id'] as int,
      modelName: json['modelName'] as String,
      carSn: json['carSn'] as String,
      collect: json['collect'] as int,
      browse: json['browse'] as int,
      transfer: json['transfer'] as int,
      licensingDate: json['licensingDate'] as int,
      color: json['color'] as String,
      price: json['price'] as String,
      lastPrice: json['lastPrice'] as String,
      downPayment: json['downPayment'] as String,
      mileage: json['Mileage'] as String,
      carPhotos:
          (json['carPhotos'] as List<dynamic>).map((e) => e as String).toList(),
      interiorPhotos: (json['interiorPhotos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      brokerInfo:
          CarBrokerInfo.fromJson(json['brokerInfo'] as Map<String, dynamic>),
      modelInfo:
          CarModelInfo.fromJson(json['modelInfo'] as Map<String, dynamic>),
      orderInfo:
          CarOrderInfo.fromJson(json['orderInfo'] as Map<String, dynamic>),
      contractInfo: CarContractInfo.fromJson(
          json['contractInfo'] as Map<String, dynamic>),
      contractMasterInfo: CarContractMaterInfo.fromJson(
          json['contractMasterInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CarCommonInfoToJson(CarCommonInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modelName': instance.modelName,
      'carSn': instance.carSn,
      'collect': instance.collect,
      'browse': instance.browse,
      'transfer': instance.transfer,
      'licensingDate': instance.licensingDate,
      'color': instance.color,
      'price': instance.price,
      'lastPrice': instance.lastPrice,
      'downPayment': instance.downPayment,
      'Mileage': instance.mileage,
      'carPhotos': instance.carPhotos,
      'interiorPhotos': instance.interiorPhotos,
      'brokerInfo': instance.brokerInfo,
      'modelInfo': instance.modelInfo,
      'orderInfo': instance.orderInfo,
      'contractInfo': instance.contractInfo,
      'contractMasterInfo': instance.contractMasterInfo,
    };

CarContractMaterInfo _$CarContractMaterInfoFromJson(
        Map<String, dynamic> json) =>
    CarContractMaterInfo(
      name: json['name'] as String,
      idCard: json['idCard'] as String,
      phone: json['phone'] as String,
      bankCard: json['bankCard'] as String,
      bank: json['bank'] as String,
    );

Map<String, dynamic> _$CarContractMaterInfoToJson(
        CarContractMaterInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'idCard': instance.idCard,
      'phone': instance.phone,
      'bankCard': instance.bankCard,
      'bank': instance.bank,
    };

CarBrokerInfo _$CarBrokerInfoFromJson(Map<String, dynamic> json) =>
    CarBrokerInfo(
      brokerId: json['brokerId'] as int,
      brokerNickname: json['brokerNickname'] as String,
      brokerHeadImg: json['brokerHeadImg'] as String,
      brokerPhone: json['brokerPhone'] as String,
    );

Map<String, dynamic> _$CarBrokerInfoToJson(CarBrokerInfo instance) =>
    <String, dynamic>{
      'brokerId': instance.brokerId,
      'brokerNickname': instance.brokerNickname,
      'brokerHeadImg': instance.brokerHeadImg,
      'brokerPhone': instance.brokerPhone,
    };

CarModelInfo _$CarModelInfoFromJson(Map<String, dynamic> json) => CarModelInfo(
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

Map<String, dynamic> _$CarModelInfoToJson(CarModelInfo instance) =>
    <String, dynamic>{
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

CarOrderInfo _$CarOrderInfoFromJson(Map<String, dynamic> json) => CarOrderInfo(
      interiorColor: json['interiorColor'] as String,
      displacement: json['displacement'] as String,
      gearbox: json['gearbox'] as String,
      emissionStandard: json['emissionStandard'] as String,
      useCharacter: json['useCharacter'] as String,
      locationCity: json['locationCity'] as String,
      attributionCity: json['attributionCity'] as String,
      conditionIn: json['conditionIn'] as String,
      conditionOut: json['conditionOut'] as String,
    );

Map<String, dynamic> _$CarOrderInfoToJson(CarOrderInfo instance) =>
    <String, dynamic>{
      'interiorColor': instance.interiorColor,
      'displacement': instance.displacement,
      'gearbox': instance.gearbox,
      'emissionStandard': instance.emissionStandard,
      'useCharacter': instance.useCharacter,
      'locationCity': instance.locationCity,
      'attributionCity': instance.attributionCity,
      'conditionIn': instance.conditionIn,
      'conditionOut': instance.conditionOut,
    };

CarContractInfo _$CarContractInfoFromJson(Map<String, dynamic> json) =>
    CarContractInfo(
      vin: json['vin'] as String,
      licensePlate: json['licensePlate'] as String,
      keyCount: json['keyCount'] as int,
      engine: json['engine'] as String,
      compulsoryInsurance: json['compulsoryInsurance'] as int,
      compulsoryInsuranceDate: json['compulsoryInsuranceDate'] as int,
      commercialInsurance: json['commercialInsurance'] as int,
      commercialInsuranceDate: json['commercialInsuranceDate'] as int,
      commercialInsurancePrice: json['commercialInsurancePrice'] as String,
      exterior: json['exterior'] as String,
      interiorTrim: json['interiorTrim'] as String,
      workingCondition: json['workingCondition'] as String,
    );

Map<String, dynamic> _$CarContractInfoToJson(CarContractInfo instance) =>
    <String, dynamic>{
      'vin': instance.vin,
      'licensePlate': instance.licensePlate,
      'keyCount': instance.keyCount,
      'engine': instance.engine,
      'compulsoryInsurance': instance.compulsoryInsurance,
      'compulsoryInsuranceDate': instance.compulsoryInsuranceDate,
      'commercialInsurance': instance.commercialInsurance,
      'commercialInsuranceDate': instance.commercialInsuranceDate,
      'commercialInsurancePrice': instance.commercialInsurancePrice,
      'exterior': instance.exterior,
      'interiorTrim': instance.interiorTrim,
      'workingCondition': instance.workingCondition,
    };
