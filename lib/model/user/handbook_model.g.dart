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

Staff _$StaffFromJson(Map<String, dynamic> json) => Staff(
      id: json['id'] as int,
      name: json['name'] as String,
      updatedAt: json['updatedAt'] as int,
    );
