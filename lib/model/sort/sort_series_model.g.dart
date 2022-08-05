// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortSeriesModel _$SortSeriesModelFromJson(Map<String, dynamic> json) =>
    SortSeriesModel(
      id: json['id'] as int,
      name: json['name'] as String,
      series: (json['series'] as List<dynamic>)
          .map((e) => Series.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SortSeriesModelToJson(SortSeriesModel instance) =>
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
