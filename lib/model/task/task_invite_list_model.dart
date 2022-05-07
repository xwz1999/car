import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_invite_list_model.g.dart';

@JsonSerializable()
class TaskInviteListModel extends Equatable {
  final int id;
  final int customerId;
  final int type;
  final String customerNickname;
  final int inviteAt;

  factory TaskInviteListModel.fromJson(Map<String, dynamic> json) =>
      _$TaskInviteListModelFromJson(json);

  const TaskInviteListModel({
    required this.id,
    required this.customerId,
    required this.type,
    required this.customerNickname,
    required this.inviteAt,
  });
  @override
  List<Object?> get props => [id,customerId,type,customerNickname,inviteAt,];
}
