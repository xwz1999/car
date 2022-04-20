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

Series _$SeriesFromJson(Map<String, dynamic> json) => Series(
      id: json['id'] as int,
      name: json['name'] as String,
    );
