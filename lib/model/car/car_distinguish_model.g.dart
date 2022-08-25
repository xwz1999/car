// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_distinguish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDistinguishModel _$CarDistinguishModelFromJson(Map<String, dynamic> json) =>
    CarDistinguishModel(
      vehicle: VechicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
      vinModel: (json['vinModel'] as List<dynamic>?)
          ?.map((e) => VinModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CarDistinguishModelToJson(
        CarDistinguishModel instance) =>
    <String, dynamic>{
      'vehicle': instance.vehicle,
      'vinModel': instance.vinModel,
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
      seriesGroupName: json['seriesGroupName'] as String,
      color: json['color'] as String,
      modelLiter: json['modelLiter'] as String,
      modelYear: json['modelYear'] as int,
      brandName: json['brandName'] as String,
      modelId: json['modelId'] as int,
      brandId: json['brandId'] as int,
      seriesId: json['seriesId'] as int,
      modelName: json['modelName'] as String,
      modelPrice: json['modelPrice'] as String,
      modelEmissionStandard: json['modelEmissionStandard'] as String,
      modelGear: json['modelGear'] as String,
      seriesName: json['seriesName'] as String,
      minRegYear: json['minRegYear'] as int,
      maxRegYear: json['maxRegYear'] as int,
      extModelId: json['extModelId'] as int,
    );

Map<String, dynamic> _$VinModelToJson(VinModel instance) => <String, dynamic>{
      'seriesGroupName': instance.seriesGroupName,
      'color': instance.color,
      'modelLiter': instance.modelLiter,
      'modelYear': instance.modelYear,
      'brandName': instance.brandName,
      'modelId': instance.modelId,
      'brandId': instance.brandId,
      'seriesId': instance.seriesId,
      'modelName': instance.modelName,
      'modelPrice': instance.modelPrice,
      'modelEmissionStandard': instance.modelEmissionStandard,
      'modelGear': instance.modelGear,
      'seriesName': instance.seriesName,
      'minRegYear': instance.minRegYear,
      'maxRegYear': instance.maxRegYear,
      'extModelId': instance.extModelId,
    };
