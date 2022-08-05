// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_browse_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerBrowseListModel _$CustomerBrowseListModelFromJson(
        Map<String, dynamic> json) =>
    CustomerBrowseListModel(
      carId: json['carId'] as int,
      mainPhoto: json['mainPhoto'] as String,
      modelName: json['modelName'] as String,
      licensingDate: json['licensingDate'] as int,
      mileage: json['mileage'] as String,
      price: json['price'] as String,
      carType: json['carType'] as int,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$CustomerBrowseListModelToJson(
        CustomerBrowseListModel instance) =>
    <String, dynamic>{
      'carId': instance.carId,
      'mainPhoto': instance.mainPhoto,
      'modelName': instance.modelName,
      'licensingDate': instance.licensingDate,
      'mileage': instance.mileage,
      'price': instance.price,
      'carType': instance.carType,
      'createdAt': instance.createdAt,
    };
