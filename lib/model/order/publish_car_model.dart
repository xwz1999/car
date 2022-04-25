///发布车辆接口使用

class PublishCarModel {
  int? orderId;
  Photos? photos;
  BaseInfo? baseInfo;
  Report? report;

  PublishCarModel({this.orderId, this.photos, this.baseInfo, this.report});
}

class Photos {
  List<String>? carPhotos;
  List<String>? interiorPhotos;
  List<String>? defectPhotos;
  List<String>? dataPhotos;

  Photos(
      {this.carPhotos,
        this.interiorPhotos,
        this.defectPhotos,
        this.dataPhotos});

}

class BaseInfo {
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

  BaseInfo(
      {this.type,
        this.interiorColor,
        this.displacement,
        this.gearbox,
        this.emissionStandard,
        this.useCharacter,
        this.location,
        this.attribution,
        this.conditionIn,
        this.conditionOut});


}

class Report {
  List<String>? paints;

  Report({this.paints});

}