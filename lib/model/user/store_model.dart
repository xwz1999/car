import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'store_model.g.dart';


@JsonSerializable()
class StoreModel extends Equatable{
  final int id;
  final String name;
  final String ownBrokerName;
  final String ownerBrokerTel;
  final int createdAt;
  @override
  List<Object?> get props => [id,name,ownBrokerName,ownerBrokerTel,createdAt,];

    factory StoreModel.fromJson(Map<String, dynamic> json) =>_$StoreModelFromJson(json);
    Map<String,dynamic> toJson()=> _$StoreModelToJson(this);

  const StoreModel({
    required this.id,
    required this.name,
    required this.ownBrokerName,
    required this.ownerBrokerTel,
    required this.createdAt,
  });
}