import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sort_series_model.g.dart';

@JsonSerializable()
class SortSeriesModel extends Equatable {
  final int id;
  final String name;
  final List<Series> series;

  factory SortSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$SortSeriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SortSeriesModelToJson(this);

  static SortSeriesModel get init =>
      const SortSeriesModel(id: 0, name: '', series: []);

  @override
  List<Object?> get props => [
        id,
        name,
        series,
      ];

  const SortSeriesModel({
    required this.id,
    required this.name,
    required this.series,
  });
}

@JsonSerializable()
class Series extends Equatable {
  final int id;
  final int seriesId;
  final String name;

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesToJson(this);

  @override
  List<Object?> get props => [id, name, seriesId];

  const Series({
    required this.id,
    required this.seriesId,
    required this.name,
  });

  Series copyWith({
    int? id,
    int? seriesId,
    String? name,
  }) {
    return Series(
      id: id ?? this.id,
      seriesId: seriesId ?? this.seriesId,
      name: name ?? this.name,
    );
  }
}
