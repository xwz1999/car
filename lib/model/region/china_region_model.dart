import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'china_region_model.g.dart';

@JsonSerializable()
@HiveType(typeId:0)
class ChinaRegionModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int parentId;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String code;
  @HiveField(4)
  final int level;
  @HiveField(5)
  final List<ChinaRegionModel>? children;

  factory ChinaRegionModel.fromJson(Map<String, dynamic> json) =>
      _$ChinaRegionModelFromJson(json);


  const ChinaRegionModel({
    required this.id,
    required this.parentId,
    required this.name,
    required this.code,
    required this.level,
    this.children,
  });

  @override
  List<Object?> get props => [
        id,
        parentId,
        name,
        code,
        level,
        children,
      ];
}
