import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sort_car_model_model.g.dart';

@JsonSerializable()
class SortCarModelModel extends Equatable {
  final int id;
  final String name;
  final int year;

  factory SortCarModelModel.fromJson(Map<String, dynamic> json) =>
      _$SortCarModelModelFromJson(json);

  static SortCarModelModel get init =>
      const SortCarModelModel(id: 0, name: '', year: 0);

  const SortCarModelModel({
    required this.id,
    required this.name,
    required this.year,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        year,
      ];
}
