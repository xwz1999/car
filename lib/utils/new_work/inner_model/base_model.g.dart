// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel<T> _$BaseModelFromJson<T>(Map<String, dynamic> json) => BaseModel<T>(
      code: json['code'] as int,
      msg: json['msg'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$BaseModelToJson<T>(BaseModel<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };
