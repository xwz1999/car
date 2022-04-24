import 'package:cloud_car/model/poster/poster_list_model.dart';

import '../../../constants/api/api.dart';
import '../../../utils/new_work/api_client.dart';
import '../../../utils/new_work/inner_model/base_list_model.dart';
import '../../../utils/toast/cloud_toast.dart';

class PosterFunc {
  static Future<List<PosterListModel>> getPosterList({
    required int page,
    int size = 10,
  }) async {
    BaseListModel baseList =
        await apiClient.requestList(API.poster.list, data: {
      'page': page,
      'size': size,
    });
    if (baseList.code != 0) {
      CloudToast.show(baseList.msg);
      return [];
    } else {
      return baseList.nullSafetyList
          .map((e) => PosterListModel.fromJson(e))
          .toList();
    }
  }
}
