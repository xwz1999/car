import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'car_list_model.g.dart';

@JsonSerializable()
class CarListModel extends Equatable {
  final int id;
  final String modelName;
  final int type;
  final String mainPhoto;
  final num licensingDate;
  final String price;
  final String downPayment;
  final String mileage;
  final int transfer;
  final int collect;

  factory CarListModel.fromJson(Map<String, dynamic> json) =>
      _$CarListModelFromJson(json);

  const CarListModel({
    required this.id,
    required this.modelName,
    required this.type,
    required this.mainPhoto,
    required this.licensingDate,
    required this.price,
    required this.downPayment,
    required this.mileage,
    required this.transfer,
    required this.collect,
  });
  
  @override
  List<Object?> get props => [modelName,type,mainPhoto,licensingDate,price,downPayment,mileage,transfer,collect,];
}
