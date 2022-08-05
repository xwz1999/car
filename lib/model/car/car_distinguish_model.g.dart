// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_distinguish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDistinguishModel _$CarDistinguishModelFromJson(Map<String, dynamic> json) =>
    CarDistinguishModel(
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

Map<String, dynamic> _$CarDistinguishModelToJson(
        CarDistinguishModel instance) =>
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
