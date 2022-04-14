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
      return 'https://static.apiwenche.oa00.com';
    } else {
      return 'https://static.apiwenche.oa00.com';
    }
  }

  static String get baseURL => '$host/app/broker';

  static _File file = _File();
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
  String get uploadImage => '/app/broker/file/upload/image';

  ///文件上传
  String get uploadFile => '/app/broker/file/upload/file';
}
