import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'storeselect_moedl.g.dart';

@JsonSerializable()
class StoreselectMoedl extends Equatable {
  final int id;
  final String name;



  factory StoreselectMoedl.fromJson(Map<String, dynamic> json) =>
      _$StoreselectMoedlFromJson(json);

  Map<String, dynamic> toJson() => _$StoreselectMoedlToJson(this);
  @override
  List<Object?> get props => [id, name];

  const StoreselectMoedl({
    required this.id,
    required this.name,
  });
}
