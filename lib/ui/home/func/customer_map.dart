import 'package:flustars/flustars.dart';

enum CustomerSort {
  newTrail,
  newRegister,
}

class CustomerMap {
  static Map<CustomerSort, String> customerSortString = {
    CustomerSort.newTrail: '最近跟进',
    CustomerSort.newRegister: '最近注册',
  };

  static Map<String, List<String>> customerTime = {
    '全部': ['', ''],
    '今天': [
      DateUtil.formatDate(DateTime.now(), format: 'yyyy-MM-dd'),
      DateUtil.formatDate(DateTime.now(), format: 'yyyy-MM-dd')
    ],
    '昨天': [
      DateUtil.formatDate(DateTime.now().add(const Duration(days: -1)),
          format: 'yyyy-MM-dd'),
      DateUtil.formatDate(DateTime.now(), format: 'yyyy-MM-dd')
    ],
    '近3天': [
      DateUtil.formatDate(DateTime.now().add(const Duration(days: -3)),
          format: 'yyyy-MM-dd'),
      DateUtil.formatDate(DateTime.now(), format: 'yyyy-MM-dd')
    ],
    '近5天': [
      DateUtil.formatDate(DateTime.now().add(const Duration(days: -5)),
          format: 'yyyy-MM-dd'),
      DateUtil.formatDate(DateTime.now(), format: 'yyyy-MM-dd')
    ],
    '7天以上': [
      DateUtil.formatDate(DateTime.now().add(const Duration(days: -7)),
          format: 'yyyy-MM-dd'),
      ''
    ],
  };

  static Map<String, int> isImportant = {
    '是': 1,
    '否': 2,
  };

  // static Map<String, int> customerStatus = {
  //   '浏览客户': 1,
  //   '意向客户': 2,
  //   '邀请注册': 3,
  //   '成交客户': 4
  // };
  //
  // static Map<int, String> customerStatusByInt = {
  //   1: '浏览客户',
  //   2: '意向客户',
  //   3: '邀请注册',
  //   4: '成交客户'
  // };

  static Map<String, int> orderStatus = {
    '售车订单': 1,
    '个人寄卖': 2,
    '租车订单': 3,
    '叫车订单': 4,
    '车商寄卖': 5
  };
  static Map<int, String> orderStatusByInt = {
    1: '售车订单',
    2: '个人寄卖',
    3: '租车订单',
    4: '叫车订单',
    5: '车商寄卖'
  };
}
