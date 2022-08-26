// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_all_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessAllModel _$BusinessAllModelFromJson(Map<String, dynamic> json) =>
    BusinessAllModel(
      id: json['id'] as int,
      name: json['name'] as String,
      staffs: (json['staffs'] as List<dynamic>)
          .map((e) => StaffAllModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BusinessAllModelToJson(BusinessAllModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'staffs': instance.staffs,
    };
