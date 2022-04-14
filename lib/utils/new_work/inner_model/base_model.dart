import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable()
class BaseModel<T> {
  int code;
  String msg;
  dynamic data;
  BaseModel({
    required this.code,
    required this.msg,
    this.data,
  });

  List<T> map(T Function(dynamic json) f) {
    if (data == null) return [];
    return (data! as List<T>).map(f).toList();
  }

  factory BaseModel.unknown() => BaseModel(
    code: -1,
    msg: 'UNKNOW FAIL',
  );

  factory BaseModel.dioErr(DioError err) => BaseModel(
    code: err.response?.statusCode ?? -1,
    msg: err.message,
  );

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json) as BaseModel<T>;
}
