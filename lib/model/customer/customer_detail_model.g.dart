// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDetailModel _$CustomerDetailModelFromJson(Map<String, dynamic> json) =>
    CustomerDetailModel(
      id: json['id'] as int,
      mobile: json['mobile'] as String,
      nickname: json['nickname'] as String,
      gender: json['gender'] as int,
      isImportant: json['isImportant'] as int,
      brokerName: json['brokerName'] as String,
      trailContent: json['trailContent'] as String,
      trailCreatedAt: json['trailCreatedAt'] as int,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$CustomerDetailModelToJson(
        CustomerDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mobile': instance.mobile,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'isImportant': instance.isImportant,
      'brokerName': instance.brokerName,
      'trailContent': instance.trailContent,
      'trailCreatedAt': instance.trailCreatedAt,
      'createdAt': instance.createdAt,
    };
