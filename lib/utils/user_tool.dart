import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import 'headers.dart';

class UserTool {
  static UserProvider userProvider =
      Provider.of<UserProvider>(Get.context!, listen: false);
}
