import 'package:json_annotation/json_annotation.dart';

part 'base_list_model.g.dart';

@JsonSerializable()
class BaseListModel<T> {
  final int code;
  final String msg;
  final ListInnerModel? data;
  BaseListModel({
    required this.code,
    required this.msg,
    required this.data,
  });

  factory BaseListModel.fromJson(Map<String, dynamic> json) =>
      _$BaseListModelFromJson(json);

  List<T> map(T Function(dynamic) f) {
    if (data == null) return [];
    if (data!.list == null) return [];
    return data!.list!.map(f).toList();
  }
}

@JsonSerializable()
class ListInnerModel {
  final List<dynamic>? list;
  final int total;
  ListInnerModel({
    this.list,
    required this.total,
  });
  factory ListInnerModel.fromJson(Map<String, dynamic> json) =>
      _$ListInnerModelFromJson(json);
}
