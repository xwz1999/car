// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poster_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosterListModel _$PosterListModelFromJson(Map<String, dynamic> json) =>
    PosterListModel(
      id: json['id'] as int,
      path: json['path'] as String,
      axisX: json['axisX'] as String,
      axisY: json['axisY'] as String,
      size: json['size'] as String,
    );

Map<String, dynamic> _$PosterListModelToJson(PosterListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'axisX': instance.axisX,
      'axisY': instance.axisY,
      'size': instance.size,
    };
