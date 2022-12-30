import '../environment/environment.dart';

part 'car_api.dart';
part 'user_api.dart';

/// * user  用户接口
/// * data 基础数据接口
/// * product 产品接口
class API {
  static const tokenKey = 'Broker-Token';

  ///HOST
  static String get host {
    switch (AppENV.instance.env) {
      case ENVConfig.dev:
        return 'https://apiwenche.oa00.com';
      case ENVConfig.release:
        return 'https://api.yunyunwenche.com';
      case ENVConfig.local:
        return 'http://192.168.50.75:8094';
    }
  }

  static String get imageHost {
    switch (AppENV.instance.env) {
      case ENVConfig.dev:
        return 'https://static.oa00.com/wenche';
      case ENVConfig.release:
        return 'https://static.yunyunwenche.com';
      case ENVConfig.local:
        return 'https://static.oa00.com/wenche';
    }
  }

  static String get baseURL => '$host/app/broker';

  //根分类
  ///文件
  static _File file = _File();

  ///登陆
  static _Login login = _Login();

  ///门店管理
  static _StoreManagement storeManagement = _StoreManagement();

  ///订单
  static _Order order = _Order();

  ///海报
  static _Poster poster = _Poster();

  ///车辆
  static _Car car = _Car();

  ///合同
  static _Contract contract = _Contract();

  ///客户
  static _Customer customer = _Customer();

  ///任务
  static _Task task = _Task();

  ///地区
  static _Region region = _Region();

  ///用户手册
  static _Broker broker = _Broker();

  ///意见提交
  static _Feedback feedback = _Feedback();

  /// 分账
  static _Split split = _Split();

  /// 消息
  static _Message message = _Message();

  ///二级分类
  static _UserApi user = _UserApi();

  /// 网页
  static _Web web = _Web();

}

class _Web{
  ///vip服务协议
  String get vipAgreement => 'https://static.yunyunwenche.com/html/vipagreement.html';
}

class _Task {
  ///客户邀约列表
  String get getInviteLists => '/task/invite/lists';
}

class _Customer {
  ///客户轨迹
  String get customerTrail => '/customer/trail/all';

  ///浏览车辆列表
  String get browseLists => '/customer/browse/lists';

  ///客户列表
  String get customerLists => '/customer/lists';

  ///客户统计
  String get customerCount => '/customer/count';

  ///客户详情
  String get customerInfo => '/customer/info';

  ///客户设为重要
  String get customerImportant => '/customer/important';

  ///客户取消重要
  String get customerImportantCancel => '/customer/important/cancel';
}

class _Contract {
  ///发起寄卖合同
  String get addConsignment => '/contract/consignment/add';

  ///发起出售合同
  String get addSaleContract => '/contract/sale/add';

  ///寄卖合同列表
  String get consignmentList => '/contract/consignment/lists';

  ///售出合同列表
  String get soldList => '/contract/sale/lists';

  ///发起收购合同
  String get addPurchase => '/contract/purchase/add';

  ///收购合同列表
  String get purchaseList => '/contract/purchase/lists';

  ///车商出售合同列表
  String get dealerSale =>'/contract/sale/dealer/lists';

  ///车商收购合同列表
  String get carDealerAcquisition   =>'/contract/purchase/dealer/lists';

  ///出售合同详情
 String get saleInfo =>'/contract/sale/info';

 ///收购合同详情
 String get purchaseInfo =>'/contract/purchase/info';

 ///车商出售合同驳回
 String get saleReject =>'/contract/sale/reject';

 ///车商出售合同同意
 String get saleAdopt=>'/contract/sale/adopt';

 ///车商收购驳回
String get purchaseReject =>'/contract/purchase/reject';

 ///车商收购同意
String get purchaseAdopt=>'/contract/purchase/adopt';
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
  String get weixinBind => '/login/bind/wechat';

  ///苹果登录绑定账号
  String get appleBind => '/login/bind/apple';

  ///微信绑定手机号发送验证码
  String get phoneCode => '/login/sms';

  ///退出登陆
  String get logout => '/login/logout';

  ///获取验证码
  String get smsCode => '/login/sms';

  /// 验证码登录
  String get smsCodeLogin => '/login/code';

  /// 验证码登录
  String get appleLogin => '/login/apple';
}

class _Order {
  ///寄卖订单->寄卖订单列表
  get consignmentLists => '/order/consignment/lists';

  ///寄卖订单->发布车辆 个人
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

  ///添加车商寄卖订单 车商发布订单
  get addConsignment => '/order/dealer/consignment/add';

  ///车商寄卖订单列表
  get dealerConsignmentList => '/order/dealer/consignment/lists';

  ///寄卖订单详情
  get consignmentInfo => '/order/consignment/info';

  ///发布车辆详情
  get consignmentInfoCar => '/order/consignment/info/car';

  ///添加车商寄卖订单 车商发布订单
  get newPushCar => '/car/publish';

  ///发布车辆编辑
  get consignmentPublishEdit => '/order/consignment/publish/edit';


  ///入驻商下寄卖订单
  get businessLists => '/order/consignment/business/lists';


  ///售车订单详情
  get saleInfo => '/order/sale/info';

  ///订单统计
  get orderCount => '/order/data/count';

  ///叫车订单
  get callCar => '/order/call/car/lists';

  /// 寄卖订单详情
  String get callCarInfo => '/order/call/car/info';

  ///发布车辆列表(个人)
 String get  pubLists=> '/car/publish/lists';

  ///发布车辆列表(车商)
 String get dealerPubLists=>'/car/publish/dealer/lists';

 ///发布车辆详情
 String get publishInfo=>'/car/publish/info';
}

class _Poster {
  ///海报列表
  String get list => '/playbill/lists';
}

class _Region {
  ///获取省市区数据
  String get all => '/area/all';

  ///获取省市区数据版本
  String get version => '/area/version';

  ///微信绑定手机号发送验证码
  String get phoneCode => '/login/sms';

  /// 获取车300城市数据
  String get cities => '/city/all';
}

///门店管理
class _StoreManagement {
  ///全部门店
  String get  storeAll => '/business/all';

  ///组织架构
  String get structureAll => '/business/store/all';

  ///全部入驻商
  String get businessAll => '/business/allBusiness';

  ///全部入驻商员工
  String get businessStaffAll => '/business/allStaff';

  ///全部员工
  String get staffAll => '/business/staff/all';

  ///全部角色
  get roleAll => '/business/role/all';

  ///门店筛选
  get storeSelect => '/business/store/select';

  ///添加门店
  get storeAdd => '/business/store/add';

  ///添加员工
  get staffAdd => '/business/staff/add';

  ///编辑员工
  get staffEdit => '/business/staff/edit';

  ///删除员工
  get staffDelete => '/business/staff/delete';

  ///员工详情
  get staffInfo => '/business/staff/info';
}

///用户手册
class _Broker {
  ///用户手册
  get handbookAll => '/app/handbook/all';

  ///详情
  get handbookInfo => '/app/handbook/info';
}

///意见反馈
class _Feedback {
  get feedbackSubmit => '/app/feedback/submit';
}

class _Split {
  /// 创建分账
  String get create => '/split/account/create';

  /// 分账列表
  String get list => '/split/account/list';

  /// 分账明细
  String get info => '/split/account/info';

  /// 添加账单
  String get addBill => '/split/account/addBill';

  /// 编辑名称
  String get editName => '/split/account/editName';

  ///利润统计
  String get profit => '/split/account/profit';

  ///结束分账
  String get finish => '/split/account/finish';

  ///获取常用联系人
  String get contactAll => '/split/contact/all';

  ///更新常用联系人状态
  String get updateContact => '/split/contact/update';

  // ///利润统计
  // String get getProfit => 'split/account/profit';


}

class _Message {
  /// 未读消息统计
  String get unReadMessage => '/message/count';

  ///消息列表
  String get messageLists => '/message/lists';

  ///消息详情
  String get messageInfo => '/message/info';
}
