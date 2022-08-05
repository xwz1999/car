// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) => HistoryModel(
      id: json['id'] as int,
      type: json['type'] as int,
      count: json['count'] as num,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$HistoryModelToJson(HistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'count': instance.count,
      'createdAt': instance.createdAt,
    };
