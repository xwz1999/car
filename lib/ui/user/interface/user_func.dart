import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/user/History_model.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_list_model.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';

class User {
  ///获取剩余评估次数
  static Future<String> getWallet() async {
    BaseModel res = await apiClient.request(
      API.user.wallet.assessCount,
    );
    if (res.data! == null) return '0';
    return (res.data['count'] as int).toString();
  }

  ///充值
  /// static Future<List<>> getRecharge() async{
  ///   int count;
  ///   int payType
  ///   BaseListModel res=await apiClient.requestList(API.user.recharge.assessRecharge,data:{'count':10,'payType':2}

  ///   );
  ///   if(res.data! == 0) return [];
  /// return res.data!.list!.map((e) => <>.formJson(e)).toList();
  /// }

  ///评估记录
  static Future<List<HistoryModel>> getHistory(
      {required int page, int size = 10}) async {
    BaseListModel res = await apiClient.requestList(
        API.user.wallet.assessHistory,
        data: {'page': page, 'size': size});

    if (res.code == 0) {
      return res.nullSafetyList.map((e) => HistoryModel.fromJson(e)).toList();
    } else {
      CloudToast.show(res.msg);
      return [];
    }
  }

  // ///支付宝实名认证
  // static Future<String> getAil(
  //     String name, String idCard, String idCardFront, String idCardBack) async {
  //   BaseModel res = await apiClient.request(API.user.ail.certifyAil, data: {
  //     'name': name,
  //     'idCard': idCard,
  //     'idCardFront': idCardFront,
  //     'idCardBack': idCardBack,
  //   });
  //   if (res.data! == 0) return '0';
  //   return (res.msg).toString();
  // }
  //
  // ///获取支付宝实名认证结果
  // static Future<String> getResult(
  //   String certifyId,
  // ) async {
  //   BaseModel res = await apiClient
  //       .request(API.user.ail.ailResult, data: {"certifyId": certifyId});
  //   if (res.data! == null) return '1';
  //   return (res.data['success'] as String).toString();
  // }
  //
  // ///独立合伙人签订合同
  // static Future<String> getSign(String sign) async {
  //   BaseModel res = await apiClient
  //       .request(API.user.sign.contractSign, data: {'sign': sign});
  //   if (res.data! == null) return '0';
  //   return (res.data as String).toString();
  // }

  // ///独立合伙人支付
  // static Future<String> getPartnerPay(int orderId, int payType) async {
  //   BaseModel res = await apiClient.request(API.user.sign.partnerPay, data: {
  //     'orderId': orderId,
  //     'payType': payType,
  //   });
  //   if (res.data! == null) return '';
  //   return (res.data as String).toString();
  // }

  ///修改用户信息
  static Future<bool> getUserUpdateGender(int gender) async {
    BaseModel res =
        await apiClient.request(API.user.userUpdate, data: {'gender': gender});
    if (res.code == 0) {
      return true;
    } else {
      CloudToast.show(res.msg);
      return false;
    }
  }

  static Future<bool> getUserUpdateImg(String headImg) async {
    BaseModel res = await apiClient.request(API.user.userUpdate, data: {
      'headImg': headImg,
    });
    if (res.code == 0) {
      return true;
    } else {
      CloudToast.show(res.msg);
      return false;
    }
  }

  static Future<bool> getUserUpdateName(
    String nickname,
  ) async {
    BaseModel res = await apiClient.request(API.user.userUpdate, data: {
      'nickname': nickname,
    });
    if (res.code == 0) {
      return true;
    } else {
      CloudToast.show(res.msg);
      return false;
    }
  }
}
