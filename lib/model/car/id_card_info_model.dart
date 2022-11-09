import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'id_card_info_model.g.dart';

@JsonSerializable()
class IdCardInfoModel extends Equatable {
  final String number;
  final String address;
  final String nation;
  final String sex;
  final String name;
  final String birth;

  @override
  List<Object?> get props => [number,address,nation,sex,name,birth,];

  factory IdCardInfoModel.fromJson(Map<String, dynamic> json) =>
      _$IdCardInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$IdCardInfoModelToJson(this);

  const IdCardInfoModel({
    required this.number,
    required this.address,
    required this.nation,
    required this.sex,
    required this.name,
    required this.birth,
  });
}
