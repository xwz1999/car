import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';

class Feedback {
  //意见反馈=》提交意见
  static Future<bool> getfeedback() async {
    BaseModel res =
        await apiClient.request(API.feedback.feedbackSubmit, data: {});
    if (res.code == 0) {
      return true;
    } else {
      CloudToast.show(res.msg);
      return false;
    }
  }
}
