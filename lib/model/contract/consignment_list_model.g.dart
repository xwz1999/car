// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consignment_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsignmentListModel _$ConsignmentListModelFromJson(
        Map<String, dynamic> json) =>
    ConsignmentListModel(
      id: json['id'] as int,
      contractSn: json['contractSn'] as String,
      modelName: json['modelName'] as String,
      customerName: json['customerName'] as String,
      status: json['status'] as int,
      signAt: json['signAt'] as num,
    );
