import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import 'car/new_car_info.dart';

part 'publish_info_model.g.dart';

@JsonSerializable()
class PublishInfoModel extends Equatable {
  final int id;
  final int modelId;
  final String modelName;
  final int status;
  final String statusName;
  final int theUpper;
  final String theUpperName;
  final String vin;
  final int transfer;
  final String price;
  final String lastPrice;
  final String downPayment;
  final String sourceName;
  final int source;

  // final String storeName;
  final String type;
  final String engineNo;
  final num licensingDate;
  final String color;
  final String interiorColor;
  final String temporaryLicensePlate;
  final String parkingNo;
  final String useCharacter;
  final String mileage;
  final String purchaseTax;
  final String installationCost;
  final String location;
  final String attribution;
  final String condition;
  final List<ImagePhotos> carPhotos;
  final List<ImagePhotos> interiorPhotos;
  final List<ImagePhotos> defectPhotos;
  final List<ImagePhotos> dataPhotos;
  final BrokerInfo brokerInfo;
  final DealerInfo dealerInfo;
  final ModelInfo modelInfo;
  final PriceInfo priceInfo;
  final PurchaseInfos purchaseInfo;
  final CertificateInfo certificateInfo;
  final ContractMasterInfo contractMasterInfo;
  final num dealerAuditAt;
  final String dealerRejectReason;
  final num auditAt;
  final String rejectReason;
  final num createdAt;

  factory PublishInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PublishInfoModelFromJson(json);

  static get init => const PublishInfoModel(
        id: 0,
        modelId: 0,
        modelName: '',
        status: 0,
        statusName: '',
        theUpper: 0,
        theUpperName: '',
        vin: '',
        transfer: 0,
        price: '',
        lastPrice: '',
        downPayment: '',
        source: 0,
        sourceName: '',
        // sourceId: 0,
        // storeName: '',
        type: '',
        engineNo: '',
        licensingDate: 0,
        color: '',
        interiorColor: '',
        temporaryLicensePlate: "",
        parkingNo: '',
        useCharacter: '',
        mileage: '',
        purchaseTax: '',
        installationCost: '',
        location: '',
        attribution: '',
        condition: '',
        carPhotos: [],
        interiorPhotos: [],
        defectPhotos: [],
        dataPhotos: [],
        brokerInfo: BrokerInfo(
            brokerId: 0,
            brokerNickname: '',
            brokerHeadImg: '',
            brokerPhone: ''),
        dealerInfo: DealerInfo(
            id: 0,
            name: '',
            ownerBrokerId: 0,
            ownerBrokerName: '',
            ownerBrokerTel: ''),
        modelInfo: ModelInfo(
          year: 0,
          price: '',
          liter: '',
          dischargeStandard: '',
          fuelTypeName: '',
          enginePower: 0,
          enginePowerKw: 0,
          isGreen: 0,
          modelCode: '',
          driveName: '',
          driveType: '',
          modelStatus: '',
          gearType: '',
          marketDate: '',
          minRegYear: '',
          maxRegYear: '',
          stopMakeYear: '',
          intake: '',
          seatNumber: '',
          bodyType: '',
          doorNumber: 0,
          carStruct: '',
          isParallel: 0,
          priceAllowance: '',
        ),
        priceInfo: PriceInfo(interiorPrice: '', exteriorPrice: ''),
        purchaseInfo: PurchaseInfos(price: '', date: 0, liaison: ''),
        certificateInfo: CertificateInfo(
            transfer: 0,
            keyCount: 0,
            compulsoryInsurance: 0,
            compulsoryInsuranceDate: 0,
            commercialInsurance: 0,
            commercialInsuranceDate: 0,
            commercialInsurancePrice: ''),
        contractMasterInfo: ContractMasterInfo(
            name: '', idCard: '', phone: '', bankCard: '', bank: ''),
        dealerAuditAt: 0,
        dealerRejectReason: '',
        auditAt: 0,
        rejectReason: '',
        createdAt: 0,
      );

  Map<String, dynamic> toJson() => _$PublishInfoModelToJson(this);

  const PublishInfoModel({
    required this.id,
    required this.modelId,
    required this.modelName,
    required this.status,
    required this.statusName,
    required this.theUpper,
    required this.theUpperName,
    required this.vin,
    required this.transfer,
    required this.price,
    required this.lastPrice,
    required this.downPayment,
    required this.source,
    required this.sourceName,
    // required this.sourceId,
    // required this.storeName,
    required this.type,
    required this.engineNo,
    required this.licensingDate,
    required this.color,
    required this.interiorColor,
    required this.temporaryLicensePlate,
    required this.parkingNo,
    required this.useCharacter,
    required this.mileage,
    required this.purchaseTax,
    required this.installationCost,
    required this.location,
    required this.attribution,
    required this.condition,
    required this.carPhotos,
    required this.interiorPhotos,
    required this.defectPhotos,
    required this.dataPhotos,
    required this.brokerInfo,
    required this.dealerInfo,
    required this.modelInfo,
    required this.priceInfo,
    required this.purchaseInfo,
    required this.certificateInfo,
    required this.contractMasterInfo,
    required this.dealerAuditAt,
    required this.dealerRejectReason,
    required this.auditAt,
    required this.rejectReason,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        modelId,
        modelName,
        status,
        statusName,
        theUpper,
        theUpperName,
        vin,
        transfer,
        price,
        lastPrice,
        downPayment,
        source,
        sourceName,
        // sourceId,
        // storeName,
        type,
        engineNo,
        licensingDate,
        color,
        interiorColor,
        temporaryLicensePlate,
        parkingNo,
        useCharacter,
        mileage,
        purchaseTax,
        installationCost,
        location,
        attribution,
        condition,
        carPhotos,
        interiorPhotos,
        defectPhotos,
        dataPhotos,
        brokerInfo,
        dealerInfo,
        modelInfo,
        priceInfo,
        purchaseInfo,
        certificateInfo,
        contractMasterInfo,
        dealerAuditAt,
        dealerRejectReason,
        auditAt,
        rejectReason,
        createdAt,
      ];
}

@JsonSerializable()
class BaseInfo extends Equatable {
  final int type;
  final String typeName;
  final int modelId;
  final String modelName;
  final String vin;
  final String engineNo;
  final int licensingDate;
  final String color;
  final String interiorColor;
  final String temporaryLicensePlate;
  final String parkingNo;
  final String useCharacter;
  final String shamMileage;
  final String purchaseTax;
  final String installationCost;
  final String location;
  final String attribution;
  final String condition;
  final String remark;

  factory BaseInfo.fromJson(Map<String, dynamic> json) =>
      _$BaseInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BaseInfoToJson(this);

  const BaseInfo({
    required this.type,
    required this.typeName,
    required this.modelId,
    required this.modelName,
    required this.vin,
    required this.engineNo,
    required this.licensingDate,
    required this.color,
    required this.interiorColor,
    required this.temporaryLicensePlate,
    required this.parkingNo,
    required this.useCharacter,
    required this.shamMileage,
    required this.purchaseTax,
    required this.installationCost,
    required this.location,
    required this.attribution,
    required this.condition,
    required this.remark,
  });

  @override
  List<Object?> get props => [
        type,
        typeName,
        modelId,
        modelName,
        vin,
        engineNo,
        licensingDate,
        color,
        interiorColor,
        temporaryLicensePlate,
        parkingNo,
        useCharacter,
        shamMileage,
        purchaseTax,
        installationCost,
        location,
        attribution,
        condition,
        remark,
      ];
}

@JsonSerializable()
class BrokerInfo extends Equatable {
  final int brokerId;
  final String brokerNickname;
  final String brokerPhone;
  final String brokerHeadImg;

  factory BrokerInfo.fromJson(Map<String, dynamic> json) =>
      _$BrokerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BrokerInfoToJson(this);

  const BrokerInfo({
    required this.brokerId,
    required this.brokerNickname,
    required this.brokerPhone,
    required this.brokerHeadImg,
  });

  @override
  List<Object?> get props => [
        brokerId,
        brokerNickname,
        brokerPhone,
        brokerHeadImg,
      ];
}

@JsonSerializable()
class DealerInfo extends Equatable {
  final int id;
  final String name;
  final int ownerBrokerId;
  final String ownerBrokerName;
  final String ownerBrokerTel;

  factory DealerInfo.fromJson(Map<String, dynamic> json) =>
      _$DealerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DealerInfoToJson(this);

  const DealerInfo({
    required this.id,
    required this.name,
    required this.ownerBrokerId,
    required this.ownerBrokerName,
    required this.ownerBrokerTel,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        ownerBrokerId,
        ownerBrokerName,
        ownerBrokerTel,
      ];
}

@JsonSerializable()
class Photos extends Equatable {
  final List<ImagePhotos> carPhotos;
  final List<ImagePhotos> interiorPhotos;
  final List<ImagePhotos> defectPhotos;
  final List<ImagePhotos> dataPhotos;

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);

  Map<String, dynamic> toJson() => _$PhotosToJson(this);

  const Photos({
    required this.carPhotos,
    required this.interiorPhotos,
    required this.defectPhotos,
    required this.dataPhotos,
  });

  @override
  List<Object?> get props => [
        interiorPhotos,
        defectPhotos,
        dataPhotos,
      ];
}

@JsonSerializable()
class ImagePhotos extends Equatable {
  final String Photo;
  final String Text;

  factory ImagePhotos.fromJson(Map<String, dynamic> json) =>
      _$ImagePhotosFromJson(json);

  @override
  List<Object?> get props => [
        Photo,
        Text,
      ];

  Map<String, dynamic> toJson() => _$ImagePhotosToJson(this);

  const ImagePhotos({
    required this.Photo,
    required this.Text,
  });
}

@JsonSerializable()
class CertificateInfo extends Equatable {
  final int transfer;
  final int keyCount;
  final int compulsoryInsurance;
  final num compulsoryInsuranceDate;
  final int commercialInsurance;
  final num commercialInsuranceDate;
  final String commercialInsurancePrice;

  factory CertificateInfo.fromJson(Map<String, dynamic> json) =>
      _$CertificateInfoFromJson(json);

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
class PurchaseInfos extends Equatable {
  final String price;
  final num date;
  final String liaison;

  factory PurchaseInfos.fromJson(Map<String, dynamic> json) =>
      _$PurchaseInfosFromJson(json);

  const PurchaseInfos({
    required this.price,
    required this.date,
    required this.liaison,
  });

  @override
  List<Object?> get props => [
        price,
        date,
        liaison,
      ];
}
