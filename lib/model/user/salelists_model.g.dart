// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salelists_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalelistsModel _$SalelistsModelFromJson(Map<String, dynamic> json) =>
    SalelistsModel(
      id: json['id'] as int,
      status: json['status'] as int,
      createdAt: json['createdAt'] as int,
      mainPhoto: json['mainPhoto'] as String,
      modelName: json['modelName'] as String,
      licensingDate: json['licensingDate'] as int,
      mileage: json['mileage'] as String,
      amount: json['amount'] as String,
      deposit: json['deposit'] as String,
      downPayment: json['downPayment'] as String,
      balancePayment: json['balancePayment'] as String,
    );

Map<String, dynamic> _$SalelistsModelToJson(SalelistsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'mainPhoto': instance.mainPhoto,
      'modelName': instance.modelName,
      'licensingDate': instance.licensingDate,
      'mileage': instance.mileage,
      'amount': instance.amount,
      'deposit': instance.deposit,
      'downPayment': instance.downPayment,
      'balancePayment': instance.balancePayment,
    };
