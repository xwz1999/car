import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'customer_trail_model.g.dart';

@JsonSerializable()
class CustomerTrailModel extends Equatable {
  final String type;
  final String initiatorName;
  final int contentType;
  final String content;
  final int createdAt;
  final Invite invite;
  final Reserve reserve;

  factory CustomerTrailModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerTrailModelFromJson(json);

  const CustomerTrailModel({
    required this.type,
    required this.initiatorName,
    required this.contentType,
    required this.content,
    required this.createdAt,
    required this.invite,
    required this.reserve,
  });
  
  @override
  List<Object?> get props => [type,initiatorName,contentType,content,createdAt,invite,reserve,];
}

@JsonSerializable()
class Invite extends Equatable {
  factory Invite.fromJson(Map<String, dynamic> json) =>_$InviteFromJson(json);
  final int inviteAt;
  final String address;
  final String remark;
  final int carId;
  final String mainPhoto;
  final String modelName;
  final int licensingDate;
  final String mileage;
  final String price;
  final int carType;

  const Invite({
    required this.inviteAt,
    required this.address,
    required this.remark,
    required this.carId,
    required this.mainPhoto,
    required this.modelName,
    required this.licensingDate,
    required this.mileage,
    required this.price,
    required this.carType,
  });
  @override
  List<Object?> get props => [inviteAt,address,remark,carId,mainPhoto,modelName,licensingDate,mileage,price,carType,];
}

@JsonSerializable()
class Reserve extends Equatable {
  factory Reserve.fromJson(Map<String, dynamic> json) =>_$ReserveFromJson(json);
  final int reserveAt;
  final String address;
  final String modelName;
  final int licensingDate;
  final String mileage;
  final String price;

  const Reserve({
    required this.reserveAt,
    required this.address,
    required this.modelName,
    required this.licensingDate,
    required this.mileage,
    required this.price,
  });
  
  @override
  List<Object?> get props => [reserveAt,address,modelName,licensingDate,mileage,price,];
}
