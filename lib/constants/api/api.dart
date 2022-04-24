import '../environment/environment.dart';

part 'user_api.dart';


/// * user  用户接口
/// * data 基础数据接口
/// * product 产品接口
class API {
  static const tokenKey = 'ansuex-user-token';

  ///HOST
  static String get host {
    if (DevEV.instance.dev) {
      return 'https://apiwenche.oa00.com';
    } else {
      return 'https://apiwenche.oa00.com';
    }
  }

  static String get imageHost {
    if (DevEV.instance.dev) {
      return 'https://static.oa00.com/wenche';
    } else {
      return 'https://static.oa00.com/wenche';
    }
  }

  static String get baseURL => '$host/app/broker';

  //根分类
  static _File file = _File();
  static _Login login = _Login();

  static _StoreManagement storeManagement = _StoreManagement();
  static _Order order = _Order();
  static _Poster poster = _Poster();

  //二级分类
  static _UserApi user = _UserApi();


  static _Car car = _Car();

  static _Contract contract = _Contract();


  static _Customer customer = _Customer();

  static _Task task = _Task();

}


class _Task{
  ///客户邀约列表
  String get getInviteLists => '/task/invite/lists';




}

class _Customer{
  ///客户轨迹
  String get customerTrail => '/customer/trail/all';


  ///浏览车辆列表
  String get browseLists => '/customer/browse/lists';


}

class _Car{

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


class _File {
  ///图片上传
  String get uploadImage => '/file/upload/image';

  ///文件上传
  String get uploadFile => '/file/upload/file';
}

class _Login {
  ///手机号一键登录
  String get phone => '/login/phone';

  ///微信登录
  String get weixin => '/login/wechat';

  ///微信登录绑定账号
  String get weixinBind => '/login/bind';
}

class _Order {
  ///寄卖订单->寄卖订单列表
  get consignmentLists => '/order/consignment/lists';

///寄卖订单->发布车辆
  get consignmentPublish => '/order/consignment/publish';

///邀约
  get inviteAdd => '/order/invite/add';

///售车订单->售车订单列表
  get saleLists => '/order/sale/lists';

///上传检车报告
  get saleTestrepord => '/order/sale/test_report';

///过户
  get scaleTransfer => '/order/sale/transfer';

///完结订单
  get saleFinal => '/order/sale/final';

///叫车订单->添加叫车订单
  get carAdd => '/order/call/car/add';

///交车
  get carFinal => '/order/call/car/final';


  ///添加车商寄卖订单
  get addConsignment => '/order/dealer/consignment/add';
  
}

//门店管理
class _StoreManagement {
//组织架构
  get storeAll => '/business/store/all';

  ///全部角色
  get roleAll => '/business/role/all';

  ///门店筛选
  get storeSelect => '/business/store/select';

  ///添加门店
  get storeAdd => '/business/store/add';

  ///添加员工
  get staffAdd => '/business/staff/add';
}

class _Poster{
  ///海报列表
  String get list => '/playbill/lists';

}