// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'handbook_model.g.dart';

@JsonSerializable()
class HandbookModel extends Equatable {
  final String name;
  final List<Staff>? items;

  factory HandbookModel.fromJson(Map<String, dynamic> json) =>
      _$HandbookModelFromJson(json);

  Map<String, dynamic> toJson() => _$HandbookModelToJson(this);
  const HandbookModel({
    required this.name,
    required this.items,
  });

  @override
  List<Object?> get props => [name, items];
}

@JsonSerializable()
class Staff extends Equatable {
  final int id;
  final String name;
  final int updatedAt;

  factory Staff.fromJson(Map<String, dynamic> json) => _$StaffFromJson(json);

  Map<String, dynamic> toJson() => _$StaffToJson(this);
  const Staff({required this.id, required this.name, required this.updatedAt});

  @override
  List<Object?> get props => [id, name, updatedAt];
}
