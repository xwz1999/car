import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'dealer_list_model.g.dart';

@JsonSerializable()
class DealerListModel extends Equatable {
  final int id;
  final String name;

  factory DealerListModel.fromJson(Map<String, dynamic> json) =>
      _$DealerListModelFromJson(json);

  const DealerListModel({
    required this.id,
    required this.name,
  });
  @override
  List<Object?> get props => [id,name,];
}
