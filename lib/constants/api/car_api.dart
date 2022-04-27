part of 'api.dart';

class _Car {
  _Collect collect = _Collect();

  ///获取车辆品牌
  String get getCarBrand => '/car/brand/all';

  ///获取车辆品牌下车系
  String get getCarSeries => '/car/series/all';

  ///获取车辆车系下车型
  String get getCarModel => '/car/model/all';

  ///行驶证识别
  String get getCarVehicle => '/car/cor/vehicle';

  ///估算价格
  String get estimatePrice => '/car/price/estimate';

  ///费用计算
  String get priceAmount => '/car/price/amount';

  ///车辆列表  //分享
  String get getCarLists => '/car/lists';

  ///我的车辆列表  //分享
  String get getCarSelfLists => '/car/self';

  ///车辆信息
  String get getCarIfo => '/car/self';
}

class _Collect {
  ///收藏列表
  String get list => '/car/collect/lists';

  ///添加收藏
  String get add => '/car/collect/add';

  ///取消收藏
  String get cancel => '/car/collect/cancel';
}
