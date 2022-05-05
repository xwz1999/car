import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/task/task_invite_list_model.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_list_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';

class TaskFunc {
  ///获取客户邀约列表
  static Future<List<TaskInviteListModel>> getCarList(int page) async {
    BaseListModel baseList = await apiClient
        .requestList(API.task.getInviteLists, data: {'page': page, 'size': 10});
    if (baseList.code != 0) {
      CloudToast.show(baseList.msg);
      return [];
    } else {
      return baseList.nullSafetyList
          .map((e) => TaskInviteListModel.fromJson(e))
          .toList();
    }
  }
}
