import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import '../../ui/home/car_manager/publish_car/push_photo_model.dart';
import 'new_car_info.dart';

part 'edit_info_model.g.dart';

@JsonSerializable()
class EditInfoModel extends Equatable {
  final CarInfos carInfo;
  final int auditStatus;
  final String auditStatusName;
  final num dealerAuditAt;
  final num createdAt;
  final String rejectReason;

  factory EditInfoModel.fromJson(Map<String, dynamic> json) =>
      _$EditInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditInfoModelToJson(this);

  static get init => const EditInfoModel(
        carInfo: CarInfos(
          id: 0,
          modelId: 0,
          modelName: "",
          status: 0,
          statusName: '',
          theUpper: 0,
          theUpperName: '',
          vin: '',
          carSn: '',
          collect: 0,
          isCollect: 0,
          browse: 0,
          transfer: 0,
          price: '',
          lastPrice: '',
          downPayment: '',
          sourceName: '',
          source: 0,
          dealerId: 0,
          dealerName: '',
          dealerSn: '',
          locationCityId: 0,
          attributionCityId: 0,
          remark: '',
          stockStatus: 0,
          stockStatusName: '',
          type: '',
          engineNo: '',
          licensingDate: 0,
          color: '',
          interiorColor: '',
          location: '',
          attribution: '',
          condition: '',
          carPhotos: [],
          interiorPhotos: [],
          temporaryLicensePlate: '',
          parkingNo: '',
          useCharacter: '',
          mileage: '',
          purchaseTax: '',
          installationCost: '',
          defectPhotos: [],
          dataPhotos: [],
          brokerInfo: BrokerInfo(
              brokerId: 0,
              brokerNickname: '',
              brokerHeadImg: '',
              brokerPhone: ''),
          modelInfo: ModelInfo(
            year: 0,
            price: "",
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
          purchaseInfo: PurchaseInfoS(price: '', date: 0, liaison: ''),
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
        ),
        auditStatus: 0,
        auditStatusName: '',
        dealerAuditAt: 0,
        createdAt: 0,
      rejectReason:'',
      );

  @override
  List<Object?> get props => [
    rejectReason,
        carInfo,
        auditStatus,
        auditStatusName,
        dealerAuditAt,
        createdAt,
      ];

  const EditInfoModel({
    required this.rejectReason,
    required this.carInfo,
    required this.auditStatus,
    required this.auditStatusName,
    required this.dealerAuditAt,
    required this.createdAt,
  });
}

@JsonSerializable()
class PurchaseInfoS extends Equatable {
  final String price;
  final num date;
  final String liaison;

  factory PurchaseInfoS.fromJson(Map<String, dynamic> json) =>
      _$PurchaseInfoSFromJson(json);

  const PurchaseInfoS({
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

@JsonSerializable()
class CarInfos extends Equatable {
  final int id;
  final int modelId;
  final String modelName;
  final int status;
  final String statusName;
  final int theUpper;
  final String theUpperName;
  final String vin;
  final String carSn;
  final int collect;
  final int isCollect;
  final int browse;
  final int transfer;
  final String price;
  final String lastPrice;
  final String downPayment;
  final String sourceName;
  final int source;
  final int dealerId;
  final String dealerName;
  final String dealerSn;
  final int locationCityId;
  final int attributionCityId;
  final String remark;
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
  final List<CarPhotos> carPhotos;
  final List<CarPhotos> interiorPhotos;
  final List<CarPhotos> defectPhotos;
  final List<CarPhotos> dataPhotos;
  final BrokerInfo brokerInfo;
  final ModelInfo modelInfo;
  final PriceInfo priceInfo;
  final PurchaseInfoS purchaseInfo;
  final CertificateInfo certificateInfo;
  final ContractMasterInfo contractMasterInfo;

  // final String storeName;
  // final String remark;
  // final DealerInfo dealerInfo;
  final int stockStatus;
  final String stockStatusName;

  // final num dealerAuditAt;
  // final String dealerRejectReason;
  // final num auditAt;
  // final String rejectReason;
  // final num createdAt;

  factory CarInfos.fromJson(Map<String, dynamic> json) =>
      _$CarInfosFromJson(json);

  Map<String, dynamic> toJson() => _$CarInfosToJson(this);

  const CarInfos({
    required this.id,
    required this.modelId,
    required this.modelName,
    required this.status,
    required this.statusName,
    required this.theUpper,
    required this.theUpperName,
    required this.vin,
    required this.carSn,
    required this.collect,
    required this.isCollect,
    required this.browse,
    required this.transfer,
    required this.price,
    required this.lastPrice,
    required this.downPayment,
    required this.sourceName,
    required this.source,
    required this.dealerId,
    required this.dealerName,
    required this.dealerSn,
    required this.locationCityId,
    required this.attributionCityId,
    required this.remark,
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
    required this.modelInfo,
    required this.priceInfo,
    required this.purchaseInfo,
    required this.certificateInfo,
    required this.contractMasterInfo,
    required this.stockStatus,
    required this.stockStatusName,
  });

  @override
  List<Object?> get props => [
        id,
        modelId,
        modelName,
        status,
        statusName,
        theUpper,
        theUpperName,
        vin,
        carSn,
        collect,
        isCollect,
        browse,
        transfer,
        price,
        lastPrice,
        downPayment,
        sourceName,
        source,
        dealerId,
        dealerName,
        dealerSn,
        locationCityId,
        attributionCityId,
        remark,
        stockStatus,
        stockStatusName,
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
        modelInfo,
        priceInfo,
        purchaseInfo,
        certificateInfo,
        contractMasterInfo,
      ];
}
