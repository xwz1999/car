import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel extends Equatable {
  final int id;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);


  @override
  List<Object?> get props => [id];

  const UserInfoModel({
    required this.id,
  });
}
