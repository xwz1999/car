// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_invite_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskInviteListModel _$TaskInviteListModelFromJson(Map<String, dynamic> json) =>
    TaskInviteListModel(
      id: json['id'] as int,
      customerId: json['customerId'] as int,
      type: json['type'] as int,
      customerNickname: json['customerNickname'] as String,
      inviteAt: json['inviteAt'] as int,
    );

Map<String, dynamic> _$TaskInviteListModelToJson(
        TaskInviteListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'type': instance.type,
      'customerNickname': instance.customerNickname,
      'inviteAt': instance.inviteAt,
    };
