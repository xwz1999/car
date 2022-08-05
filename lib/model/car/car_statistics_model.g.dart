// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarStatisticsModel _$CarStatisticsModelFromJson(Map<String, dynamic> json) =>
    CarStatisticsModel(
      sellCount: json['sellCount'] as int,
      reserveCount: json['reserveCount'] as int,
      soldCount: json['soldCount'] as int,
      backOutCount: json['backOutCount'] as int,
    );

Map<String, dynamic> _$CarStatisticsModelToJson(CarStatisticsModel instance) =>
    <String, dynamic>{
      'sellCount': instance.sellCount,
      'reserveCount': instance.reserveCount,
      'soldCount': instance.soldCount,
      'backOutCount': instance.backOutCount,
    };
