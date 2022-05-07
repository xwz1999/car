// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'History_model.g.dart';

@JsonSerializable()
class HistoryModel extends Equatable {
  final int id;
  final int type;
  final num count;
  final int createdAt;
  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);

  @override
  List<Object?> get props => [
        id,
        type,
        count,
        createdAt,
      ];

  const HistoryModel({
    required this.id,
    required this.type,
    required this.count,
    required this.createdAt,
  });
}
