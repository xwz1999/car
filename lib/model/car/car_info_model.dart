import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_info_model.g.dart';

@JsonSerializable()
class CarInfoModel extends Equatable {
  final CarCommonInfo carInfo;
  final int isSelf;

  factory CarInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CarInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarInfoModelToJson(this);

  @override
  List<Object?> get props => [
        carInfo,
        isSelf,
      ];

  const CarInfoModel({
    required this.carInfo,
    required this.isSelf,
  });
}

@JsonSerializable()
class CarCommonInfo extends Equatable {
  final int id;
  final String modelName;
  final String carSn;
  final int collect;
  final int browse;
  final int transfer;
  final int licensingDate;
  final String color;
  final String price;
  final String lastPrice;
  final String downPayment;
  final String mileage;
  final List<String> carPhotos;
  final List<String> interiorPhotos;
  final CarBrokerInfo brokerInfo;
  final CarModelInfo modelInfo;
  final CarOrderInfo orderInfo;
  final CarContractInfo contractInfo;
  final CarContractMaterInfo contractMasterInfo;

  @override
  List<Object?> get props => [
        id,
        modelName,
        carSn,
        collect,
        browse,
        transfer,
        licensingDate,
        color,
        price,
        lastPrice,
        downPayment,
        mileage,
        carPhotos,
        interiorPhotos,
        brokerInfo,
        modelInfo,
        orderInfo,
        contractInfo,
        contractMasterInfo,
      ];

  factory CarCommonInfo.fromJson(Map<String, dynamic> json) =>
      _$CarCommonInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CarCommonInfoToJson(this);

  const CarCommonInfo({
    required this.id,
    required this.modelName,
    required this.carSn,
    required this.collect,
    required this.browse,
    required this.transfer,
    required this.licensingDate,
    required this.color,
    required this.price,
    required this.lastPrice,
    required this.downPayment,
    required this.mileage,
    required this.carPhotos,
    required this.interiorPhotos,
    required this.brokerInfo,
    required this.modelInfo,
    required this.orderInfo,
    required this.contractInfo,
    required this.contractMasterInfo,
  });
}

@JsonSerializable()
class CarContractMaterInfo extends Equatable {
  final String name;
  final String idCard;
  final String phone;
  final String bankCard;
  final String bank;

  @override
  List<Object?> get props => [
        name,
        idCard,
        phone,
        bankCard,
        bank,
      ];

  factory CarContractMaterInfo.fromJson(Map<String, dynamic> json) =>
      _$CarContractMaterInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CarContractMaterInfoToJson(this);

  const CarContractMaterInfo({
    required this.name,
    required this.idCard,
    required this.phone,
    required this.bankCard,
    required this.bank,
  });
}

@JsonSerializable()
class CarBrokerInfo extends Equatable {
  final int brokerId;
  final String brokerNickname;
  final String brokerHeadImg;
  final String brokerPhone;

  @override
  List<Object?> get props => [
        brokerId,
        brokerNickname,
        brokerHeadImg,
        brokerPhone,
      ];

  factory CarBrokerInfo.fromJson(Map<String, dynamic> json) =>
      _$CarBrokerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CarBrokerInfoToJson(this);

  const CarBrokerInfo({
    required this.brokerId,
    required this.brokerNickname,
    required this.brokerHeadImg,
    required this.brokerPhone,
  });
}

@JsonSerializable()
class CarModelInfo extends Equatable {
  final int year; // 年份
  final String price; // 指导价
  final String liter; // 排量
  final String dischargeStandard; // 排放标准
  final String fuelTypeName; // 燃料类型名称
  final int enginePower; // 马力
  final int enginePowerKw; // 马力转换功率
  final int isGreen; // 是否新能源车 0=否 1=是
  final String modelCode; // 汽车公告型号
  final String driveName; // 驱动类型
  final String driveType; // 驱动类型
  final String modelStatus; // 车型状态 在售/停售等
  final String gearType; // 变速箱类型 手动/自动
  final String marketDate; // 生产日期
  final String minRegYear; // 最小注册年
  final String maxRegYear; // 最大注册年
  final String stopMakeYear; // 车型停产年份
  final String intake; // 进气形式
  final String seatNumber; // 座位数
  final String bodyType; // 车身类型
  final int doorNumber; // 门数
  final String carStruct; // 车辆结构
  final int isParallel; // 是否平行进口车 0=否 1=是
  final String priceAllowance; // 新能源车补贴

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

  factory CarModelInfo.fromJson(Map<String, dynamic> json) =>
      _$CarModelInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CarModelInfoToJson(this);

  const CarModelInfo({
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
}

@JsonSerializable()
class CarOrderInfo extends Equatable {
  final String interiorColor; // 内饰颜色
  final String displacement; // 排量
  final String gearbox; // 变速箱
  final String emissionStandard; // 排放标准
  final String useCharacter; // 使用性质
  final String locationCity; // 车辆所在地
  final String attributionCity; // 车辆归属地
  final String conditionIn; // 车况（对内）
  final String conditionOut; // 车况（对外）

  @override
  List<Object?> get props => [
        interiorColor,
        displacement,
        gearbox,
        emissionStandard,
        useCharacter,
        locationCity,
        attributionCity,
        conditionIn,
        conditionOut,
      ];

  factory CarOrderInfo.fromJson(Map<String, dynamic> json) =>
      _$CarOrderInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CarOrderInfoToJson(this);

  const CarOrderInfo({
    required this.interiorColor,
    required this.displacement,
    required this.gearbox,
    required this.emissionStandard,
    required this.useCharacter,
    required this.locationCity,
    required this.attributionCity,
    required this.conditionIn,
    required this.conditionOut,
  });
}

@JsonSerializable()
class CarContractInfo extends Equatable {
  final String vin;
  final String licensePlate;
  final int keyCount;
  final String engine; // 发动机号
  final int compulsoryInsurance;
  final int compulsoryInsuranceDate;
  final int commercialInsurance; // 商业险
  final int commercialInsuranceDate; // 商业险到期日期
  final String commercialInsurancePrice; // 商业险金额
  final String exterior; // 外观
  final String interiorTrim; // 内饰
  final String workingCondition; // 工况

  @override
  List<Object?> get props => [
        vin,
        keyCount,
        engine,
        compulsoryInsurance,
        compulsoryInsuranceDate,
        commercialInsurance,
        commercialInsuranceDate,
        commercialInsurancePrice,
        exterior,
        interiorTrim,
        workingCondition,
      ];

  factory CarContractInfo.fromJson(Map<String, dynamic> json) =>
      _$CarContractInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CarContractInfoToJson(this);

  const CarContractInfo({
    required this.vin,
    required this.licensePlate,
    required this.keyCount,
    required this.engine,
    required this.compulsoryInsurance,
    required this.compulsoryInsuranceDate,
    required this.commercialInsurance,
    required this.commercialInsuranceDate,
    required this.commercialInsurancePrice,
    required this.exterior,
    required this.interiorTrim,
    required this.workingCondition,
  });
}
