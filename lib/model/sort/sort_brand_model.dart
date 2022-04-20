import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'sort_brand_model.g.dart';

@JsonSerializable()
class SortBrandModel extends Equatable {
  final int id;
  final String icon;
  final String name;
  final String initial;


  factory SortBrandModel.fromJson(Map<String, dynamic> json) =>
      _$SortBrandModelFromJson(json);



  @override
  List<Object?> get props => [id,icon,name,initial,];

  const SortBrandModel({
    required this.id,
    required this.icon,
    required this.name,
    required this.initial,
  });
}
