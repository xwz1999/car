import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/split_account/broker_all_model.dart';
import 'package:cloud_car/model/split_account/business_all_model.dart';
import 'package:cloud_car/model/user/roleall_model.dart';
import 'package:cloud_car/model/user/staff_all_model.dart';
import 'package:cloud_car/model/user/staff_info_model.dart';
import 'package:cloud_car/model/user/storeall_model.dart';
import 'package:cloud_car/model/user/storeselect_moedl.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/net_work/inner_model/base_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';

class BusinessFunc {
  ///组织架构
  // static Future<List<StaffAllModel>> getStoreall(Map params) async {
  //   var res =
  //       await apiClient.request(API.storeManagement.staffAll, data: params);
  //
  //   if (res.data==null) return [];
  //   return (res.data as List).map((e) => StaffAllModel.fromJson(e)).toList();
  // }


  static Future<List<StoreallModel>> getStoreall(Map params) async {
    var res =
        await apiClient.request(API.storeManagement.storeAll,data: params);

    if (res.data==null) return [];
    return (res.data as List).map((e) => StoreallModel.fromJson(e)).toList();
  }

  ///全部入驻商
  static Future<List<BusinessAllModel>> getBusinessAll(Map params) async {
    var res =
    await apiClient.request(API.storeManagement.businessAll, data: params);

    if (res.data==null) return [];
    return (res.data as List).map((e) => BusinessAllModel.fromJson(e)).toList();
  }

  ///全部入驻商员工
  static Future<List<BusinessAllModel>> getBusinessStaffAll(Map params) async {
    var res =
    await apiClient.request(API.storeManagement.businessStaffAll, data: params);

    if (res.data==null) return [];
    return (res.data as List).map((e) => BusinessAllModel.fromJson(e)).toList();
  }

  ///全部经纪人
  static Future<List<BrokerAllModel>> getBrokerAll(Map params) async {
    var res =
    await apiClient.request(API.user.allBroker, data: params);

    if (res.data==null) return [];
    return (res.data as List).map((e) => BrokerAllModel.fromJson(e)).toList();
  }

  ///全部角色
  static Future<List<RoleallModel>> getRoleall() async {
    var res = await apiClient.request(
      API.storeManagement.roleAll,
    );
    if ((res.data as List).isEmpty) return [];
    return (res.data as List).map((e) => RoleallModel.fromJson(e)).toList();
  }

  ///门店筛选
  static Future<List<StoreselectMoedl>> getStoreselect() async {
    BaseModel res =
        await apiClient.request(API.storeManagement.storeSelect,);
    if (res.code == 0) {
      return (res.data as List).map((e) => StoreselectMoedl.fromJson(e)).toList();
    } else {
      CloudToast.show(res.msg);
      return [];
    }
  }

  ///添加门店
  static Future<bool> getStoreadd(
    String name,
    String address,
  ) async {
    BaseModel res =
        await apiClient.request(API.storeManagement.storeAdd, data: {
      'name': name,
      'address': address,
    });
    if (res.code == 0) {
      return true;
    } else {
      CloudToast.show(res.msg);
      return false;
    }
  }

  ///添加员工
  static Future<bool> getStaffadd(
    String name,
    int gender,
    String phone,
    int roleId,
    String commission,
  { int storeId=0}
  ) async {
    Map params = {
      'name': name,
      'gender': gender,
      'phone': phone,
      //'storeId': storeId,
      'roleId': roleId,
      'commission': commission
    };
    if(storeId!=0){
      params.putIfAbsent('storeId', () => storeId);
    }


    BaseModel res =
        await apiClient.request(API.storeManagement.staffAdd, data: params);

    if (res.code == 0) {
      return true;
    } else {
      CloudToast.show(res.msg);
      return false;
    }
  }

  ///编辑员工
  static Future<bool> getStaffEdit(int staffId, String name, int gender,
      int storeId, int roleId, String commission) async {
    BaseModel res =
        await apiClient.request(API.storeManagement.staffEdit, data: {
      'staffId': staffId,
      'name': name,
      'gender': gender,
      'storeId': storeId,
      'roleId': roleId,
      'commission': commission
    });
    if (res.code == 0) {
      return true;
    } else {
      CloudToast.show(res.msg);
      return false;
    }
  }

  ///员工详情
  static Future<StaffInfoModel?> getStaffInfo(int staffId) async {
    BaseModel res = await apiClient
        .request(API.storeManagement.staffInfo, data: {'staffId': staffId});
    if (res.code == 0) {
      return StaffInfoModel.fromJson(res.data);
    } else {
      CloudToast.show(res.msg);
      return null;
    }
  }

  ///删除员工
  static Future<bool> getStaffDelete(int staffId) async {
    BaseModel res = await apiClient
        .request(API.storeManagement.staffDelete, data: {'staffId': staffId});
    if (res.code == 0) {
      return true;
    } else {
      return false;
    }
  }
}
