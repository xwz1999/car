// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfitStatisticsModel _$ProfitStatisticsModelFromJson(
        Map<String, dynamic> json) =>
    ProfitStatisticsModel(
      total: json['total'] as String,
      profits: (json['profits'] as List<dynamic>)
          .map((e) => Profits.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfitStatisticsModelToJson(
        ProfitStatisticsModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'profits': instance.profits,
    };

Profits _$ProfitsFromJson(Map<String, dynamic> json) => Profits(
      name: json['name'] as String,
      finishAt: json['finishAt'] as int,
      profit: json['profit'] as String,
    );

Map<String, dynamic> _$ProfitsToJson(Profits instance) => <String, dynamic>{
      'name': instance.name,
      'finishAt': instance.finishAt,
      'profit': instance.profit,
    };
