// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_distinguish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDistinguishModel _$CarDistinguishModelFromJson(Map<String, dynamic> json) =>
    CarDistinguishModel(
      vehicle: VechicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
      vinModel: (json['vin_model'] as List<dynamic>?)
          ?.map((e) => VinModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CarDistinguishModelToJson(
        CarDistinguishModel instance) =>
    <String, dynamic>{
      'vehicle': instance.vehicle,
      'vin_model': instance.vinModel,
    };

VechicleModel _$VechicleModelFromJson(Map<String, dynamic> json) =>
    VechicleModel(
      owner: json['owner'] as String,
      engineno: json['engineno'] as String,
      cartype: json['cartype'] as String,
      address: json['address'] as String,
      lstype: json['lstype'] as String,
      lsnum: json['lsnum'] as String,
      regdate: json['regdate'] as String,
      vin: json['vin'] as String,
      issuedate: json['issuedate'] as String,
      usetype: json['usetype'] as String,
    );

Map<String, dynamic> _$VechicleModelToJson(VechicleModel instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'engineno': instance.engineno,
      'cartype': instance.cartype,
      'address': instance.address,
      'lstype': instance.lstype,
      'lsnum': instance.lsnum,
      'regdate': instance.regdate,
      'vin': instance.vin,
      'issuedate': instance.issuedate,
      'usetype': instance.usetype,
    };

VinModel _$VinModelFromJson(Map<String, dynamic> json) => VinModel(
      seriesGroupName: json['series_group_name'] as String,
      color: json['color'] as String,
      modelLiter: json['model_liter'] as String,
      modelYear: json['model_year'] as int,
      brandName: json['brand_name'] as String,
      modelId: json['model_id'] as int,
      brandId: json['brand_id'] as int,
      seriesId: json['series_id'] as int,
      modelName: json['model_name'] as String,
      modelPrice: json['model_price'] as num,
      modelEmissionStandard: json['model_emission_standard'] as String,
      modelGear: json['model_gear'] as String,
      seriesName: json['series_name'] as String,
      minRegYear: json['min_reg_year'] as int,
      maxRegYear: json['max_reg_year'] as int,
      extModelId: json['ext_model_id'] as int,
    );

Map<String, dynamic> _$VinModelToJson(VinModel instance) => <String, dynamic>{
      'series_group_name': instance.seriesGroupName,
      'color': instance.color,
      'model_liter': instance.modelLiter,
      'model_year': instance.modelYear,
      'brand_name': instance.brandName,
      'model_id': instance.modelId,
      'brand_id': instance.brandId,
      'series_id': instance.seriesId,
      'model_name': instance.modelName,
      'model_price': instance.modelPrice,
      'model_emission_standard': instance.modelEmissionStandard,
      'model_gear': instance.modelGear,
      'series_name': instance.seriesName,
      'min_reg_year': instance.minRegYear,
      'max_reg_year': instance.maxRegYear,
      'ext_model_id': instance.extModelId,
    };
