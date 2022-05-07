import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_evaluation_model.g.dart';

@JsonSerializable()
class CarEvaluationModel extends Equatable {
  final int id;
  final String modelName;
  final String licensePlate;
  final int licensingDate;
  final String color;
  final String mileage;
  final String price;
  final int createdAt;
  final String vin;
  final String engine;

  factory CarEvaluationModel.fromJson(Map<String, dynamic> json) =>
      _$CarEvaluationModelFromJson(json);

  const CarEvaluationModel({
    required this.id,
    required this.modelName,
    required this.licensePlate,
    required this.licensingDate,
    required this.color,
    required this.mileage,
    required this.price,
    required this.createdAt,
    required this.vin,
    required this.engine,
  });
  @override
  List<Object?> get props => [id,modelName,licensePlate,licensingDate,color,mileage,price,createdAt,vin,engine,];
}
