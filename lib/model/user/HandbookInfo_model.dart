// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'HandbookInfo_model.g.dart';

@JsonSerializable()
class HandbookInfoModel extends Equatable {
  final int id;
  final String name;
  final String content;
  final int createdAt;
  final int updatedAt;
  factory HandbookInfoModel.fromJson(Map<String, dynamic> json) =>
      _$HandbookInfoModelFromJson(json);

  const HandbookInfoModel({
    required this.id,
    required this.name,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  List<Object?> get props => [id, name, content, createdAt, updatedAt];
}
