import 'package:flustars/flustars.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'car_list_model.g.dart';

@JsonSerializable()
class CarListModel extends Equatable {
  final int id;
  final String modelName;

  ///类型：1 二手车
  final int type;
  final String mainPhoto;
  final num licensingDate;

  ///单位：元
  final String price;
  final String downPayment;

  ///里程：万公里
  final String mileage;

  ///转手次数
  final int transfer;

  ///是否收藏 0未收藏 1收藏
  final int collect;

  factory CarListModel.fromJson(Map<String, dynamic> json) =>
      _$CarListModelFromJson(json);

  DateTime get licensingDateDT =>
      DateUtil.getDateTimeByMs(licensingDate.toInt() * 1000);

  num get unitPrice => NumUtil.divide(num.parse(price), 10000);

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
  List<Object?> get props => [
        modelName,
        type,
        mainPhoto,
        licensingDate,
        price,
        downPayment,
        mileage,
        transfer,
        collect,
      ];
}
