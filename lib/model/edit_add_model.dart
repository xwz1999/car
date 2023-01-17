import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'edit_add_model.g.dart';

@JsonSerializable()
class EditAddModel extends Equatable {
  final int cardId;
  final BaseInfo baseInfo;


  factory EditAddModel.fromJson(Map<String, dynamic> json) =>
      _$EditAddModelFromJson(json);

  const EditAddModel({
    required this.cardId,
    required this.baseInfo,

  });

  @override
  List<Object?> get props => [cardId, baseInfo, ];
}

@JsonSerializable()
class BaseInfo extends Equatable {
  final String color;
  final String interiorColor;
  // final String temporaryLicensePlate;
  final String parkingNo;
  final int stockStatus;
  final int useCharacter;
  final num shamMileage;
  // final num purchaseTax;
  final int installationCost;
  final int location;
  final String condition;

  factory BaseInfo.fromJson(Map<String, dynamic> json) =>
      _$BaseInfoFromJson(json);

  const BaseInfo({
    required this.color,
    required this.interiorColor,
    // required this.temporaryLicensePlate,
    required this.parkingNo,
    required this.stockStatus,
    required this.useCharacter,
    required this.shamMileage,
    // required this.purchaseTax,
    required this.installationCost,
    required this.location,
    required this.condition,
  });

  @override
  List<Object?> get props => [
        color,
        interiorColor,
        // temporaryLicensePlate,
        parkingNo,
        stockStatus,
        useCharacter,
        shamMileage,
        // purchaseTax,
        installationCost,
        location,
    condition,
      ];
}

