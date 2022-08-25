// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_car_model_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortCarModelModel _$SortCarModelModelFromJson(Map<String, dynamic> json) =>
    SortCarModelModel(
      id: json['id'] as int,
      modelId: json['modelId'] as int,
      name: json['name'] as String,
      year: json['year'] as int,
    );

Map<String, dynamic> _$SortCarModelModelToJson(SortCarModelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modelId': instance.modelId,
      'name': instance.name,
      'year': instance.year,
    };
