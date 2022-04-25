
import 'package:cloud_car/model/car_manager/customer_browse_list_model.dart';
import 'package:cloud_car/model/car_manager/customer_trail_model.dart';


import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_list_model.dart';

import 'package:cloud_car/utils/toast/cloud_toast.dart';

class CustomerFunc{

  ///获取浏览车辆列表
  static Future<List<CustomerBrowseListModel>> getCustomerBrowseList(int customerId,int page,) async {
    BaseListModel baseList = await apiClient.requestList(
      API.customer.browseLists,data: {
        'customerId':customerId, 'page':page,'size':10
    }
    );
    if (baseList.code!=0) {
      CloudToast.show(baseList.msg);
      return [];
    }else{
      return baseList.nullSafetyList.map((e) => CustomerBrowseListModel.fromJson(e)).toList();
    }
  }


  ///获取客户轨迹
  static Future<List<CustomerTrailModel>> getCustomerTrail(int customerId) async {
    BaseListModel baseList = await apiClient.requestList(
        API.customer.customerTrail, data: {
      'customerId': customerId,
    }
    );
    if (baseList.code != 0) {
      CloudToast.show(baseList.msg);
      return [];
    } else {
      return baseList.nullSafetyList.map((e) =>
          CustomerTrailModel.fromJson(e)).toList();
    }
  }


}