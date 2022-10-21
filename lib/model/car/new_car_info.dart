import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'new_car_info.g.dart';

@JsonSerializable()
class NewCarInfo extends Equatable {
  final CarNewInfo carInfo;
  final int isSelf;

  factory NewCarInfo.fromJson(Map<String, dynamic> json) =>
      _$NewCarInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NewCarInfoToJson(this);

  const NewCarInfo({
    required this.carInfo,
    required this.isSelf,
  });
  @override
  List<Object?> get props => [carInfo,isSelf,];
}

@JsonSerializable()
class CarNewInfo extends Equatable {
  final int id;
  final String modelName;
  final String vin;
  final String carSn;
  final int collect;
  final int browse;
  final int transfer;
  final String price;
  final String lastPrice;
  final String downPayment;
  final String source;
  final int sourceId;
  final String type;
  final String engineNo;
  final int licensingDate;
  final String color;
  final String interiorColor;
  final String temporaryLicensePlate;
  final int parkingNo;
  final String emissionStandard;
  final String useCharacter;
  final String Mileage;
  final int marketDate;
  final String newCarGuidePrice;
  final String purchaseTax;
  final String installationCost;
  final String location;
  final String condition;
  final List<ImagePhoto> carPhotos;
  final List<ImagePhoto> interiorPhotos;
  final List<ImagePhoto> defectPhotos;
  final List<ImagePhoto> reportPhotos;
  final BrokerInfo brokerInfo;
  final ModelInfo modelInfo;
  final PriceInfo priceInfo;
  final CertificateInfo certificateInfo;
  final ContractMasterInfo contractMasterInfo;

  //final PurchaseInfo purchaseInfo;

  factory CarNewInfo.fromJson(Map<String, dynamic> json) =>
      _$CarNewInfoFromJson(json);

  @override
  List<Object?> get props => [
        id,
        modelName,
        vin,
        carSn,
        collect,
        browse,
        transfer,
        price,
        lastPrice,
        downPayment,
        source,
        sourceId,
        type,
        engineNo,
        licensingDate,
        color,
        interiorColor,
        temporaryLicensePlate,
        parkingNo,
        emissionStandard,
        useCharacter,
        Mileage,
        marketDate,
        newCarGuidePrice,
        purchaseTax,
        installationCost,
        location,
        condition,
        carPhotos,
        interiorPhotos,
        defectPhotos,
        reportPhotos,
        brokerInfo,
        modelInfo,
        priceInfo,
        certificateInfo,
        contractMasterInfo,
      ];

  const CarNewInfo({
    required this.id,
    required this.modelName,
    required this.vin,
    required this.carSn,
    required this.collect,
    required this.browse,
    required this.transfer,
    required this.price,
    required this.lastPrice,
    required this.downPayment,
    required this.source,
    required this.sourceId,
    required this.type,
    required this.engineNo,
    required this.licensingDate,
    required this.color,
    required this.interiorColor,
    required this.temporaryLicensePlate,
    required this.parkingNo,
    required this.emissionStandard,
    required this.useCharacter,
    required this.Mileage,
    required this.marketDate,
    required this.newCarGuidePrice,
    required this.purchaseTax,
    required this.installationCost,
    required this.location,
    required this.condition,
    required this.carPhotos,
    required this.interiorPhotos,
    required this.defectPhotos,
    required this.reportPhotos,
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

  const BrokerInfo({
    required this.brokerId,
    required this.brokerNickname,
    required this.brokerHeadImg,
    required this.brokerPhone,
  });

  @override
  List<Object?> get props => [brokerId,brokerNickname,brokerHeadImg,brokerPhone,];
}


@JsonSerializable()
class ModelInfo extends Equatable{
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
  factory ModelInfo.fromJson(Map<String, dynamic> json) =>_$ModelInfoFromJson(json);

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
  @override
  List<Object?> get props => [year,price,liter,dischargeStandard,fuelTypeName,
    enginePower,enginePowerKw,isGreen,modelCode,driveName,driveType,modelStatus,
    gearType,marketDate,minRegYear,maxRegYear,stopMakeYear,intake,seatNumber,
    bodyType,doorNumber,carStruct,isParallel,priceAllowance,];
}


@JsonSerializable()
class PriceInfo extends Equatable{
  final String purchasePrice;
  final String salePrice;
  factory PriceInfo.fromJson(Map<String, dynamic> json) =>_$PriceInfoFromJson(json);

  const PriceInfo({
    required this.purchasePrice,
    required this.salePrice,
  });
  @override
  List<Object?> get props => [purchasePrice,salePrice,];
}

@JsonSerializable()
class CertificateInfo extends Equatable{
  final int transfer;
  final int keyCount;
  final int compulsoryInsurance;
  final int compulsoryInsuranceDate;
  final int commercialInsurance;
  final int commercialInsuranceDate;
  final String commercialInsurancePrice;

  factory CertificateInfo.fromJson(Map<String, dynamic> json) =>_$CertificateInfoFromJson(json);

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
  List<Object?> get props => [transfer,keyCount,compulsoryInsurance,
    compulsoryInsuranceDate,commercialInsurance,commercialInsuranceDate,
    commercialInsurancePrice,];
}

@JsonSerializable()
class ContractMasterInfo extends Equatable{
  final String name;
  final String idCard;
  final String phone;
  final String bankCard;
  final String bank;
  factory ContractMasterInfo.fromJson(Map<String, dynamic> json) =>_$ContractMasterInfoFromJson(json);

  const ContractMasterInfo({
    required this.name,
    required this.idCard,
    required this.phone,
    required this.bankCard,
    required this.bank,
  });
  @override
  List<Object?> get props => [name,idCard,phone,bankCard,bank,];
}





