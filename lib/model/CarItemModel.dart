import 'package:json_annotation/json_annotation.dart';

part 'CarItemModel.g.dart';

@JsonSerializable()
class CarItemModel {
  final String name;
  final String time;
  final String distance;
  final String standard;
  final String url;
  final String price;

  factory CarItemModel.fromJson(Map<String, dynamic> json) =>
      _$CarItemModelFromJson(json);

  const CarItemModel({
    required this.name,
    required this.time,
    required this.distance,
    required this.standard,
    required this.url,
    required this.price,
  });
}
