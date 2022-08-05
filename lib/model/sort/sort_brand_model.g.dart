// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortBrandModel _$SortBrandModelFromJson(Map<String, dynamic> json) =>
    SortBrandModel(
      id: json['id'] as int,
      icon: json['icon'] as String,
      name: json['name'] as String,
      initial: json['initial'] as String,
    );

Map<String, dynamic> _$SortBrandModelToJson(SortBrandModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'name': instance.name,
      'initial': instance.initial,
    };
