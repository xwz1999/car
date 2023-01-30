// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_price_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarPriceHistoryModel _$CarPriceHistoryModelFromJson(
        Map<String, dynamic> json) =>
    CarPriceHistoryModel(
      interiorPrice: json['interiorPrice'] as String,
      exteriorPrice: json['exteriorPrice'] as String,
      preInteriorPrice: json['preInteriorPrice'] as String,
      preExteriorPrice: json['preExteriorPrice'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] as num,
    );

Map<String, dynamic> _$CarPriceHistoryModelToJson(
        CarPriceHistoryModel instance) =>
    <String, dynamic>{
      'interiorPrice': instance.interiorPrice,
      'exteriorPrice': instance.exteriorPrice,
      'preInteriorPrice': instance.preInteriorPrice,
      'preExteriorPrice': instance.preExteriorPrice,
      'description': instance.description,
      'createdAt': instance.createdAt,
    };
