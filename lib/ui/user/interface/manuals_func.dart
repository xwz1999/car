import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/user/HandbookInfo_model.dart';
import 'package:cloud_car/model/user/Handbook_model.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';

class Handbook {
  ///用户手册
  static Future<List<HandbookModel>> getHandbookAll() async {
    BaseModel res = await apiClient.request(API.broker.handbookAll, data: {});
    if (res.code == 0) {
      return [];
    } else {
      CloudToast.show(res.msg);
      return [];
    }
  }

  ///用户详情
  static Future<List<HandbookInfoModel>> getHandbookInfo() async {
    BaseModel res = await apiClient.request(API.broker.handbookInfo, data: {});
    if (res.code == 0) {
      return [];
    } else {
      CloudToast.show(res.msg);
      return [];
    }
  }
}
