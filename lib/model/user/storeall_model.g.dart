// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeall_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreallModel _$StoreallModelFromJson(Map<String, dynamic> json) =>
    StoreallModel(
      id: json['id'] as int,
      name: json['name'] as String,
      staffs: (json['staffs'] as List<dynamic>?)
          ?.map((e) => Staff.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Staff _$StaffFromJson(Map<String, dynamic> json) => Staff(
      json['id'] as int,
      json['name'] as String,
      json['phone'] as String,
      json['auditStatus'] as int,
      json['roleName'] as String,
    );
