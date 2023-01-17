import '../../../../model/car/new_car_info.dart';

class PushPhotoModel {
  List<CarPhotos>? carPhotos;
  List<CarPhotos>? interiorPhotos;
  List<CarPhotos>? defectPhotos;
  // List<CarPhotos>? repairPhotos;
  List<CarPhotos>? dataPhotos;

  PushPhotoModel(
      {this.carPhotos,
        this.interiorPhotos,
        this.defectPhotos,
        this.dataPhotos,
        // this.repairPhotos,
      });


  static PushPhotoModel get init => PushPhotoModel(
    carPhotos:[],
    interiorPhotos:[],
    defectPhotos:[],
      dataPhotos:[]
      // repairPhotos:[]
  );

  PushPhotoModel.fromJson(Map<String, dynamic> json) {
    if (json['carPhotos'] != null) {
      carPhotos = [];
      json['carPhotos'].forEach((v) {
        carPhotos!.add(CarPhotos.fromJson(v));
      });
    }
    if (json['interiorPhotos'] != null) {
      interiorPhotos = [];
      json['interiorPhotos'].forEach((v) {
        interiorPhotos!.add(CarPhotos.fromJson(v));
      });
    }
    if (json['defectPhotos'] != null) {
      defectPhotos = [];
      json['defectPhotos'].forEach((v) {
        defectPhotos!.add( CarPhotos.fromJson(v));
      });
    }

    if (json['dataPhotos'] != null) {
      dataPhotos = [];
      json['dataPhotos'].forEach((v) {
        dataPhotos!.add(CarPhotos.fromJson(v));
      });
    }
    // if (json['repairPhotos'] != null) {
    //   repairPhotos = [];
    //   json['repairPhotos'].forEach((v) {
    //     repairPhotos!.add(CarPhotos.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (carPhotos != null) {
      data['carPhotos'] = carPhotos!.map((v) => v.toJson()).toList();
    }
    if (interiorPhotos != null) {
      data['interiorPhotos'] =
          interiorPhotos!.map((v) => v.toJson()).toList();
    }
    if (defectPhotos != null) {
      data['defectPhotos'] = defectPhotos!.map((v) => v.toJson()).toList();
    }
    if (dataPhotos != null) {
      data['dataPhotos'] = dataPhotos!.map((v) => v.toJson()).toList();
    }
    // if (repairPhotos != null) {
    //   data['repairPhotos'] = repairPhotos!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class CarPhotos {
  String? photo;
  String? text;

  CarPhotos({this.photo, this.text});

  CarPhotos.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photo'] = photo;
    data['text'] = text;
    return data;
  }
}