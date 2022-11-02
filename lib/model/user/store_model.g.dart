// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      id: json['id'] as int,
      name: json['name'] as String,
      ownBrokerName: json['ownBrokerName'] as String,
      ownerBrokerTel: json['ownerBrokerTel'] as String,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ownBrokerName': instance.ownBrokerName,
      'ownerBrokerTel': instance.ownerBrokerTel,
      'createdAt': instance.createdAt,
    };
