import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'split_account_list_model.g.dart';

@JsonSerializable()
class SplitAccountListModel extends Equatable {
  final int id;
  final String name;
  final String lastBill;
  final int createAt;

  factory SplitAccountListModel.fromJson(Map<String, dynamic> json) =>
      _$SplitAccountListModelFromJson(json);

  Map<String, dynamic> toJson() => _$SplitAccountListModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        lastBill,
        createAt,
      ];

  const SplitAccountListModel({
    required this.id,
    required this.name,
    required this.lastBill,
    required this.createAt,
  });

  SplitAccountListModel copyWith({
    int? id,
    String? name,
    String? lastBill,
    int? createAt,
  }) {
    return SplitAccountListModel(
      id: id ?? this.id,
      name: name ?? this.name,
      lastBill: lastBill ?? this.lastBill,
      createAt: createAt ?? this.createAt,
    );
  }
}
