import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'car_series_model.g.dart';

@JsonSerializable()
class CarSeriesModel extends Equatable {
  final int id;
  final String name;
  final Series series;

  factory CarSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$CarSeriesModelFromJson(json);

  const CarSeriesModel({
    required this.id,
    required this.name,
    required this.series,
  });
  @override
  List<Object?> get props => [id,name,series,];
}

@JsonSerializable()
class Series extends Equatable {
  final int id;
  final String name;

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);

  const Series({
    required this.id,
    required this.name,
  });
  @override
  List<Object?> get props => [id,name,];
  
}
