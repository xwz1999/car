import 'package:cloud_car/model/car/customer_browse_list_model.dart';
import 'package:cloud_car/model/car/customer_trail_model.dart';
import 'package:cloud_car/model/customer/customer_list_model.dart';

import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_list_model.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_model.dart';

import 'package:cloud_car/utils/toast/cloud_toast.dart';

class CustomerFunc {
  ///获取浏览车辆列表
  static Future<List<CustomerBrowseListModel>> getCustomerBrowseList(
    int customerId,
    int page,
  ) async {
    BaseListModel baseList = await apiClient.requestList(
        API.customer.browseLists,
        data: {'customerId': customerId, 'page': page, 'size': 10});
    if (baseList.code != 0) {
      CloudToast.show(baseList.msg);
      return [];
    } else {
      return baseList.nullSafetyList
          .map((e) => CustomerBrowseListModel.fromJson(e))
          .toList();
    }
  }

  ///获取客户轨迹
  static Future<List<CustomerTrailModel>> getCustomerTrail(
      int customerId) async {
    BaseModel model =
        await apiClient.request(API.customer.customerTrail, data: {
      'customerId': customerId,
    });

    if (model.code != 0) {
      CloudToast.show(model.msg);
      return [];
    } else {
      if (model.data != null) {
        return (model.data as List)
            .map((e) => CustomerTrailModel.fromJson(e))
            .toList();
      } else {
        return [];
      }
    }
  }

  ///获取客户轨迹
  static Future<List<CustomerListModel>> getCustomerList(
      {required int page,
      int size = 10,
      String? order,
      Map<String, dynamic>? searchParams}) async {
    BaseListModel baseList = await apiClient
        .requestList(API.customer.customerLists, data: {
      'page': page,
      'size': 10,
      'search': searchParams,
      'order': order
    });
    if (baseList.code != 0) {
      CloudToast.show(baseList.msg);
      return [];
    } else {
      return baseList.nullSafetyList
          .map((e) => CustomerListModel.fromJson(e))
          .toList();
    }
  }
}
