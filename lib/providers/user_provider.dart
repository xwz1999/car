
import 'package:flutter/foundation.dart';

import '../model/user/user_info_model.dart';
import '../utils/hive_store.dart';
import '../utils/new_work/api_client.dart';

class UserProvider extends ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;
  late UserInfoModel _userInfo;

  UserInfoModel get userInfo => _userInfo;

  Future<bool> init() async {
    if (HiveStore.appBox?.containsKey('token')??false) {
      final token = HiveStore.appBox?.get('token') as String;

      _isLogin = true;
      apiClient.setToken(token);
      //每次打开app更新用户信息
      await updateUserInfo();
      return true;
    } else {
      _isLogin = false;
      return false;
    }
  }

  Future logout() async {
    // await apiClient.request(API.user.signOut);
    apiClient.clearToken();
    _isLogin = false;
    await HiveStore.appBox?.delete('token');
  }

  Future updateUserInfo() async {
    // var base = await apiClient.request(API.user.info);
    // if (base.code == 0) {
    //   _userInfo = UserInfoModel.fromJson(base.data);
    // } else {
    //   CloudToast.show(base.msg);
    // }
  }

}
