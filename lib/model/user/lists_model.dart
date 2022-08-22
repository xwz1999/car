import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../ui/user/user_order/status.dart';

part 'lists_model.g.dart';

@JsonSerializable()
class ListsModel extends Equatable {
  final int id;
  final String orderSn;
  final int status;
  final int auditStatus;
  final String modeName;
  final int licensingDate;
  final String mileage;
  final String price;
  final int createdAt;
  final String carPhoto;

  factory ListsModel.fromJson(Map<String, dynamic> json) =>
      _$ListsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListsModelToJson(this);

  ConsignmentStatus get statusEnum => ConsignmentStatus.getStatus(status);

  CarConsignmentStatus get carStatusEnum =>
      CarConsignmentStatus.getStatus(status);

  @override
  List<Object?> get props => [
        id,
        orderSn,
        status,
        auditStatus,
        modeName,
        licensingDate,
        mileage,
        price,
        createdAt,
        carPhoto,
      ];

  const ListsModel({
    required this.id,
    required this.orderSn,
    required this.status,
    required this.auditStatus,
    required this.modeName,
    required this.licensingDate,
    required this.mileage,
    required this.price,
    required this.createdAt,
    required this.carPhoto,
  });

  ListsModel copyWith({
    int? id,
    String? orderSn,
    int? status,
    int? auditStatus,
    String? modeName,
    int? licensingDate,
    String? mileage,
    String? price,
    int? createdAt,
    String? carPhoto,
  }) {
    return ListsModel(
      id: id ?? this.id,
      orderSn: orderSn ?? this.orderSn,
      status: status ?? this.status,
      auditStatus: auditStatus ?? this.auditStatus,
      modeName: modeName ?? this.modeName,
      licensingDate: licensingDate ?? this.licensingDate,
      mileage: mileage ?? this.mileage,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      carPhoto: carPhoto ?? this.carPhoto,
    );
  }
}
