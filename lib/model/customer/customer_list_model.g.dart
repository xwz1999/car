// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerListModel _$CustomerListModelFromJson(Map<String, dynamic> json) =>
    CustomerListModel(
      id: json['id'] as int,
      nickname: json['nickname'] as String,
      gender: json['gender'] as int,
      isImportant: json['isImportant'] as int,
      brokerName: json['brokerName'] as String,
      trailContent: json['trailContent'] as String,
      trailCreatedAt: json['trailCreatedAt'] as int,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$CustomerListModelToJson(CustomerListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'isImportant': instance.isImportant,
      'brokerName': instance.brokerName,
      'trailContent': instance.trailContent,
      'trailCreatedAt': instance.trailCreatedAt,
      'createdAt': instance.createdAt,
    };
