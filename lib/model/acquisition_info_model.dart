import 'package:cloud_car/model/publish_info_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'acquisition_info_model.g.dart';

@JsonSerializable()
class AcquisitionInfoModel extends Equatable {
  final int id;
  final int status;
  final String statusName;
  final num createdAt;
  final BaseInfo baseInfo;
  final DealerInfo dealerInfo;
  final BrokerInfo brokerInfo;
  final BrokerInfo customerInfo;
  final MasterInfo masterInfo;
  final PriceInfo priceInfo;
  final Photos photos;
  final DealerAuditInfo dealerAuditInfo;

  factory AcquisitionInfoModel.fromJson(Map<String, dynamic> json) =>
      _$AcquisitionInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$AcquisitionInfoModelToJson(this);

  const AcquisitionInfoModel({
    required this.id,
    required this.status,
    required this.statusName,
    required this.createdAt,
    required this.baseInfo,
    required this.dealerInfo,
    required this.brokerInfo,
    required this.customerInfo,
    required this.masterInfo,
    required this.priceInfo,
    required this.photos,
    required this.dealerAuditInfo,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        statusName,
        createdAt,
        baseInfo,
        dealerInfo,
        brokerInfo,
        customerInfo,
        masterInfo,
        priceInfo,
        photos,
        dealerAuditInfo,
      ];
}

@JsonSerializable()
class BaseInfo extends Equatable {
  final int modelId;
  final String modelName;
  final String contractSn;
  final String vin;
  final String engineNo;
  final num licensingDate;
  final String licensePlate;
  final String useCharacter;
  final String mileage;
  final num compulsoryInsuranceDate;
  final String condition;
  final String color;

  factory BaseInfo.fromJson(Map<String, dynamic> json) =>
      _$BaseInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BaseInfoToJson(this);

  const BaseInfo({
    required this.modelId,
    required this.modelName,
    required this.contractSn,
    required this.vin,
    required this.engineNo,
    required this.licensingDate,
    required this.licensePlate,
    required this.useCharacter,
    required this.mileage,
    required this.compulsoryInsuranceDate,
    required this.condition,
    required this.color,
  });

  @override
  List<Object?> get props => [
        modelId,
        modelName,
        contractSn,
        vin,
        engineNo,
        licensingDate,
        licensePlate,
    useCharacter,
        mileage,
        num,
        condition,
        color,
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
class MasterInfo extends Equatable {
  final int id;
  final int kind;
  final String kindName;
  final String name;
  final String phone;
  final String legalPerson;
  final String idCard;
  final String bankCard;
  final String bank;

  factory MasterInfo.fromJson(Map<String, dynamic> json) =>
      _$MasterInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MasterInfoToJson(this);

  const MasterInfo({
    required this.id,
    required this.kind,
    required this.kindName,
    required this.name,
    required this.phone,
    required this.legalPerson,
    required this.idCard,
    required this.bankCard,
    required this.bank,
  });

  @override
  List<Object?> get props => [
        id,
        kind,
        kindName,
        name,
        phone,
        legalPerson,
        idCard,
        bankCard,
        bank,
      ];
}

@JsonSerializable()
class PriceInfo extends Equatable {
  final String dealPrice;
  final String downPayment;
  final String balancePayment;
  final num deliverDate;

  factory PriceInfo.fromJson(Map<String, dynamic> json) =>
      _$PriceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PriceInfoToJson(this);

  const PriceInfo({
    required this.dealPrice,
    required this.downPayment,
    required this.balancePayment,
    required this.deliverDate,
  });

  @override
  List<Object?> get props => [
        dealPrice,
        downPayment,
        deliverDate,
        balancePayment
      ];
}

@JsonSerializable()
class Photos extends Equatable {
  final List<ImagePhotos> CarPhotos;
  final List<ImagePhotos> DataPhotos;

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);

  Map<String, dynamic> toJson() => _$PhotosToJson(this);

  const Photos({
    required this.CarPhotos,
    required this.DataPhotos,
  });

  @override
  List<Object?> get props => [
        CarPhotos,
        DataPhotos,
      ];
}

@JsonSerializable()
class DealerAuditInfo extends Equatable {
  final int id;
  final num dealerAuditAt;
  final String dealerRejectReason;

  factory DealerAuditInfo.fromJson(Map<String, dynamic> json) =>
      _$DealerAuditInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DealerAuditInfoToJson(this);

  const DealerAuditInfo({
    required this.id,
    required this.dealerAuditAt,
    required this.dealerRejectReason,
  });

  @override
  List<Object?> get props => [
        id,
        dealerAuditAt,
        dealerRejectReason,
      ];
}
