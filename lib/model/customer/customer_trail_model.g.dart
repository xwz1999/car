// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_trail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerTrailModel _$CustomerTrailModelFromJson(Map<String, dynamic> json) =>
    CustomerTrailModel(
      type: json['type'] as String,
      initiatorName: json['initiatorName'] as String,
      contentType: json['contentType'] as int,
      content: json['content'] as String,
      createdAt: json['createdAt'] as int,
      invite: Invite.fromJson(json['invite'] as Map<String, dynamic>),
      reserve: Reserve.fromJson(json['reserve'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerTrailModelToJson(CustomerTrailModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'initiatorName': instance.initiatorName,
      'contentType': instance.contentType,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'invite': instance.invite,
      'reserve': instance.reserve,
    };

Invite _$InviteFromJson(Map<String, dynamic> json) => Invite(
      inviteAt: json['inviteAt'] as int,
      address: json['address'] as String,
      remark: json['remark'] as String,
      carId: json['carId'] as int,
      mainPhoto: json['mainPhoto'] as String,
      modelName: json['modelName'] as String,
      licensingDate: json['licensingDate'] as int,
      mileage: json['mileage'] as String,
      price: json['price'] as String,
      carType: json['carType'] as int,
    );

Map<String, dynamic> _$InviteToJson(Invite instance) => <String, dynamic>{
      'inviteAt': instance.inviteAt,
      'address': instance.address,
      'remark': instance.remark,
      'carId': instance.carId,
      'mainPhoto': instance.mainPhoto,
      'modelName': instance.modelName,
      'licensingDate': instance.licensingDate,
      'mileage': instance.mileage,
      'price': instance.price,
      'carType': instance.carType,
    };

Reserve _$ReserveFromJson(Map<String, dynamic> json) => Reserve(
      reserveAt: json['reserveAt'] as int,
      address: json['address'] as String,
      modelName: json['modelName'] as String,
      licensingDate: json['licensingDate'] as int,
      mileage: json['mileage'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$ReserveToJson(Reserve instance) => <String, dynamic>{
      'reserveAt': instance.reserveAt,
      'address': instance.address,
      'modelName': instance.modelName,
      'licensingDate': instance.licensingDate,
      'mileage': instance.mileage,
      'price': instance.price,
    };
