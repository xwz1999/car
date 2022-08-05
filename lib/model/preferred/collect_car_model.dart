import 'package:equatable/equatable.dart';
import 'package:flustars/flustars.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collect_car_model.g.dart';

@JsonSerializable()
class CollectCarModel extends Equatable {
  final int carId;
  final String modelName;
  final String mainPhoto;
  final int type;
  final String mileage;
  final int transfer;
  final String price;
  final String downPayment;
  final num createdAt;

  factory CollectCarModel.fromJson(Map<String, dynamic> json) =>
      _$CollectCarModelFromJson(json);

  Map<String, dynamic> toJson() => _$CollectCarModelToJson(this);
  DateTime get createdAtDT => DateUtil.getDateTimeByMs(createdAt.toInt());

  num get unitPrice => NumUtil.divide(num.parse(price), 10000);
  const CollectCarModel({
    required this.carId,
    required this.modelName,
    required this.mainPhoto,
    required this.type,
    required this.mileage,
    required this.transfer,
    required this.price,
    required this.downPayment,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        carId,
        modelName,
        mainPhoto,
        type,
        mileage,
        transfer,
        price,
        downPayment,
        createdAt,
      ];
}
