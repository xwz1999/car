import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sort_brand_model.g.dart';

@JsonSerializable()
class SortBrandModel extends Equatable {
   int id;
   int brandId;
   String icon;
   String name;
   String initial;

  factory SortBrandModel.fromJson(Map<String, dynamic> json) =>
      _$SortBrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$SortBrandModelToJson(this);

  static SortBrandModel get init =>
       SortBrandModel(id: 0, icon: '', name: '', initial: '', brandId: 0);

  @override
  List<Object?> get props => [
        id,
        icon,
        name,
        initial,
        brandId,
      ];

   SortBrandModel({
    required this.id,
    required this.brandId,
    required this.icon,
    required this.name,
    required this.initial,
  });
}
