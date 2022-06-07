///性别
enum Gender1 {
  unknown(0, '未知'),
  male(1, '男'),
  female(2, '女');

  final int typeNum;
  final String typeStr;

  static Gender1 getValue(int value) =>
      Gender1.values.firstWhere((element) => element.typeNum == value);

  const Gender1(this.typeNum, this.typeStr);
}



///权限描述
enum Role {
  sales(1, '销售员', '能够查看全店的车，并进行客户跟进、销售下'),
  appraiser(2, '评估师/车务', '负责录入车辆信息、编辑店里的车辆'),
  salesTraffic(3, '销售员/车务', '可以录入车辆信息、编辑车辆，并进行客户跟进'),
  manager(4, '店长', '能够管理店内的客户、车辆、订单');

  final int num;
  final String typeStr;
  final String typeText;

  static Role getValue(String value) =>
      Role.values.firstWhere((element) => element.typeStr == value);

  static Role getValueN(int value) =>
      Role.values.firstWhere((element) => element.num == value);

  const Role(this.num, this.typeStr, this.typeText);
}
