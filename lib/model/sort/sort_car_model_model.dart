import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'sort_car_model_model.g.dart';

@JsonSerializable()
class SortCarModelModel extends Equatable {
  final int id;
  final String name;
  final int year;

  factory SortCarModelModel.fromJson(Map<String, dynamic> json) =>
      _$SortCarModelModelFromJson(json);

  const SortCarModelModel({
    required this.id,
    required this.name,
    required this.year,
  });
  @override
  List<Object?> get props => [id,name,year,];
}
