import 'package:cloud_car/ui/home/car_manager/direct_sale/call_order_page.dart';

import '../environment/environment.dart';

part 'user_api.dart';
part 'order_api.dart';
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

  //二级分类
  static _UserApi user = _UserApi();
  static _HomeApi home = _HomeApi();
  static _OrderApi order = _OrderApi();
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
  String get weixin => '/login/wechat';

  ///微信登录绑定账号
  String get weixinBind => '/login/bind';
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
