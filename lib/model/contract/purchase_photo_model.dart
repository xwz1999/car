import 'package:cloud_car/ui/home/car_manager/publish_car/push_photo_model.dart';

class PurchasePhotoModel {
  List<CarPhotos>? carPhotos;
  List<CarPhotos>? dataPhotos;
  PurchasePhotoModel({this.carPhotos,this.dataPhotos});

  static PurchasePhotoModel get init => PurchasePhotoModel(
    carPhotos:[],
    dataPhotos:[],
  );

  PurchasePhotoModel.fromJson(Map<String, dynamic> json) {
    if (json['carPhotos'] != null) {
      carPhotos = [];
      json['carPhotos'].forEach((v) {
        carPhotos!.add(CarPhotos.fromJson(v));
      });
    }

    if (json['dataPhotos'] != null) {
      dataPhotos = [];
      json['dataPhotos'].forEach((v) {
        dataPhotos!.add(CarPhotos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (carPhotos != null) {
      data['carPhotos'] = carPhotos!.map((v) => v.toJson()).toList();
    }

    if (dataPhotos != null) {
      data['dataPhotos'] = dataPhotos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Paints {
//   String? photo;
//   String? text;
//
//   Paints({this.photo, this.text});
//
//   Paints.fromJson(Map<String, dynamic> json) {
//     photo = json['photo'];
//     text = json['text'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['photo'] = photo;
//     data['text'] = text;
//     return data;
//   }
// }