import 'package:cloud_car/constants/app_theme.dart';
import 'package:cloud_car/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/city_provider.dart';
import '../providers/user_provider.dart';
import 'headers.dart';

class UserTool {
  static UserProvider userProvider =
      Provider.of<UserProvider>(Get.context!, listen: false);
  static CityProvider cityProvider =
      Provider.of<CityProvider>(Get.context!, listen: false);

  static AppProvider appProvider =
      Provider.of<AppProvider>(Get.context!, listen: false);

  static MyAppStyle get myAppStyle =>
      Theme.of(Get.context!).extension<MyAppStyle>()!;
}
