part of 'api.dart';


class _HomeApi{
  _Sort sort = _Sort();
}


class _Sort{
  ///获取车辆品牌
  String get getCarBrand => '/car/brand/all';

  ///获取车辆品牌下车系
  String get getCarSeries => '/car/series/all';

  ///获取车辆车系下车型
  String get getCarModel => '/car/model/all';
}