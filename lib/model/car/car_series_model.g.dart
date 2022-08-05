// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarSeriesModel _$CarSeriesModelFromJson(Map<String, dynamic> json) =>
    CarSeriesModel(
      id: json['id'] as int,
      name: json['name'] as String,
      series: Series.fromJson(json['series'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CarSeriesModelToJson(CarSeriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'series': instance.series,
    };

Series _$SeriesFromJson(Map<String, dynamic> json) => Series(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SeriesToJson(Series instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
