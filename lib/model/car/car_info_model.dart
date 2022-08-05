import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_info_model.g.dart';

@JsonSerializable()
class CarInfoModel extends Equatable {
  final int id;
  final String modelName;
  final int collect;
  final int browse;
  final int transfer;
  final String price;
  final String lastPrice;
  final String downPayment;
  final String mileage;
  final num licensingDate;
  final String dischargeStandard;
  final String locationCity;
  final String gearType;
  final String color;
  final String liter;
  final int keyCount;
  final String useCharacter;
  final num compulsoryInsurance;
  final num compulsoryInsuranceDate;
  final String condition;
  final List<String> carPhotos;
  final List<String> interiorPhotos;

  factory CarInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CarInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarInfoModelToJson(this);
  const CarInfoModel({
    required this.id,
    required this.modelName,
    required this.collect,
    required this.browse,
    required this.transfer,
    required this.price,
    required this.lastPrice,
    required this.downPayment,
    required this.mileage,
    required this.licensingDate,
    required this.dischargeStandard,
    required this.locationCity,
    required this.gearType,
    required this.color,
    required this.liter,
    required this.keyCount,
    required this.useCharacter,
    required this.compulsoryInsurance,
    required this.compulsoryInsuranceDate,
    required this.condition,
    required this.carPhotos,
    required this.interiorPhotos,
  });

  @override
  List<Object?> get props => [
        id,
        modelName,
        collect,
        browse,
        transfer,
        price,
        lastPrice,
        downPayment,
        mileage,
        licensingDate,
        dischargeStandard,
        locationCity,
        gearType,
        color,
        liter,
        keyCount,
        useCharacter,
        compulsoryInsurance,
        compulsoryInsuranceDate,
        condition,
        carPhotos,
        interiorPhotos,
      ];
}
