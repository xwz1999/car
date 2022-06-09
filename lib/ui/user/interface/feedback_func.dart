import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';

class FeedbackFunc {
  //意见反馈=>提交意见
  static Future<bool> getFeedback(
      String title, String content, String phone, String img) async {
    BaseModel res = await apiClient.request(API.feedback.feedbackSubmit,
        data: {'title': title, 'content': content, 'phone': phone, 'img': img});
    if (res.code == 0) {
      return true;
    } else {
      CloudToast.show(res.msg);
      return false;
    }
  }
}
