import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/message/message_count_model.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier {
  MessageCountModel _unReadMessageCount = MessageCountModel.init;

  MessageCountModel get unReadMesCount => _unReadMessageCount;

  Future init() async {
    var res = await apiClient.request(API.message.unReadMessage);
    if (res.code == 0) {
      _unReadMessageCount = MessageCountModel.fromJson(res.data);
      notifyListeners();
    }
  }
}
