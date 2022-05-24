// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:flustars/flustars.dart';
import 'package:json_annotation/json_annotation.dart';

part 'history_model.g.dart';

@JsonSerializable()
class HistoryModel extends Equatable {
  final int id;
  final int type;
  final num count;
  final int createdAt;

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);

  DateTime get createDateTime => DateUtil.getDateTimeByMs(createdAt * 1000);

  ///时间戳传唤格式

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
