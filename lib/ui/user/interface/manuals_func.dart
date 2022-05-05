import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/user/HandbookInfo_model.dart';
import 'package:cloud_car/model/user/Handbook_model.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';

class ManualsFunc {
  ///用户手册
  static Future<List<HandbookModel>> getHandbookAll() async {
    BaseModel res = await apiClient.request(API.broker.handbookAll, data: {});
    if ((res.data as List).isEmpty) return [];
    return (res.data as List).map((e) => HandbookModel.fromJson(e)).toList();
  }

  ///用户详情
  static Future<HandbookInfoModel?> getHandbookInfo(
    int itemId,
  ) async {
    BaseModel res = await apiClient
        .request(API.broker.handbookInfo, data: {'itemId': itemId});
    if (res.code == 0) {
      return HandbookInfoModel.fromJson(res.data);
    } else {
      CloudToast.show(res.msg);
      return null;
    }
  }
}
