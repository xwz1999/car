// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_card_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdCardInfoModel _$IdCardInfoModelFromJson(Map<String, dynamic> json) =>
    IdCardInfoModel(
      number: json['number'] as String,
      address: json['address'] as String,
      nation: json['nation'] as String,
      sex: json['sex'] as String,
      name: json['name'] as String,
      birth: json['birth'] as String,
    );

Map<String, dynamic> _$IdCardInfoModelToJson(IdCardInfoModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'address': instance.address,
      'nation': instance.nation,
      'sex': instance.sex,
      'name': instance.name,
      'birth': instance.birth,
    };
