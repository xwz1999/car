part of 'api.dart';


class _HomeApi{
  _Sort sort = _Sort();

  _Car car = _Car();

  _Contract contract = _Contract();


}


class _Sort{
  ///获取车辆品牌
  String get getCarBrand => '/car/brand/all';

  ///获取车辆品牌下车系
  String get getCarSeries => '/car/series/all';

  ///获取车辆车系下车型
  String get getCarModel => '/car/model/all';
}

class _Car{
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


   ///收藏列表 云云优选
   String get getCollectLists => '/car/collect/lists';

   ///添加到收藏 云云优选
   String get addCollect => '/car/collect/add';

   ///取消收藏 云云优选
   String get cancelCollect => '/car/collect/cancel';


}
class _Contract{

  ///发起寄卖合同
  String get addConsignment => '/contract/consignment/add';

  ///发起出售合同
  String get addSaleContract=> '/contract/sale/add';

}


