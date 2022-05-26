import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/user/staffinfo_model.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:flutter/material.dart';

class EmployeesProvider extends ChangeNotifier {
  late StaffinfoModel _staffInfo;

  Future updateEmployees() async {
    var base = await apiClient.request(API.storeManagement.staffInfo);
    if (base.code == 0) {
      _staffInfo = StaffinfoModel.fromJson(base.data);
    } else {
      CloudToast.show(base.msg);
      _staffInfo = StaffinfoModel.init;
    }
    notifyListeners();
  }
}
