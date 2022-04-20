import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'lists_model.g.dart';

@JsonSerializable()
class ListsModel extends Equatable {
  final int id;
  final String oredrSn;
  final int status;
  final String modeNamel;
  final int licensingDate;
  final int mileage;
  final String price;
  final int createAt;

  // ignore: prefer_const_constructors_in_immutables


  factory ListsModel.fromJson(Map<String, dynamic> json) =>
      _$ListsModelFromJson(json);

  @override
  List<Object?> get props => [
        {
          id,
          oredrSn,
          status,
          modeNamel,
          licensingDate,
          mileage,
          price,
          createAt
        }
      ];

  const ListsModel({
    required this.id,
    required this.oredrSn,
    required this.status,
    required this.modeNamel,
    required this.licensingDate,
    required this.mileage,
    required this.price,
    required this.createAt,
  });
}
