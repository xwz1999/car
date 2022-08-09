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

  Map<String, dynamic> toJson() => _$BaseListModelToJson(this);
  List get nullSafetyList {
    if (data == null) {
      return [];
    } else if (data!.list == null) {
      return [];
    } else {
      return data!.list!;
    }
  }

  int get nullSafetyTotal {
    if (data == null) {
      return 0;
    } else {
      return data!.total;
    }
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

  Map<String, dynamic> toJson() => _$ListInnerModelToJson(this);
}
