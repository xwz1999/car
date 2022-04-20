import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'History_model.g.dart';

@JsonSerializable()
class HistoryModel extends Equatable {
  final int id;
  final int type;
  final num count;
  final int createdAt;
  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
  const HistoryModel(this.id, this.type, this.count, this.createdAt);
  @override
  List<Object?> get props => [
        id,
        type,
        count,
        createdAt,
      ];
}
