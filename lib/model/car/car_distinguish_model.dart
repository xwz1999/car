import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_distinguish_model.g.dart';

@JsonSerializable()
class CarDistinguishModel extends Equatable {
  final String owner;
  final String engineno;
  final String cartype;
  final String address;
  final String lstype;
  final String lsnum;
  final String regdate;
  final String vin;
  final String issuedate;
  final String usetype;

  factory CarDistinguishModel.fromJson(Map<String, dynamic> json) =>
      _$CarDistinguishModelFromJson(json);

  const CarDistinguishModel({
    required this.owner,
    required this.engineno,
    required this.cartype,
    required this.address,
    required this.lstype,
    required this.lsnum,
    required this.regdate,
    required this.vin,
    required this.issuedate,
    required this.usetype,
  });
  
  @override
  List<Object?> get props => [owner,engineno,cartype,address,lstype,lsnum,regdate,vin,issuedate,usetype,];
}


