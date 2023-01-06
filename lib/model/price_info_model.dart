import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'price_info_model.g.dart';

@JsonSerializable()
class PriceInfoModel extends Equatable {
  final int id;
  final String vin;
  final String engineNo;
  final int source;
  final String mileage;
  final int modelId;
  final String modelName;
  final int cityId;
  final String cityName;
  final String color;
  final num licensingDate;
  final int transfer;
  final int paint;
  final int plate;
  final String parts;
  final int engine;
  final String accidents;
  final int maintain;

  factory PriceInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PriceInfoModelFromJson(json);



  const PriceInfoModel({
    required this.id,
    required this.vin,
    required this.engineNo,
    required this.source,
    required this.mileage,
    required this.modelId,
    required this.modelName,
    required this.cityId,
    required this.cityName,
    required this.color,
    required this.licensingDate,
    required this.transfer,
    required this.paint,
    required this.plate,
    required this.parts,
    required this.engine,
    required this.accidents,
    required this.maintain,
  });

  @override
  List<Object?> get props => [
        id,
        vin,
        engineNo,
        source,
        mileage,
        modelId,
        modelName,
        cityId,
        cityName,
        color,
        licensingDate,
        transfer,
        paint,
        plate,
        parts,
        engine,
        accidents,
        maintain,
      ];
}
