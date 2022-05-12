import 'dart:io';

import 'package:cloud_car/ui/home/car_manager/publish_car/push_car_page.dart';

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
}


class BaseInfo{
  String? type;
  String? interiorColor;
  String? displacement;
  String? gearbox;
  String? emissionStandard;
  String? useCharacter;
  int? location;
  int? attribution;
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
  });
}

class Report{
  List<String>? paints;
}
