import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profit_statistics_model.g.dart';


@JsonSerializable()
class ProfitStatisticsModel extends Equatable{
  final String total;
  final List<Profits> profits;

  static ProfitStatisticsModel get init => const ProfitStatisticsModel(
    total:'0',
    profits:[],
  );
  @override
  List<Object?> get props => [total,profits,];

    factory ProfitStatisticsModel.fromJson(Map<String, dynamic> json) =>_$ProfitStatisticsModelFromJson(json);
    Map<String,dynamic> toJson()=> _$ProfitStatisticsModelToJson(this);

  const ProfitStatisticsModel({
    required this.total,
    required this.profits,
  });
}

@JsonSerializable()
class Profits  extends Equatable{
  final String name;
  final int finishAt;
  final String profit;
  @override
  List<Object?> get props => [name,finishAt,profit,];
  factory Profits.fromJson(Map<String, dynamic> json) =>_$ProfitsFromJson(json);

  Map<String, dynamic> toJson() => _$ProfitsToJson(this);
  const Profits({
    required this.name,
    required this.finishAt,
    required this.profit,
  });
}