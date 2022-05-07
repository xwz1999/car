// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_evaluation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarEvaluationModel _$CarEvaluationModelFromJson(Map<String, dynamic> json) =>
    CarEvaluationModel(
      id: json['id'] as int,
      modelName: json['modelName'] as String,
      licensePlate: json['licensePlate'] as String,
      licensingDate: json['licensingDate'] as int,
      color: json['color'] as String,
      mileage: json['mileage'] as String,
      price: json['price'] as String,
      createdAt: json['createdAt'] as int,
      vin: json['vin'] as String,
      engine: json['engine'] as String,
    );
