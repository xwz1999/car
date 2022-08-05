// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dealer_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealerListModel _$DealerListModelFromJson(Map<String, dynamic> json) =>
    DealerListModel(
      id: json['id'] as int,
      name: json['name'] as String,
      liaison: json['liaison'] as String,
      liaisonPhone: json['liaisonPhone'] as String,
      createdAt: json['createdAt'] as int,
      brokerName: json['brokerName'] as String,
    );

Map<String, dynamic> _$DealerListModelToJson(DealerListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'liaison': instance.liaison,
      'liaisonPhone': instance.liaisonPhone,
      'createdAt': instance.createdAt,
      'brokerName': instance.brokerName,
    };
