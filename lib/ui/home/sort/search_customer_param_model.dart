import 'package:cloud_car/ui/home/func/customer_map.dart';
import 'package:cloud_car/ui/home/user_manager/user_manager_page.dart';


class SearchCustomerParamModel {
  String name;


  CustomerClassify customerClassify;

  String isImportant;

  int? get important => CustomerMap.isImportant[isImportant];

  String createdDate;

  String? get createdDateStart {
    if (createdDate.isEmpty) {
      return '';
    } else {
      return CustomerMap.customerTime[createdDate]![0];
    }
  }



  String? get createdDateEnd {
    if (createdDate.isEmpty) {
      return '';
    } else {
      return CustomerMap.customerTime[createdDate]![1];
    }
  }



  String trailDate;



  String? get trailCreatedDateStart {
    if (trailDate.isEmpty) {
      return '';
    } else {
      return CustomerMap.customerTime[trailDate]![0];
    }
  }


  String? get trailCreatedDateEnd {
    if (trailDate.isEmpty) {
      return '';
    } else {
      return CustomerMap.customerTime[trailDate]![1];
    }
  }


  SearchCustomerParamModel({
    this.name = '',
    required this.customerClassify,
    required this.isImportant,
    required this.createdDate,
    required this.trailDate,
  });
}
