import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sort_brand_model.g.dart';

@JsonSerializable()
class SortBrandModel extends Equatable {
  final int id;
  final int brandId;
  final String icon;
  final String name;
  final String initial;

  factory SortBrandModel.fromJson(Map<String, dynamic> json) =>
      _$SortBrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$SortBrandModelToJson(this);

  static SortBrandModel get init =>
      const SortBrandModel(id: 0, icon: '', name: '', initial: '', brandId: 0);

  @override
  List<Object?> get props => [
        id,
        icon,
        name,
        initial,
        brandId,
      ];

  const SortBrandModel({
    required this.id,
    required this.brandId,
    required this.icon,
    required this.name,
    required this.initial,
  });
}
