import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dealer_list_model.g.dart';

@JsonSerializable()
class DealerListModel extends Equatable {
  final int id;
  final String name;
  final String liaison;
  final String liaisonPhone;
  final int createdAt;
  final String brokerName;

  factory DealerListModel.fromJson(Map<String, dynamic> json) =>
      _$DealerListModelFromJson(json);

  Map<String, dynamic> toJson() => _$DealerListModelToJson(this);
  @override
  List<Object?> get props => [id,name,];

  const DealerListModel({
    required this.id,
    required this.name,
    required this.liaison,
    required this.liaisonPhone,
    required this.createdAt,
    required this.brokerName,
  });
}
