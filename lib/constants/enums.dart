///性别
enum Gender {
  unknown(0, '未知'),
  male(1, '男'),
  female(2, '女');

  final int typeNum;
  final String typeStr;

  static Gender getValue(int value) =>
      Gender.values.firstWhere((element) => element.typeNum == value);

  const Gender(this.typeNum, this.typeStr);
}

///角色分配
enum Role {
  salesTraffic(2, '经纪人', '可以录入车辆信息、编辑车辆，并进行客户跟进'),
  manager(1, '店长', '能够管理店内的客户、车辆、订单'),
  defaultRole(0, '', '');

  final int num;
  final String typeStr;
  final String typeText;

  static Role getValue(String value) =>
      Role.values.firstWhere((element) => element.typeStr == value);

  static Role getValueN(int value) =>
      Role.values.firstWhere((element) => element.num == value);

  const Role(this.num, this.typeStr, this.typeText);
}

///车辆来源
enum CarSource {
  carDealer(1, '车商'),
  individual(2, '个人直卖');

  final int typeNum;
  final String typeStr;

  static CarSource getValue(int value) =>
      CarSource.values.firstWhere((element) => element.typeNum == value);

  static CarSource getValueByBusinessId(int businessId) {
    switch (businessId) {
      case 1:
        return CarSource.carDealer;
      default:
        return CarSource.individual;
    }
  }

  const CarSource(this.typeNum, this.typeStr);
}

/// 所属入驻商
enum BusinessAscription {
  ///云云问车
  yywc,

  /// 一般入驻商
  normal;

  static BusinessAscription getValue(int value) {
    switch (value) {
      case 1:
        return BusinessAscription.yywc;
      default:
        return BusinessAscription.normal;
    }
  }

  const BusinessAscription();
}

enum PayType {
  aliPay(1, '支付宝'),
  wxPay(2, '微信支付'),
  wxApp(3, '微信小程序');

  final int typeNum;
  final String typeStr;

  static PayType getValue(int value) =>
      PayType.values.firstWhere((element) => element.typeNum == value);

  const PayType(this.typeNum, this.typeStr);
}
