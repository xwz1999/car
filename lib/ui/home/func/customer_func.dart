import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/car/customer_browse_list_model.dart';
import 'package:cloud_car/model/car/customer_trail_model.dart';
import 'package:cloud_car/model/customer/customer_detail_model.dart';
import 'package:cloud_car/model/customer/customer_list_model.dart';
import 'package:cloud_car/model/customer/customer_statistics_model.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
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

  ///获取客户列表
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

  ///获取客户统计
  static Future<CustomerStatisticsModel?> getCustomerStatistics() async {
    BaseModel model = await apiClient.request(
      API.customer.customerCount,
    );

    if (model.code != 0) {
      CloudToast.show(model.msg);
      return const CustomerStatisticsModel(
          intentionCount: 0, doneCount: 0, registerCount: 0, browseCount: 0);
    } else {
      if (model.data != null) {
        return CustomerStatisticsModel.fromJson(model.data);
      } else {
        return const CustomerStatisticsModel(
            intentionCount: 0, doneCount: 0, registerCount: 0, browseCount: 0);
      }
    }
  }

  ///设为重要
  static Future<bool> setImportant(int customerIds) async {
    BaseModel model =
        await apiClient.request(API.customer.customerImportant, data: {
      'customerIds': [customerIds],
    });
    if (model.code == 0) {
      if (model.msg == '操作成功') {
        return true;
      } else {
        return false;
      }
    } else {
      CloudToast.show(model.msg);
      return false;
    }
  }

  ///取消设为重要
  static Future<bool> cancelImportant(int customerIds) async {
    BaseModel model =
        await apiClient.request(API.customer.customerImportantCancel, data: {
      'customerIds': [customerIds],
    });
    if (model.code == 0) {
      if (model.msg == '操作成功') {
        return true;
      } else {
        return false;
      }
    } else {
      CloudToast.show(model.msg);
      return false;
    }
  }

  ///获取客户详情

  static Future<CustomerDetailModel> getCustomerDetailModel(
      int customerId) async {
    BaseModel model = await apiClient
        .request(API.customer.customerInfo, data: {'customerId': customerId});

    if (model.code != 0) {
      CloudToast.show(model.msg);
      return CustomerDetailModel.empty();
    } else {
      if (model.data != null) {
        return CustomerDetailModel.fromJson(model.data);
      } else {
        return CustomerDetailModel.empty();
      }
    }
  }
}
