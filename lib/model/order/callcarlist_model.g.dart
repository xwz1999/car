// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'callcarlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallcarlistModel _$CallcarlistModelFromJson(Map<String, dynamic> json) =>
    CallcarlistModel(
      id: json['id'] as int,
      orderSn: json['orderSn'] as String,
      mainPhoto: json['mainPhoto'] as String,
      modelName: json['modelName'] as String,
      licensingDate: json['licensingDate'] as int,
      mileage: json['mileage'] as String,
      transfer: json['transfer'] as int,
      amount: json['amount'] as String,
      status: json['status'] as int,
    );
