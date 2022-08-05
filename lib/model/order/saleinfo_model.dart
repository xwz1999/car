import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'saleinfo_model.g.dart';

@JsonSerializable()
class SaleinfoModel extends Equatable {
  final int id;
  factory SaleinfoModel.fromJson(Map<String, dynamic> json) =>
      _$SaleinfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaleinfoModelToJson(this);

  const SaleinfoModel({
    required this.id,
  });
  @override
  List<Object?> get props => [id];
}
