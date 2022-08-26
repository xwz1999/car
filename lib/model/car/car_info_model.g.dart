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
      conditionIn: json['conditionIn'] as String,
      conditionOut: json['conditionOut'] as String,
      carPhotos:
          (json['carPhotos'] as List<dynamic>).map((e) => e as String).toList(),
      interiorPhotos: (json['interiorPhotos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      carSn: json['carSn'] as String,
    );

Map<String, dynamic> _$CarInfoModelToJson(CarInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modelName': instance.modelName,
      'collect': instance.collect,
      'browse': instance.browse,
      'transfer': instance.transfer,
      'price': instance.price,
      'lastPrice': instance.lastPrice,
      'downPayment': instance.downPayment,
      'mileage': instance.mileage,
      'licensingDate': instance.licensingDate,
      'dischargeStandard': instance.dischargeStandard,
      'locationCity': instance.locationCity,
      'gearType': instance.gearType,
      'color': instance.color,
      'liter': instance.liter,
      'keyCount': instance.keyCount,
      'useCharacter': instance.useCharacter,
      'compulsoryInsurance': instance.compulsoryInsurance,
      'compulsoryInsuranceDate': instance.compulsoryInsuranceDate,
      'conditionIn': instance.conditionIn,
      'conditionOut': instance.conditionOut,
      'carPhotos': instance.carPhotos,
      'interiorPhotos': instance.interiorPhotos,
      'carSn': instance.carSn,
    };
