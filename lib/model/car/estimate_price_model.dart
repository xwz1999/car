import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'estimate_price_model.g.dart';

@JsonSerializable()
class EstimatePriceModel extends Equatable {
  final num id;
  final String price;

  factory EstimatePriceModel.fromJson(Map<String, dynamic> json) =>
      _$EstimatePriceModelFromJson(json);

  const EstimatePriceModel({
    required this.id,
    required this.price,
  });
  @override
  List<Object?> get props => [id,price,];
  
}
