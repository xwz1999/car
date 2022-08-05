// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'handbookInfo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HandbookInfoModel _$HandbookInfoModelFromJson(Map<String, dynamic> json) =>
    HandbookInfoModel(
      id: json['id'] as int,
      name: json['name'] as String,
      content: json['content'] as String,
      createdAt: json['createdAt'] as int,
      updatedAt: json['updatedAt'] as int,
    );

Map<String, dynamic> _$HandbookInfoModelToJson(HandbookInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
