import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sort_car_model_model.g.dart';

@JsonSerializable()
class SortCarModelModel extends Equatable {
  final int id;
  final int modelId;
  final String name;
  final int year;
  final String guidePrice;

  factory SortCarModelModel.fromJson(Map<String, dynamic> json) =>
      _$SortCarModelModelFromJson(json);

  Map<String, dynamic> toJson() => _$SortCarModelModelToJson(this);

  static SortCarModelModel get init =>
      const SortCarModelModel(id: 0, name: '', year: 0, modelId: 0,guidePrice: '');

  @override
  List<Object?> get props => [id, name, year, modelId];

  const SortCarModelModel({
    required this.id,
    required this.modelId,
    required this.name,
    required this.year,
    required this.guidePrice
  });
}
