import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'broker_all_model.g.dart';

@JsonSerializable()
class BrokerAllModel extends Equatable {
  final int id;
  final String name;
  final List<SplitBrokerItem> brokers;

  @override
  List<Object?> get props => [
        id,
        name,
        brokers,
      ];

  factory BrokerAllModel.fromJson(Map<String, dynamic> json) =>
      _$BrokerAllModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrokerAllModelToJson(this);

  const BrokerAllModel({
    required this.id,
    required this.name,
    required this.brokers,
  });
}

@JsonSerializable()
class SplitBrokerItem extends Equatable {
  final int id;
  final String name;
  final String phone;
  final int gender;

  factory SplitBrokerItem.fromJson(Map<String, dynamic> json) =>
      _$SplitBrokerItemFromJson(json);

  Map<String, dynamic> toJson() => _$SplitBrokerItemToJson(this);

  @override
  List<Object?> get props => [id, name, phone, gender];

  const SplitBrokerItem({
    required this.id,
    required this.name,
    required this.phone,
    required this.gender,
  });
}
