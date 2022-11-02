import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/split_account/broker_all_model.dart';
import 'package:cloud_car/model/split_account/broker_model.dart';
import 'package:cloud_car/model/split_account/business_all_model.dart';
import 'package:cloud_car/model/split_account/common_contact_model.dart';
import 'package:cloud_car/model/user/roleall_model.dart';
import 'package:cloud_car/model/user/staff_all_model.dart';
import 'package:cloud_car/model/user/staff_info_model.dart';
import 'package:cloud_car/model/user/storeall_model.dart';
import 'package:cloud_car/model/user/storeselect_moedl.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/net_work/inner_model/base_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';

class SplitFunc {


  ///获取常用联系人列表
  static Future<List<CommonContactModel>> getCommonContact() async {
    var res =
        await apiClient.request(API.split.contactAll,data: {});

    if (res.data==null) return [];
    return (res.data as List).map((e) => CommonContactModel.fromJson(e)).toList();
  }


  ///添加到常用联系人，已添加的话就是取消
  static Future<bool> addCommonContact(
      List<int> id,
      ) async {
    BaseModel res =
    await apiClient.request(API.split.updateContact, data: {
      'brokerIds': id,
    });
    if (res.code == 0) {
      return true;
    } else {
      CloudToast.show(res.msg);
      return false;
    }
  }


  static Future<BrokerModel?> searchBrokerAll(Map params) async {
    var res =
    await apiClient.request(API.user.searchBroker, data: params);

    if (res.data==null) return null;
    return  BrokerModel.fromJson(res.data);
  }







}
