<<<<<<< HEAD
=======
import 'package:json_annotation/json_annotation.dart';

part 'CarItemModel.g.dart';

@JsonSerializable()
>>>>>>> 544b95c5892a0e6efa89f18f0dc80d87d1dcd01f
class CarItemModel {
 String? name;
  String? time;
  String? distance;
  String? standard;
  String? url;
  String? price;

<<<<<<< HEAD
  CarItemModel(
      {this.name,
        this.time,
        this.distance,
        this.standard,
        this.url,
        this.price});

  CarItemModel.fromJson(Map<String, dynamic> json,) {
    name = json['name'];
    time = json['time'];
    distance = json['distance'];
    standard = json['standard'];
    url = json['url'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['time'] = this.time;
    data['distance'] = this.distance;
    data['standard'] = this.standard;
    data['url'] = this.url;
    data['price'] = this.price;
    return data;
  }
}
=======
  factory CarItemModel.fromJson(Map<String, dynamic> json) =>
      _$CarItemModelFromJson(json);

  const CarItemModel({
    required this.name,
    required this.time,
    required this.distance,
    required this.standard,
    required this.url,
    required this.price,
  });
}
>>>>>>> 544b95c5892a0e6efa89f18f0dc80d87d1dcd01f
