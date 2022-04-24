// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarInfoModel _$CarInfoModelFromJson(Map<String, dynamic> json) => CarInfoModel(
      id: json['id'] as int,
      modelName: json['modelName'] as String,
      collect: json['collect'] as int,
      browse: json['browse'] as int,
      transfer: json['transfer'] as int,
      price: json['price'] as String,
      lastPrice: json['lastPrice'] as String,
      downPayment: json['downPayment'] as String,
      mileage: json['mileage'] as String,
      licensingDate: json['licensingDate'] as num,
      dischargeStandard: json['dischargeStandard'] as String,
      locationCity: json['locationCity'] as String,
      gearType: json['gearType'] as String,
      color: json['color'] as String,
      liter: json['liter'] as String,
      keyCount: json['keyCount'] as int,
      useCharacter: json['useCharacter'] as String,
      compulsoryInsurance: json['compulsoryInsurance'] as num,
      compulsoryInsuranceDate: json['compulsoryInsuranceDate'] as num,
      condition: json['condition'] as String,
      carPhotos:
          (json['carPhotos'] as List<dynamic>).map((e) => e as String).toList(),
      interiorPhotos: (json['interiorPhotos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
