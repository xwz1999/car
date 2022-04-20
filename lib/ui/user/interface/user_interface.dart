import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/user/History_model.dart';
import 'package:cloud_car/model/user/lists_model.dart';
import 'package:cloud_car/model/user/roleall_model.dart';
import 'package:cloud_car/model/user/salelists_model.dart';
import 'package:cloud_car/model/user/storeall_model.dart';
import 'package:cloud_car/model/user/storeselect_moedl.dart';

import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_list_model.dart';

import 'package:cloud_car/utils/new_work/inner_model/base_model.dart';

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

  //独立合伙人签订合同
  static Future<String> getSign(String sign) async {
    BaseModel res =
        await apiClient.request(API.user.pay.partnerPay, data: {'sign': sign});
    if (res.data! == null) return '0';
    return (res.data as String).toString();
    // }
  }

//寄卖订单列表
  static Future<List<ListsModel>> getLists() async {
    BaseListModel res =
        await apiClient.requestList(API.order.consignmentLists, data: {});
    // ignore: unnecessary_null_comparison
    if (res.data!.list! == null) return [];
    return (res.data!.list!).map((e) => ListsModel.fromJson(e)).toList();
  }

  // //发布车辆
  // static Future<StringBuffer> getPublish(int orderId, List photos) async {
  //   BaseListModel res = await apiClient
  //       .requestList(API.order.publish.consignmentPublish, data: {});
  // }

  //邀约
  static Future<String> getAdd(
    int customerId,
    int carId,
    String inviteAt,
    String address,
    String remark,
  ) async {
    BaseModel res = await apiClient.request(API.order.inviteAdd, data: {
      'customerId': customerId,
      'carId': carId,
      'inviteAt': inviteAt,
      'address': address,
      'remark': remark,
    });
    if (res.data! == null) return '0';
    return (res.data as String).toString();
  }

  //售车订单列表
  static Future<List<SalelistsModel>> getSaleList() async {
    BaseListModel res =
        await apiClient.requestList(API.order.saleLists.saleLists, data: {});
    if (res.data!.list == null) return [];
    return (res.data!.list!).map((e) => SalelistsModel.fromJson(e)).toList();
  }

  //上传检车报告
  static Future<String> getTestrepord(
    int orderId,
    String report,
  ) async {
    BaseModel res = await apiClient.request(API.order.saleTestrepord, data: {
      'orderId': orderId,
      'report': report,
    });
    if (res.data! == null) return '0';
    return (res.data as String).toString();
  }

  //过户
  static Future<String> getTransfer(
    int orderId,
    String certificate,
    String vehicleLicence,
    String invoice,
    String guaranteeSlip,
    num commercialInsurancePrice,
  ) async {
    BaseModel res = await apiClient.request(API.order.scaleTransfer, data: {
      'orderId': orderId,
      'certificate': certificate,
      'vehicleLicense': vehicleLicence,
      'invoice': invoice,
      'guaranteeSlip': guaranteeSlip,
      'commercialInsurancePrice': commercialInsurancePrice
    });
    if (res.data! == null) return '0';
    return (res.data! as String).toString();
  }

  //完结订单
  static Future<String> getFinal(int orderId) async {
    BaseModel res = await apiClient.request(API.order.saleFinal, data: {
      'orderId': orderId,
    });
    if (res.data! == null) return '0';
    return (res.data! as String).toString();
  }

  //叫车订单->添加叫车订单
  static Future<String> getCaradd(
    int carId,
    int customerId,
    String phone,
    String reserveTime,
    String address,
    String remark,
  ) async {
    BaseModel res = await apiClient.request(API.order.carAdd, data: {
      'carId': carId,
      'customerId': customerId,
      'phone': phone,
      'reserveTime': reserveTime,
      'address': address,
      'remark': remark
    });
    if (res.data! == null) return '';
    return (res.data! as String).toString();
  }

  //交车
  static Future<String> getCarfinal(int orderId) async {
    BaseModel res = await apiClient.request(API.order.carFinal, data: {
      'orderId': orderId,
    });
    if (res.data! == null) return '';
    return (res.data! as String).toString();
  }

  //组织架构
  static Future<List<StoreallModel>> getStoreall() async {
    BaseListModel res =
        await apiClient.requestList(API.storemanagement.storeAll, data: {});

    if (res.data!.list == null) return [];
    return (res.data!.list!).map((e) => StoreallModel.fromJson(e)).toList();
  }

  //全部角色
  static Future<List<RoleallModel>> getRoleall() async {
    BaseListModel res =
        await apiClient.requestList(API.storemanagement.roleAll, data: {});
    if (res.data!.list == null) return [];
    return (res.data!.list!).map((e) => RoleallModel.fromJson(e)).toList();
  }

  //门店筛选
  static Future<List<StoreselectMoedl>> getStoreselect() async {
    BaseListModel res =
        await apiClient.requestList(API.storemanagement.storeSelect, data: {});
    if (res.data!.list == null) return [];
    return (res.data!.list!).map((e) => StoreselectMoedl.fromJson(e)).toList();
  }

  //添加门店
  static Future<String> getStoreadd(
    String name,
    String address,
  ) async {
    BaseModel res =
        await apiClient.request(API.storemanagement.storeAdd, data: {
      'name': name,
      'address': address,
    });
    if (res.data! == null) return '';
    return (res.data! as String).toString();
  }

  //添加员工
  static Future<String> getStaffadd(
    String name,
    int gender,
    String phone,
    int storeId,
    int roleId,
    String commission,
  ) async {
    BaseModel res =
        await apiClient.request(API.storemanagement.staffAdd, data: {
      'name': name,
      'gender': gender,
      'phone': phone,
      'storeId': storeId,
      'roleId': roleId,
      'commission': commission
    });
    if (res.data! == null) return '';
    return (res.data! as String).toString();
  }
}
