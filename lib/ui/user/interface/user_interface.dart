import 'package:cloud_car/constants/api/api.dart';

import 'package:cloud_car/model/user/History_model.dart';

import 'package:cloud_car/model/user/roleall_model.dart';

import 'package:cloud_car/model/user/storeall_model.dart';
import 'package:cloud_car/model/user/storeselect_moedl.dart';

import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_list_model.dart';

import 'package:cloud_car/utils/new_work/inner_model/base_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';

class User {
  //获取剩余评估次数
  static Future<String> getWallet() async {
    BaseModel res = await apiClient.request(
      API.user.wallet.assessCount,
    );
    if (res.data! == null) return '0';
    return (res.data['count'] as int).toString();
  }

//充值
// static Future<List<>> getRecharge() async{
//   int count;
//   int payType
//   BaseListModel res=await apiClient.requestList(API.user.recharge.assessRecharge,data:{'count':10,'payType':2}

//   );
//   if(res.data! == 0) return [];
// return res.data!.list!.map((e) => <>.formJson(e)).toList();
// }

//评估记录
  static Future<List<HistoryModel>> getHistory() async {
    BaseListModel res =
        await apiClient.requestList(API.user.history.assessHistory);
    // ignore: unrelated_type_equality_checks
    if (res.data!.list == 0) return [];
    return res.data!.list!.map((e) => HistoryModel.fromJson(e)).toList();
  }

  //支付宝实名认证
  static Future<String> getAil(
      String name, String idCard, String idCardFront, String idCardBack) async {
    BaseModel res = await apiClient.request(API.user.ail.certifyAil, data: {
      'name': name,
      'idCard': idCard,
      'idCardFront': idCardFront,
      'idCardBack': idCardBack,
    });
    if (res.data! == 0) return '0';
    return (res.msg).toString();
  }

//获取支付宝实名认证结果
  static Future<String> getResult(
    String certifyId,
  ) async {
    BaseModel res = await apiClient
        .request(API.user.result.ailResult, data: {"certifyId": certifyId});
    if (res.data! == null) return '1';
    return (res.data['success'] as String).toString();
  }


  //组织架构
  static Future<List<StoreallModel>> getStoreall() async {
    BaseListModel res =
        await apiClient.requestList(API.storeManagement.storeAll, data: {});

    if (res.data!.list == null) return [];
    return (res.data!.list!).map((e) => StoreallModel.fromJson(e)).toList();
  }

  //全部角色
  static Future<List<RoleallModel>> getRoleall() async {
    BaseListModel res =
        await apiClient.requestList(API.storeManagement.roleAll, data: {});
    if (res.data!.list == null) return [];
    return (res.data!.list!).map((e) => RoleallModel.fromJson(e)).toList();
  }

  //门店筛选
  static Future<List<StoreselectMoedl>> getStoreselect() async {
    BaseListModel res =
        await apiClient.requestList(API.storeManagement.storeSelect, data: {});
    if (res.data!.list == null) return [];
    return (res.data!.list!).map((e) => StoreselectMoedl.fromJson(e)).toList();
  }

  //添加门店
  static Future<bool> getStoreadd(
    String name,
    String address,
  ) async {
    BaseModel res =
        await apiClient.request(API.storeManagement.storeAdd, data: {
      'name': name,
      'address': address,
    });
    if (res.code==0) {
      return true;
    } else{
      CloudToast.show(res.msg);
      return false;
    }
  }

  //添加员工
  static Future<bool> getStaffadd(
    String name,
    int gender,
    String phone,
    int storeId,
    int roleId,
    String commission,
  ) async {
    BaseModel res =
        await apiClient.request(API.storeManagement.staffAdd, data: {
      'name': name,
      'gender': gender,
      'phone': phone,
      'storeId': storeId,
      'roleId': roleId,
      'commission': commission
    });
    if (res.code==0) {
      return true;
    } else{
      CloudToast.show(res.msg);
      return false;
    }
  }
}
