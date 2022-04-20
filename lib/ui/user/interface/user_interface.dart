import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/user/History_model.dart';
import 'package:cloud_car/model/user/lists_model.dart';
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
  static Future<String> getAil() async {
    BaseModel res = await apiClient.request(API.user.ail.certifyAil, data: {
      'name': '张三',
      'idCard': '350781196403073305',
      'idCardFront': 'sadf/asdf/asdfadsf',
      'idCardBack': 'sadf/asdf/asdfadsf',
    });
    if (res.data! == 0) return '0';
    return (res.msg).toString();
  }

//获取支付宝实名认证结果
  static Future<String> getResult() async {
    BaseModel res = await apiClient.request(API.user.result.ailResult,
        data: {"certifyId": '9681f533f332456ff0a22f359abea459'});
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
        await apiClient.requestList(API.order.lists.consignmentLists, data: {});
    if (res.data!.list! == null) return [];
    return (res.data!.list!).map((e) => ListsModel.fromJson(e)).toList();
  }
}
