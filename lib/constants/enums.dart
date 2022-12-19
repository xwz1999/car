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
  settlers(11, '入驻商', '入驻商拥有人'),
  salesTraffic(3, '经纪人', '参与平台卖车'),
  carService(2, '车务', '可以录入车辆信息、编辑车辆，并进行客户跟进'),
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
  noData(0,''),

  individual(1, '个人直卖'),
  carDealer(2, '公司收购');

  final int typeNum;
  final String typeStr;

  static CarSource getValue(int value) =>
      CarSource.values.firstWhere((element) => element.typeNum == value);

  static CarSource getValueByBusinessId(int businessId) {
    switch (businessId) {
      case 0:
        return CarSource.noData;
      case 1:
        return CarSource.carDealer;
      case 2:
        return CarSource.individual;
      default:
        return CarSource.noData;
    }
  }

  const CarSource(this.typeNum, this.typeStr);
}

enum CarType{
  noData(0,''),
  middleGauge(1, '二手车(中规)'),
  parallelImport(2, '二手车(平行进口)'),
  handcart(3,'一手车'),
  gauge(4,'新车(中规)'),
  parallelImportNew(5,'新车(平行进口)')
  ///新车(中规)
  ///新车(平行进口)

  ;

  final int typeNum;
  final String typeStr;

  static CarType getValue(int value) =>
      CarType.values.firstWhere((element) => element.typeNum == value);

  const CarType(this.typeNum, this.typeStr);
}

enum CarStockStatus{
  noData(0,''),
  goOut(1, '外出'),
  inTheHall(2, '在厅'),
  handcart(3,'收购');

  final int typeNum;
  final String typeStr;

  static CarStockStatus getValue(int value) =>
      CarStockStatus.values.firstWhere((element) => element.typeNum == value);

  const CarStockStatus(this.typeNum, this.typeStr);
}

enum CarNatureOfUse{
  noData(0,''),
  familyCar(1, '非运营'),
  officialCar(2, '运营'),
  taxi(3,'营转非'),
  lease(4,'租赁营运'),
  other(4, '租赁非营运');
  static CarNatureOfUse getValue(int value) =>
      CarNatureOfUse.values.firstWhere((element) => element.typeNum == value);
  final int typeNum;
  final String typeStr;
  const CarNatureOfUse(this.typeNum, this.typeStr);
}


enum CarPurchaseType{
  noData(0,''),
  acquisition(1, '收购'),
  consignment(2, '寄卖'),
  cooperation(3, '合作');

  static CarPurchaseType getValue(int value) =>
      CarPurchaseType.values.firstWhere((element) => element.typeNum == value);
  final int typeNum;
  final String typeStr;
  const CarPurchaseType(this.typeNum, this.typeStr);
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
  unKnown(0, '-'),
  aliPay(1, '支付宝'),
  wxPay(2, '微信支付'),
  wxApp(3, '微信小程序');

  final int typeNum;
  final String typeStr;

  static PayType getValue(int value) =>
      PayType.values.firstWhere((element) => element.typeNum == value);

  const PayType(this.typeNum, this.typeStr);
}

enum PermissionLevel {
  normal(1, '普通用户'),
  independentPartner(2, '独立合伙人'),
  settledMerchants(3, '入驻商');///门店员工状态

  final int typeNum;
  final String typeStr;

  static PermissionLevel getValue(int value) =>
      PermissionLevel.values.firstWhere((element) => element.typeNum == value);

  const PermissionLevel(this.typeNum, this.typeStr);
}
///出售合同
///支付方式
enum SellPayType{
  full(1,'全款'),
  mortgage(2,'按揭');
  final int typeNum;
  final String typeStr;
  static SellPayType getValue(String  value) =>
      SellPayType.values.firstWhere((element) => element.typeStr == value);
  const SellPayType(this.typeNum,this.typeStr);
}
///过户方式
enum TransferType{
  local(1,'本地'),
  nonLocal(2,'外地');
  final int typeNum;
  final String typeStr;
  static TransferType getValue(String  value) =>
      TransferType.values.firstWhere((element) =>  element.typeStr == value);
  const TransferType(this.typeNum,this.typeStr);
}


///居间方信息
  enum Square{
    without(1,'无'),
    cloudCar(2,'云云问车'),
    other(3,'其他');
    final int typeNum;
    final String typeStr;
    static Square getValue(int value) =>
        Square.values.firstWhere((element) => element.typeNum==value);
    const Square(this.typeNum,this.typeStr);
  }
