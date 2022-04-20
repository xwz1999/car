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
  ListsModel(this.id, this.oredrSn, this.status, this.modeNamel,
      this.licensingDate, this.mileage, this.price, this.createAt);

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
}
