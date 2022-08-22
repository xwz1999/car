// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsModel _$ListsModelFromJson(Map<String, dynamic> json) => ListsModel(
      id: json['id'] as int,
      orderSn: json['orderSn'] as String,
      status: json['status'] as int,
      auditStatus: json['auditStatus'] as int,
      modeName: json['modeName'] as String,
      licensingDate: json['licensingDate'] as int,
      mileage: json['mileage'] as String,
      price: json['price'] as String,
      createdAt: json['createdAt'] as int,
      carPhoto: json['carPhoto'] as String,
    );

Map<String, dynamic> _$ListsModelToJson(ListsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderSn': instance.orderSn,
      'status': instance.status,
      'auditStatus': instance.auditStatus,
      'modeName': instance.modeName,
      'licensingDate': instance.licensingDate,
      'mileage': instance.mileage,
      'price': instance.price,
      'createdAt': instance.createdAt,
      'carPhoto': instance.carPhoto,
    };
