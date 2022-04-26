import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'saleinfo_model.g.dart';

@JsonSerializable()
class SaleinfoModel extends Equatable {
  final int id;
  factory SaleinfoModel.fromJson(Map<String, dynamic> json) =>
      _$SaleinfoModelFromJson(json);


  const SaleinfoModel({
    required this.id,
  });
  @override
  List<Object?> get props => [id];
}
