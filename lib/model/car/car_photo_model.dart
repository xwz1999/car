import 'dart:io';


import 'inner_model/car_manage_photo_model.dart';

///发布车辆 车辆信息和车辆图片
class CarPhotoModel {
  CarManagePhotoModel photos;
  BaseInfo baseInfo;
  Report report;

  CarPhotoModel({
    required this.photos,
    required this.baseInfo,
    required this.report,
  });


  static CarPhotoModel get init => CarPhotoModel(report: Report(paints: [],paintsFile: []), photos: CarManagePhotoModel.init, baseInfo: BaseInfo()
  );
}


class BaseInfo{
  String? type;
  String? interiorColor;
  String? displacement;
  String? gearbox;
  String? emissionStandard;
  String? useCharacter;
  int? location;

  String? locationString;


  int? attribution;


  String? attributionString;

  String? conditionIn;
  String? conditionOut;

  BaseInfo({
    this.type = '',
    this.interiorColor= '',
    this.displacement= '',
    this.gearbox= '',
    this.emissionStandard= '',
    this.useCharacter= '',
    this.location,
    this.attribution,
    this.conditionIn= '',
    this.conditionOut= '',
    this.attributionString = '',
    this.locationString = '',
  });
}

class Report{
  List<String>? paints;
  List<File>? paintsFile;

  Report({
    this.paints,
    this.paintsFile,
  });
}

