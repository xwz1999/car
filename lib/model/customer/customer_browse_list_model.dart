import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_browse_list_model.g.dart';

@JsonSerializable()
class CustomerBrowseListModel extends Equatable {
  final int carId;
  final String mainPhoto;
  final String modelName;
  final int licensingDate;
  final String mileage;
  final String price;
  final int carType;
  final int createdAt;

  factory CustomerBrowseListModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerBrowseListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerBrowseListModelToJson(this);
  const CustomerBrowseListModel({
    required this.carId,
    required this.mainPhoto,
    required this.modelName,
    required this.licensingDate,
    required this.mileage,
    required this.price,
    required this.carType,
    required this.createdAt,
  });
  @override
  List<Object?> get props => [carId,mainPhoto,modelName,licensingDate,mileage,price,carType,createdAt,];
}
