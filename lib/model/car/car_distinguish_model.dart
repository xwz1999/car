
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_distinguish_model.g.dart';

@JsonSerializable()
class CarDistinguishModel extends Equatable {
  final VechicleModel vehicle;
  @JsonKey(name:'vin_model')
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
  @JsonKey(name:'series_group_name')
  final String seriesGroupName;
  @JsonKey(name:'color')
  final String color;
  @JsonKey(name:'model_liter')
  final String modelLiter;
  @JsonKey(name:'model_year')
  final int modelYear;
  @JsonKey(name:'brand_name')
  final String brandName;
  @JsonKey(name:'model_id')
  final int modelId;
  @JsonKey(name:'brand_id')
  final int brandId;
  @JsonKey(name:'series_id')
  final int seriesId;
  @JsonKey(name:'model_name')
  final String modelName;
  @JsonKey(name:'model_price')
  final num modelPrice;
  @JsonKey(name:'model_emission_standard')
  final String modelEmissionStandard;
  @JsonKey(name:'model_gear')
  final String modelGear;
  @JsonKey(name:'series_name')
  final String seriesName;
  @JsonKey(name:'min_reg_year')
  final int minRegYear;
  @JsonKey(name:'max_reg_year')
  final int maxRegYear;
  @JsonKey(name:'ext_model_id')
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
