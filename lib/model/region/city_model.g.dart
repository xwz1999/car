// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      id: json['id'] as int,
      provId: json['provId'] as int,
      provName: json['provName'] as String,
      cityId: json['cityId'] as int,
      cityName: json['cityName'] as String,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'id': instance.id,
      'provId': instance.provId,
      'provName': instance.provName,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
    };
