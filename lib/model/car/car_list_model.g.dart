// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarListModel _$CarListModelFromJson(Map<String, dynamic> json) => CarListModel(
      id: json['id'] as int,
      modelName: json['modelName'] as String,
      type: json['type'] as int,
      mainPhoto: json['mainPhoto'] as String,
      licensingDate: json['licensingDate'] as num,
      price: json['price'] as String,
      downPayment: json['downPayment'] as String,
      mileage: json['mileage'] as String,
      transfer: json['transfer'] as int,
      collect: json['collect'] as int,
      isSelf: json['isSelf'] as int?,
    );

Map<String, dynamic> _$CarListModelToJson(CarListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modelName': instance.modelName,
      'type': instance.type,
      'mainPhoto': instance.mainPhoto,
      'licensingDate': instance.licensingDate,
      'price': instance.price,
      'downPayment': instance.downPayment,
      'mileage': instance.mileage,
      'transfer': instance.transfer,
      'collect': instance.collect,
      'isSelf': instance.isSelf,
    };
