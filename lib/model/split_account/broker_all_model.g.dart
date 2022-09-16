// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broker_all_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrokerAllModel _$BrokerAllModelFromJson(Map<String, dynamic> json) =>
    BrokerAllModel(
      id: json['id'] as int,
      name: json['name'] as String,
      brokers: (json['brokers'] as List<dynamic>)
          .map((e) => SplitBrokerItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BrokerAllModelToJson(BrokerAllModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brokers': instance.brokers,
    };

SplitBrokerItem _$SplitBrokerItemFromJson(Map<String, dynamic> json) =>
    SplitBrokerItem(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as int,
    );

Map<String, dynamic> _$SplitBrokerItemToJson(SplitBrokerItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'gender': instance.gender,
    };
