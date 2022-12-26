import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import 'car/new_car_info.dart';

part 'publish_info_model.g.dart';

@JsonSerializable()
class PublishInfoModel extends Equatable {
  final int id;
  final int status;
  final String statusName;
  final int theUpper;
  final String theUpperName;
  final int source;
  final String sourceName;
  final BaseInfo baseInfo;
  final BrokerInfo brokerInfo;
  final DealerInfo dealerInfo;
  final BrokerInfo customerInfo;
  final Photos photos;
  final PriceInfo priceInfo;
  final CertificateInfo certificateInfo;
  final num dealerAuditAt;
  final String deaerRejectReason;///错误字段
  final num auditAt;
  final String rejectReason;
  final num createdAt;

  factory PublishInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PublishInfoModelFromJson(json);

  static get init => const PublishInfoModel(
        id: 0,
        status: 0,
        statusName: '',
        theUpper: 0,
        theUpperName: '',
        source: 0,
        sourceName: '',
        baseInfo: BaseInfo(
          type: 0,
          typeName: '',
          modelId: 0,
          modelName: '',
          vin: '',
          engineNo: '',
          licensingDate: 0,
          color: '',
          interiorColor: '',
          temporaryLicensePlate: '',
          parkingNo: '',
          useCharacter: '',
          shamMileage: '',
          purchaseTax: '',
          installationCost: '',
          location: '',
          attribution: '',
          condition: '',
          remark: '',
        ),
        brokerInfo: BrokerInfo(id: 0, name: '', tel: ''),
        dealerInfo: DealerInfo(
            id: 0,
            name: '',
            ownerBrokerId: 0,
            ownerBrokerName: '',
            ownerBrokerTel: ''),
        customerInfo: BrokerInfo(id: 0, name: '', tel: ''),
        photos: Photos(
            carPhotos: [],
            interiorPhotos: [],
            defectPhotos: [],
            dataPhotos: []),
        priceInfo: PriceInfo(interiorPrice: '', exteriorPrice: ''),
        certificateInfo: CertificateInfo(
            transfer: 0,
            keyCount: 0,
            compulsoryInsurance: 0,
            compulsoryInsuranceDate: 0,
            commercialInsurance: 0,
            commercialInsuranceDate: 0,
            commercialInsurancePrice: ''),
        dealerAuditAt: 0,
    deaerRejectReason: '',
        auditAt: 0,
        rejectReason: '',
        createdAt: 0,
      );

  Map<String, dynamic> toJson() => _$PublishInfoModelToJson(this);

  const PublishInfoModel({
    required this.id,
    required this.status,
    required this.statusName,
    required this.theUpper,
    required this.theUpperName,
    required this.source,
    required this.sourceName,
    required this.baseInfo,
    required this.brokerInfo,
    required this.dealerInfo,
    required this.customerInfo,
    required this.photos,
    required this.priceInfo,
    required this.certificateInfo,
    required this.dealerAuditAt,
    required this.deaerRejectReason,
    required this.auditAt,
    required this.rejectReason,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        status,
        statusName,
        theUpper,
        theUpperName,
        source,
        sourceName,
        baseInfo,
        brokerInfo,
        dealerInfo,
        customerInfo,
        photos,
        priceInfo,
        certificateInfo,
        dealerAuditAt,
    deaerRejectReason,
        auditAt,
        rejectReason,
        num,
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
  final num licensingDate;
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
  final int id;
  final String name;
  final String tel;

  factory BrokerInfo.fromJson(Map<String, dynamic> json) =>
      _$BrokerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BrokerInfoToJson(this);

  const BrokerInfo({
    required this.id,
    required this.name,
    required this.tel,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        tel,
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
  final List<ImagePhoto> carPhotos;
  final List<ImagePhoto> interiorPhotos;
  final List<ImagePhoto> defectPhotos;
  final List<ImagePhoto> dataPhotos;

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
class certificateInfo extends Equatable {
  final int transfer;
  final int keyCount;
  final int compulsoryInsurance;
  final num compulsoryInsuranceDate;
  final int commercialInsurance;
  final num commercialInsuranceDate;
  final String commercialInsurancePrice;

  factory certificateInfo.fromJson(Map<String, dynamic> json) =>
      _$certificateInfoFromJson(json);

  Map<String, dynamic> toJson() => _$certificateInfoToJson(this);

  const certificateInfo({
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
