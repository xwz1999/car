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
  salesTraffic(2, '车务', '可以录入车辆信息、编辑车辆，并进行客户跟进'),
  manager(1, '店长', '能够管理店内的客户、车辆、订单');

  final int num;
  final String typeStr;
  final String typeText;

  static Role getValue(String value) =>
      Role.values.firstWhere((element) => element.typeStr == value);

  static Role getValueN(int value) =>
      Role.values.firstWhere((element) => element.num == value);

  const Role(this.num, this.typeStr, this.typeText);
}
