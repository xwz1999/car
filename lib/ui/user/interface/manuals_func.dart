import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/user/HandbookInfo_model.dart';
import 'package:cloud_car/model/user/Handbook_model.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_model.dart';

class Handbook {
  ///用户手册
  static Future<List<HandbookModel>> getHandbookAll() async {
    BaseModel res = await apiClient.request(API.broker.handbookAll, data: {});
    if ((res.data as List).isEmpty) return [];
    return (res.data as List).map((e) => HandbookModel.fromJson(e)).toList();
  }

  ///用户详情
  static Future<List<HandbookInfoModel>> getHandbookInfo(
    int manualsId,
  ) async {
    BaseModel res = await apiClient
        .request(API.broker.handbookInfo, data: {'itemId': manualsId});
    if ((res.data as List).isEmpty) return [];
    return (res.data as List)
        .map((e) => HandbookInfoModel.fromJson(e))
        .toList();
  }
}
