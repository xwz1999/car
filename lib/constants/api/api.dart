import '../environment/environment.dart';

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

  //二级分类
  static _UserApi user = _UserApi();
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

class _UserApi {
  _Wallet wallet = _Wallet();
}

class _Wallet {
  String get wallet => '/user/wallet/assess/count';
}
