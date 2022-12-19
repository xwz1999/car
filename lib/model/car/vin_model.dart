import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'vin_model.g.dart';


@JsonSerializable()
class VinModel extends Equatable{
  final int isLegal;
  final String message;
    factory VinModel.fromJson(Map<String, dynamic> json) =>_$VinModelFromJson(json);

  const VinModel({
    required this.isLegal,
    required this.message,
  });
  @override
  List<Object?> get props => [isLegal,message];
}