// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect_car_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectCarModel _$CollectCarModelFromJson(Map<String, dynamic> json) =>
    CollectCarModel(
      carId: json['carId'] as int,
      modelName: json['modelName'] as String,
      mainPhoto: json['mainPhoto'] as String,
      type: json['type'] as int,
      mileage: json['mileage'] as String,
      transfer: json['transfer'] as int,
      price: json['price'] as String,
      downPayment: json['downPayment'] as String,
      createdAt: json['createdAt'] as num,
    );

Map<String, dynamic> _$CollectCarModelToJson(CollectCarModel instance) =>
    <String, dynamic>{
      'carId': instance.carId,
      'modelName': instance.modelName,
      'mainPhoto': instance.mainPhoto,
      'type': instance.type,
      'mileage': instance.mileage,
      'transfer': instance.transfer,
      'price': instance.price,
      'downPayment': instance.downPayment,
      'createdAt': instance.createdAt,
    };
