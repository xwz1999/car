// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'handbook_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HandbookModel _$HandbookModelFromJson(Map<String, dynamic> json) =>
    HandbookModel(
      name: json['name'] as String,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Staff.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HandbookModelToJson(HandbookModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'items': instance.items,
    };

Staff _$StaffFromJson(Map<String, dynamic> json) => Staff(
      id: json['id'] as int,
      name: json['name'] as String,
      updatedAt: json['updatedAt'] as int,
    );

Map<String, dynamic> _$StaffToJson(Staff instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'updatedAt': instance.updatedAt,
    };
