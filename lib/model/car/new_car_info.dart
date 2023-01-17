import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_car_info.g.dart';

@JsonSerializable()
class NewCarInfo extends Equatable {
  final CarNewInfo carInfo;
  final int isSelf;

  ///是否是自己的门店
  final int isSelfStore;

  ///是否是经纪人
  final int isSelfBusiness;

  factory NewCarInfo.fromJson(Map<String, dynamic> json) =>
      _$NewCarInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NewCarInfoToJson(this);

  const NewCarInfo({
    required this.carInfo,
    required this.isSelf,
    required this.isSelfStore,
    required this.isSelfBusiness,
  });

  @override
  List<Object?> get props => [carInfo, isSelf, isSelfStore, isSelfBusiness];
}

@JsonSerializable()
class CarNewInfo extends Equatable {
  int id;
  String modelName;
  ///
  final int modelId;

  final int status;
  final String statusName;
  final int theUpper;
  final String theUpperName;
  final String vin;
  final String carSn;
  final int collect;
  final int browse;
  final int transfer;
  final String price;
  final String lastPrice;
  final String downPayment;
  final int source;
  final String  sourceName;
  final int dealerId;
  final String dealerName;
  // final String storeName;
  final String dealerSn;
  final String type;
  final String engineNo;
  final int licensingDate;
  String color;
  String interiorColor;
  String temporaryLicensePlate;
  String parkingNo;
  int stockStatus;
  String stockStatusName;

  // final int parkingNo;
  String useCharacter;
  String mileage;

  // final String newCarGuidePrice;
  final String purchaseTax;
  final String installationCost;
  int locationCityId;
  String location;
  final String attribution;
  final String condition;
  final List<ImagePhoto> carPhotos;
  final List<ImagePhoto> interiorPhotos;
  final List<ImagePhoto> defectPhotos;

  // final List<ImagePhoto> reportPhotos;
  // final List<ImagePhoto> repairPhotos;
  final List<ImagePhoto> dataPhotos;
  final BrokerInfo brokerInfo;
  final ModelInfo modelInfo;
  final PriceInfo priceInfo;

  ///purchaseInfo
  final CertificateInfo certificateInfo;
  final ContractMasterInfo contractMasterInfo;

  Map<String, dynamic> toJson() => _$CarNewInfoToJson(this);

  factory CarNewInfo.fromJson(Map<String, dynamic> json) =>
      _$CarNewInfoFromJson(json);

  @override
  List<Object?> get props => [
    id,
    modelName,
    ///
 status,
   statusName,
 theUpper,
 theUpperName,
    modelId,
    vin,
    carSn,
    collect,
    browse,
    transfer,
    price,
    lastPrice,
    downPayment,
    source,
    sourceName,
    dealerId,
    dealerName,
    locationCityId,
    dealerSn,
    type,
    engineNo,
    licensingDate,
    color,
    interiorColor,
    temporaryLicensePlate,
    parkingNo,
    stockStatus,
    stockStatusName,
    useCharacter,
    mileage,
    // newCarGuidePrice,
    purchaseTax,
    installationCost,
    location,
    attribution,
    condition,
    carPhotos,
    interiorPhotos,
    defectPhotos,
    // reportPhotos,
    // repairPhotos,
    brokerInfo,
    modelInfo,
    priceInfo,
    certificateInfo,
    contractMasterInfo,
  ];

  CarNewInfo( {
    required this.dataPhotos,
    required this.id,
    ///
    required this.status,
    required this.statusName,
    required this.theUpper,
    required this.theUpperName,
    required this.modelId,
    required this.modelName,
    // required this.storeName,
    required this.dealerSn,
    required this.vin,
    required this.carSn,
    required this.collect,
    required this.browse,
    required this.transfer,
    required this.price,
    required this.lastPrice,
    required this.downPayment,
    required this.source,
    required this.sourceName,
    required this.dealerId,
    required this.dealerName,
    required this.type,
    required this.engineNo,
    required this.locationCityId,
    required this.licensingDate,
    required this.color,
    required this.interiorColor,
    required this.temporaryLicensePlate,
    required this.stockStatus,
    required this.stockStatusName,
    required this.parkingNo,
    required this.useCharacter,
    required this.mileage,
    // required this.newCarGuidePrice,
    required this.purchaseTax,
    required this.installationCost,
    required this.location,
    required this.attribution,
    required this.condition,
    required this.carPhotos,
    required this.interiorPhotos,
    required this.defectPhotos,
    // required this.reportPhotos,
    // required this.repairPhotos,
    required this.brokerInfo,
    required this.modelInfo,
    required this.priceInfo,
    required this.certificateInfo,
    required this.contractMasterInfo,
  });
}

@JsonSerializable()
class ImagePhoto extends Equatable {
  final String photo;
  final String text;

  factory ImagePhoto.fromJson(Map<String, dynamic> json) =>
      _$ImagePhotoFromJson(json);

  @override
  List<Object?> get props => [
    photo,
    text,
  ];

  Map<String, dynamic> toJson() => _$ImagePhotoToJson(this);

  const ImagePhoto({
    required this.photo,
    required this.text,
  });
}

@JsonSerializable()
class BrokerInfo extends Equatable {
  final int brokerId;
  final String brokerNickname;
  final String brokerHeadImg;
  final String brokerPhone;

  factory BrokerInfo.fromJson(Map<String, dynamic> json) =>
      _$BrokerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BrokerInfoToJson(this);

  const BrokerInfo({
    required this.brokerId,
    required this.brokerNickname,
    required this.brokerHeadImg,
    required this.brokerPhone,
  });

  @override
  List<Object?> get props => [
    brokerId,
    brokerNickname,
    brokerHeadImg,
    brokerPhone,
  ];
}

@JsonSerializable()
class ModelInfo extends Equatable {
  final int year;
  final String price;
  final String liter;
  final String dischargeStandard;
  final String fuelTypeName;
  final int enginePower;
  final int enginePowerKw;
  final int isGreen;
  final String modelCode;
  final String driveName;
  final String driveType;
  final String modelStatus;
  final String gearType;
  final String marketDate;
  final String minRegYear;
  final String maxRegYear;
  final String stopMakeYear;
  final String intake;
  final String seatNumber;
  final String bodyType;
  final int doorNumber;
  final String carStruct;
  final int isParallel;
  final String priceAllowance;

  factory ModelInfo.fromJson(Map<String, dynamic> json) =>
      _$ModelInfoFromJson(json);

  const ModelInfo({
    required this.year,
    required this.price,
    required this.liter,
    required this.dischargeStandard,
    required this.fuelTypeName,
    required this.enginePower,
    required this.enginePowerKw,
    required this.isGreen,
    required this.modelCode,
    required this.driveName,
    required this.driveType,
    required this.modelStatus,
    required this.gearType,
    required this.marketDate,
    required this.minRegYear,
    required this.maxRegYear,
    required this.stopMakeYear,
    required this.intake,
    required this.seatNumber,
    required this.bodyType,
    required this.doorNumber,
    required this.carStruct,
    required this.isParallel,
    required this.priceAllowance,
  });

  Map<String, dynamic> toJson() => _$ModelInfoToJson(this);

  @override
  List<Object?> get props => [
    year,
    price,
    liter,
    dischargeStandard,
    fuelTypeName,
    enginePower,
    enginePowerKw,
    isGreen,
    modelCode,
    driveName,
    driveType,
    modelStatus,
    gearType,
    marketDate,
    minRegYear,
    maxRegYear,
    stopMakeYear,
    intake,
    seatNumber,
    bodyType,
    doorNumber,
    carStruct,
    isParallel,
    priceAllowance,
  ];
}

@JsonSerializable()
class PriceInfo extends Equatable {
  final String interiorPrice;
  final String exteriorPrice;

  factory PriceInfo.fromJson(Map<String, dynamic> json) =>
      _$PriceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PriceInfoToJson(this);

  const PriceInfo({
    required this.interiorPrice,
    required this.exteriorPrice,
  });

  @override
  List<Object?> get props => [
    interiorPrice,
    exteriorPrice,
  ];
}

@JsonSerializable()
class CertificateInfo extends Equatable {
  final int transfer;
  final int keyCount;
  final int compulsoryInsurance;
  final int compulsoryInsuranceDate;
  final int commercialInsurance;
  final int commercialInsuranceDate;
  final String commercialInsurancePrice;

  factory CertificateInfo.fromJson(Map<String, dynamic> json) =>
      _$CertificateInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateInfoToJson(this);

  const CertificateInfo({
    required this.transfer,
    required this.keyCount,
    required this.compulsoryInsurance,
    required this.compulsoryInsuranceDate,
    required this.commercialInsurance,
    required this.commercialInsuranceDate,
    required this.commercialInsurancePrice,
  });

  @override
  List<Object?> get props => [
    transfer,
    keyCount,
    compulsoryInsurance,
    compulsoryInsuranceDate,
    commercialInsurance,
    commercialInsuranceDate,
    commercialInsurancePrice,
  ];
}

@JsonSerializable()
class ContractMasterInfo extends Equatable {
  final String name;
  final String idCard;
  final String phone;
  final String bankCard;
  final String bank;

  factory ContractMasterInfo.fromJson(Map<String, dynamic> json) =>
      _$ContractMasterInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ContractMasterInfoToJson(this);

  const ContractMasterInfo({
    required this.name,
    required this.idCard,
    required this.phone,
    required this.bankCard,
    required this.bank,
  });

  @override
  List<Object?> get props => [
    name,
    idCard,
    phone,
    bankCard,
    bank,
  ];
}
