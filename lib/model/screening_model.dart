import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'screening_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class ScreeningModel extends Equatable {
  @HiveField(0)
  //品牌id
   int brandId;
  @HiveField(1)
  //车型id
   int seriesId;
  @HiveField(2)
  //最小车价
   int minPrice;
  @HiveField(3)
  //最大车价
   int maxPrice;
  @HiveField(4)
  //最小里程
   int minMileage;
  @HiveField(5)
  //最大里程
   int maxMileage;
  @HiveField(6)
  //车身结构
   String struct;
  @HiveField(7)
  //能源类型
   int fuelType;
  @HiveField(8)
  //变速箱类型
   int gearType;
  @HiveField(9)
  //排放标准
   String dischargeStandard;
  @HiveField(10)
  //车牌名字
    String brandName;
  @HiveField(11)
  //车型名字
   String seriesName;
  @HiveField(12)
 //车身结构
   String structName;
  @HiveField(13)
  //能源类型
   String fuelName;
  @HiveField(14)
  //变速箱类型
   String gearName;


  factory ScreeningModel.fromJson(Map<String, dynamic> json) =>
      _$ScreeningModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScreeningModelToJson(this);

   ScreeningModel({
    required this.brandId,
    required this.seriesId,
    required this.minPrice,
    required this.maxPrice,
    required this.minMileage,
    required this.maxMileage,
    required this.struct,
    required this.fuelType,
    required this.gearType,
    required this.dischargeStandard,
    required this.brandName,
    required this.seriesName,
    required this.structName,
    required this.fuelName,
    required this.gearName,
  });
  @override
  List<Object?> get props => [
    brandId,
    seriesId,
    minPrice,
    maxPrice,
    minMileage,
    maxMileage,
    struct,
    fuelType,
    gearType,
    dischargeStandard,
    brandName,
    seriesName,
    structName,
    fuelName,
    gearName
  ];
}
