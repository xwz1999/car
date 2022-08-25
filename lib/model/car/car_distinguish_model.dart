
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_distinguish_model.g.dart';

@JsonSerializable()
class CarDistinguishModel extends Equatable {
  final VechicleModel vehicle;
  final List<VinModel>? vinModel;

  factory CarDistinguishModel.fromJson(Map<String, dynamic> json) =>
      _$CarDistinguishModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarDistinguishModelToJson(this);
  @override
  List<Object?> get props => [
    vehicle,
    vinModel,
  ];

  const CarDistinguishModel({
    required this.vehicle,
    this.vinModel,
  });
}



@JsonSerializable()
class VechicleModel extends Equatable {
  final String owner;
  final String engineno;
  final String cartype;
  final String address;
  final String lstype;
  final String lsnum;
  final String regdate;
  final String vin;
  final String issuedate;
  final String usetype;

  @override
  List<Object?> get props => [
        owner,
        engineno,
        cartype,
        address,
        lstype,
        lsnum,
        regdate,
        vin,
        issuedate,
        usetype,
      ];

  factory VechicleModel.fromJson(Map<String, dynamic> json) =>
      _$VechicleModelFromJson(json);

  Map<String, dynamic> toJson() => _$VechicleModelToJson(this);

  const VechicleModel({
    required this.owner,
    required this.engineno,
    required this.cartype,
    required this.address,
    required this.lstype,
    required this.lsnum,
    required this.regdate,
    required this.vin,
    required this.issuedate,
    required this.usetype,
  });
}

@JsonSerializable()
class VinModel extends Equatable {
  final String seriesGroupName;
  final String color;
  final String modelLiter;
  final int modelYear;
  final String brandName;
  final int modelId;
  final int brandId;
  final int seriesId;
  final String modelName;
  final String modelPrice;
  final String modelEmissionStandard;
  final String modelGear;
  final String seriesName;
  final int minRegYear;
  final int maxRegYear;
  final int extModelId;

  factory VinModel.fromJson(Map<String, dynamic> json) =>
      _$VinModelFromJson(json);

  Map<String, dynamic> toJson() => _$VinModelToJson(this);

  @override
  List<Object?> get props => [
        seriesGroupName,
        color,
        modelLiter,
        modelYear,
        brandName,
        modelId,
        brandId,
        seriesId,
        modelName,
        modelPrice,
        modelEmissionStandard,
        modelGear,
        seriesName,
        minRegYear,
        maxRegYear,
        extModelId,
      ];

  const VinModel({
    required this.seriesGroupName,
    required this.color,
    required this.modelLiter,
    required this.modelYear,
    required this.brandName,
    required this.modelId,
    required this.brandId,
    required this.seriesId,
    required this.modelName,
    required this.modelPrice,
    required this.modelEmissionStandard,
    required this.modelGear,
    required this.seriesName,
    required this.minRegYear,
    required this.maxRegYear,
    required this.extModelId,
  });
}
