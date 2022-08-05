import 'package:cloud_car/ui/user/user_order/status.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'callcarlist_model.g.dart';

@JsonSerializable()
class CallcarlistModel extends Equatable {
  final int id;
  final String orderSn;
  final String mainPhoto;
  final String modelName;
  final int licensingDate;
  final String mileage;
  final int transfer;
  final String amount;
  final int status;

  factory CallcarlistModel.fromJson(Map<String, dynamic> json) =>
      _$CallcarlistModelFromJson(json);

  Map<String, dynamic> toJson() => _$CallcarlistModelToJson(this);
  OrderCallCarStatus get statusEnum => OrderCallCarStatus.getStatus(status);

  const CallcarlistModel({
    required this.id,
    required this.orderSn,
    required this.mainPhoto,
    required this.modelName,
    required this.licensingDate,
    required this.mileage,
    required this.transfer,
    required this.amount,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        orderSn,
        mainPhoto,
        modelName,
        licensingDate,
        mileage,
        transfer,
        amount,
        status,
      ];
}
