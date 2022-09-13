import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppProvider extends ChangeNotifier {
  late PackageInfo _packageInfo;

  PackageInfo get packageInfo => _packageInfo;

  Future init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }


  /// 微信是否安装
   bool wxInstall=false;
}
