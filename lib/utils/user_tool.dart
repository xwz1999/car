import 'package:provider/provider.dart';

import '../providers/city_provider.dart';
import '../providers/user_provider.dart';
import 'headers.dart';

class UserTool {
  static UserProvider userProvider =
      Provider.of<UserProvider>(Get.context!, listen: false);
  static CityProvider cityProvider =
  Provider.of<CityProvider>(Get.context!, listen: false);
}
