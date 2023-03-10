import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/preferred/collect_car_model.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/net_work/inner_model/base_list_model.dart';
import 'package:cloud_car/utils/net_work/inner_model/base_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';

class PreferredFunc{

  ///获取收藏列表
  static Future<List<CollectCarModel>> getCollectCarList(int page,int size) async {
    BaseListModel baseList = await apiClient.requestList(
        API.car.collect.list,data: {
      'page':page,'size':size
    }
    );
    if (baseList.code!=0) {
      CloudToast.show(baseList.msg);
      return [];
    }else{
      return baseList.nullSafetyList.map((e) => CollectCarModel.fromJson(e)).toList();
    }
  }

  ///加入收藏
  static Future<bool> addCollect(int carId) async {
    BaseModel model = await apiClient.request(
        API.car.collect.add,data: {
      'carId':carId,

    }
    );
    if (model.code==0) {
      return true;
    } else{
      CloudToast.show(model.msg);
      return false;
    }
  }


  ///取消收藏
  static Future<bool> cancelCollect(int carId) async {
    BaseModel model = await apiClient.request(
        API.car.collect.cancel,data: {
      'carId':carId,
    }
    );
    if (model.code==0) {
      return true;
    } else{
      CloudToast.show(model.msg);
      return false;
    }
  }



}