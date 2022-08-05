// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_manage_photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarManagePhotoModel _$CarManagePhotoModelFromJson(Map<String, dynamic> json) =>
    CarManagePhotoModel(
      carPhotos:
          (json['carPhotos'] as List<dynamic>).map((e) => e as String).toList(),
      interiorPhotos: (json['interiorPhotos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      defectPhotos: (json['defectPhotos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      dataPhotos: (json['dataPhotos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CarManagePhotoModelToJson(
        CarManagePhotoModel instance) =>
    <String, dynamic>{
      'carPhotos': instance.carPhotos,
      'interiorPhotos': instance.interiorPhotos,
      'defectPhotos': instance.defectPhotos,
      'dataPhotos': instance.dataPhotos,
    };
