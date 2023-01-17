// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_add_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditAddModel _$EditAddModelFromJson(Map<String, dynamic> json) => EditAddModel(
      cardId: json['cardId'] as int,
      baseInfo: BaseInfo.fromJson(json['baseInfo'] as Map<String, dynamic>),
    );

// Map<String, dynamic> _$EditAddModelToJson(EditAddModel instance) =>
//     <String, dynamic>{
//       'cardId': instance.cardId,
//       'baseInfo': instance.baseInfo,
//     };

BaseInfo _$BaseInfoFromJson(Map<String, dynamic> json) => BaseInfo(
      color: json['color'] as String,
      interiorColor: json['interiorColor'] as String,
      parkingNo: json['parkingNo'] as String,
      stockStatus: json['stockStatus'] as int,
      useCharacter: json['useCharacter'] as int,
      shamMileage: json['shamMileage'] as num,
      installationCost: json['installationCost'] as int,
      location: json['location'] as int,
      condition: json['condition'] as String,
    );

// Map<String, dynamic> _$BaseInfoToJson(BaseInfo instance) => <String, dynamic>{
//       'color': instance.color,
//       'interiorColor': instance.interiorColor,
//       'parkingNo': instance.parkingNo,
//       'stockStatus': instance.stockStatus,
//       'useCharacter': instance.useCharacter,
//       'shamMileage': instance.shamMileage,
//       'installationCost': instance.installationCost,
//       'location': instance.location,
//       'condition': instance.condition,
//     };
