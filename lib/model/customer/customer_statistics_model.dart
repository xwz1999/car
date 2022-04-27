import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'customer_statistics_model.g.dart';

@JsonSerializable()
class CustomerStatisticsModel extends Equatable {
  final int registerCount;
  final int browseCount;
  final int intentionCount;
  final int doneCount;

  factory CustomerStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerStatisticsModelFromJson(json);

  const CustomerStatisticsModel({
    required this.registerCount,
    required this.browseCount,
    required this.intentionCount,
    required this.doneCount,
  });
  @override
  List<Object?> get props => [registerCount,browseCount,intentionCount,doneCount,];
}
