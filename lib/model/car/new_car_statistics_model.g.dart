// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_car_statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewCarStatisticsModel _$NewCarStatisticsModelFromJson(
        Map<String, dynamic> json) =>
    NewCarStatisticsModel(
      businessCount:
          BusinessCount.fromJson(json['businessCount'] as Map<String, dynamic>),
      storeCount:
          StoreCount.fromJson(json['storeCount'] as Map<String, dynamic>),
      ownCount: OwnCount.fromJson(json['ownCount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewCarStatisticsModelToJson(
        NewCarStatisticsModel instance) =>
    <String, dynamic>{
      'businessCount': instance.businessCount,
      'storeCount': instance.storeCount,
      'ownCount': instance.ownCount,
    };

BusinessCount _$BusinessCountFromJson(Map<String, dynamic> json) =>
    BusinessCount(
      sellCount: json['sellCount'] as int,
      reserveCount: json['reserveCount'] as int,
      soldCount: json['soldCount'] as int,
      backOutCount: json['backOutCount'] as int,
    );

Map<String, dynamic> _$BusinessCountToJson(BusinessCount instance) =>
    <String, dynamic>{
      'sellCount': instance.sellCount,
      'reserveCount': instance.reserveCount,
      'soldCount': instance.soldCount,
      'backOutCount': instance.backOutCount,
    };

StoreCount _$StoreCountFromJson(Map<String, dynamic> json) => StoreCount(
      sellCount: json['sellCount'] as int,
      reserveCount: json['reserveCount'] as int,
      soldCount: json['soldCount'] as int,
      backOutCount: json['backOutCount'] as int,
    );

Map<String, dynamic> _$StoreCountToJson(StoreCount instance) =>
    <String, dynamic>{
      'sellCount': instance.sellCount,
      'reserveCount': instance.reserveCount,
      'soldCount': instance.soldCount,
      'backOutCount': instance.backOutCount,
    };

OwnCount _$OwnCountFromJson(Map<String, dynamic> json) => OwnCount(
      sellCount: json['sellCount'] as int,
      reserveCount: json['reserveCount'] as int,
      soldCount: json['soldCount'] as int,
      backOutCount: json['backOutCount'] as int,
    );

Map<String, dynamic> _$OwnCountToJson(OwnCount instance) => <String, dynamic>{
      'sellCount': instance.sellCount,
      'reserveCount': instance.reserveCount,
      'soldCount': instance.soldCount,
      'backOutCount': instance.backOutCount,
    };
