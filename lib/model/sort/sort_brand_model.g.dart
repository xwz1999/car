// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortBrandModel _$SortBrandModelFromJson(Map<String, dynamic> json) =>
    SortBrandModel(
      id: json['id'] as int,
      brandId: json['brandId'] as int,
      icon: json['icon'] as String,
      name: json['name'] as String,
      initial: json['initial'] as String,
    );

Map<String, dynamic> _$SortBrandModelToJson(SortBrandModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brandId': instance.brandId,
      'icon': instance.icon,
      'name': instance.name,
      'initial': instance.initial,
    };
