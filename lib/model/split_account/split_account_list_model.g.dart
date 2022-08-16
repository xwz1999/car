// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'split_account_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplitAccountListModel _$SplitAccountListModelFromJson(
        Map<String, dynamic> json) =>
    SplitAccountListModel(
      id: json['id'] as int,
      name: json['name'] as String,
      lastBill: json['lastBill'] as String,
      createAt: json['createAt'] as int,
    );

Map<String, dynamic> _$SplitAccountListModelToJson(
        SplitAccountListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastBill': instance.lastBill,
      'createAt': instance.createAt,
    };
