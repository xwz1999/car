// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerStatisticsModel _$CustomerStatisticsModelFromJson(
        Map<String, dynamic> json) =>
    CustomerStatisticsModel(
      registerCount: json['registerCount'] as int,
      browseCount: json['browseCount'] as int,
      intentionCount: json['intentionCount'] as int,
      doneCount: json['doneCount'] as int,
    );

Map<String, dynamic> _$CustomerStatisticsModelToJson(
        CustomerStatisticsModel instance) =>
    <String, dynamic>{
      'registerCount': instance.registerCount,
      'browseCount': instance.browseCount,
      'intentionCount': instance.intentionCount,
      'doneCount': instance.doneCount,
    };
