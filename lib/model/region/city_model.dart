
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel extends Equatable {
  final int id;
  final int provId;
  final String provName;
  final int cityId;
  final String cityName;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        provId,
        provName,
        cityId,
        cityName,
      ];

  const CityModel({
    required this.id,
    required this.provId,
    required this.provName,
    required this.cityId,
    required this.cityName,
  });
}
