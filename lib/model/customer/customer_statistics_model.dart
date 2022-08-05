import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_statistics_model.g.dart';

@JsonSerializable()
class CustomerStatisticsModel extends Equatable {
  final int registerCount;
  final int browseCount;
  final int intentionCount;
  final int doneCount;

  factory CustomerStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerStatisticsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerStatisticsModelToJson(this);
  const CustomerStatisticsModel({
    required this.registerCount,
    required this.browseCount,
    required this.intentionCount,
    required this.doneCount,
  });
  @override
  List<Object?> get props => [registerCount,browseCount,intentionCount,doneCount,];
}
