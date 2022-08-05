import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poster_list_model.g.dart';

@JsonSerializable()
class PosterListModel extends Equatable {
  final int id;
  final String path;
  final String axisX;
  final String axisY;
  final String size;

  factory PosterListModel.fromJson(Map<String, dynamic> json) =>
      _$PosterListModelFromJson(json);

  Map<String, dynamic> toJson() => _$PosterListModelToJson(this);

  const PosterListModel({
    required this.id,
    required this.path,
    required this.axisX,
    required this.axisY,
    required this.size,
  });

  @override
  List<Object?> get props => [
        id,
        path,
        axisX,
        axisY,
        size,
      ];
}
