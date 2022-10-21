import 'package:cloud_car/ui/home/car_manager/publish_car/push_photo_model.dart';

class ReportPhotoModel {
  List<CarPhotos>? paints;

  ReportPhotoModel({this.paints});

  static ReportPhotoModel get init => ReportPhotoModel(
    paints:[],
  );

  ReportPhotoModel.fromJson(Map<String, dynamic> json) {
    if (json['paints'] != null) {
      paints = [];
      json['paints'].forEach((v) {
        paints!.add(CarPhotos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (paints != null) {
      data['paints'] = paints!.map((v) => v.toJson()).toList();
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