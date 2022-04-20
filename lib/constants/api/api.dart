
import '../environment/environment.dart';
part 'user_api.dart';

part 'home_api.dart';


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


  static _Storemanagement storemanagement = _Storemanagement();
  static _Order order = _Order();
  //二级分类
  static _UserApi user = _UserApi();
  static _HomeApi home = _HomeApi();


}

extension ImageOnString on String {
  String get image => '${API.imageHost}/$this';

  String sizeImage(int width, [int? height]) {
    var parts = <String>[];
    parts.add('w=$width');
    if (height != null) parts.add('h=$height');
    return '$image@${parts.join('&')}';
  }
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
  String get weixin => 'login/wechat';

  ///微信登录绑定账号
  String get weixinBind => 'login/bind';
}

class _Order {
  //寄卖订单->寄卖订单列表
  get consignmentLists => '/order/consignment/lists';
//寄卖订单->发布车辆
  get consignmentPublish => '/order/consignment/publish';
//邀约
  get inviteAdd => '/order/invite/add';
//售车订单->售车订单列表
  get saleLists => '/order/sale/lists';
//上传检车报告
  get saleTestrepord => '/order/sale/test_report';
//过户
  get scaleTransfer => '/order/sale/transfer';
//完结订单
  get saleFinal => '/order/sale/final';
//叫车订单->添加叫车订单
  get carAdd => '/order/call/car/add';
//交车
  get carFinal => '/order/call/car/final';
}

//门店管理
class _Storemanagement {
//组织架构
  get storeAll => '/business/store/all';
  //全部角色
  get roleAll => '/business/role/all';
  //门店筛选
  get storeSelect => '/business/store/select';
  //添加门店
  get storeAdd => '/business/store/add';
  //添加员工
  get staffAdd => '/business/staff/add';
}
