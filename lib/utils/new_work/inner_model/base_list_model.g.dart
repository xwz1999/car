// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListModel<T> _$BaseListModelFromJson<T>(Map<String, dynamic> json) =>
    BaseListModel<T>(
      code: json['code'] as int,
      msg: json['msg'] as String,
      data: json['data'] == null
          ? null
          : ListInnerModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseListModelToJson<T>(BaseListModel<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

ListInnerModel _$ListInnerModelFromJson(Map<String, dynamic> json) =>
    ListInnerModel(
      list: json['list'] as List<dynamic>?,
      total: json['total'] as int,
    );

Map<String, dynamic> _$ListInnerModelToJson(ListInnerModel instance) =>
    <String, dynamic>{
      'list': instance.list,
      'total': instance.total,
    };
