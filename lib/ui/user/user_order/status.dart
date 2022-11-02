///售车订单状态
enum OrderSaleStatus {
  cancel(0, '交易取消'),
  unSign(1, '待签订'),
  sign(2, '已签订'),
  deposit(3, '待检测'),
  testReport(10, '待检测'),
  uploadTestReport(11, '已检测'),
  downPaymentAudit(20, '支付首付'),
  dowPaymentAdopt(21, '已支付'),
  transfer(30, '待过户'),
  transferFinal(31, '过户完成'),
  balancePaymentAudit(40, '支付尾款'),
  balancePaymentAdopt(41, '支付尾款'),
  orderFinal(50, '交易完成');

  final int num;
  final String str;

  static OrderSaleStatus getStatus(int value) =>
      OrderSaleStatus.values.firstWhere((element) => element.num == value);

  int get progressNum {
    switch (num) {
      case 0:
        return 3;
      case 1:
        return 1;
      case 2:
        return 2;
      case 10:
        return 2;
      case 11:
        return 2;
      case 20:
        return 3;
      case 21:
        return 3;
      case 30:
        return 4;
      case 31:
        return 4;
      case 40:
        return 5;
      case 41:
        return 5;
      case 50:
        return 6;
      default:
        return -1;
    }
  }

  const OrderSaleStatus(this.num, this.str);
}

/// 售车订单筛选状态

enum OrderSaleSearchStatus {
  all(0, '全部'),
  unSign(1, '待签订'),
  sign(2, '已签订'),
  unTest(3, '待检测'),
  downPayment(4, '支付首付'),
  unTransfer(5, '待过户'),
  pay(6, '支付尾款'),
  complete(7, '交易完成'),
  cancel(8, '交易取消');

  final int typeNum;
  final String typeStr;

  static OrderSaleSearchStatus getValue(int value) =>
      OrderSaleSearchStatus.values
          .firstWhere((element) => element.typeNum == value);

  const OrderSaleSearchStatus(this.typeNum, this.typeStr);
}

///个人寄卖订单
enum ConsignmentStatus {
  defaultValue(0,''),
  unSign(1, '待签订'),
  unPublish(2, '待发布'),
  publish(3, '提交审核'),
  theUpper(4, '已上架'),
  sale(5, '已出售'),
  account(6, '已到账'),
  uFinal(7, '已成交'),
  theDown(11, '已下架'),
  cancel(12, '已取消');

  final int num;
  final String str;

  static ConsignmentStatus getStatus(int value) =>
      ConsignmentStatus.values.firstWhere((element) => element.num == value);

  int get progressNum {
    switch (num) {
      case 0:
        return 4;
      case 1:
        return 1;
      case 2:
        return 2;
      case 3:
        return 3;
      case 4:
        return 3;
      case 5:
        return 4;
      case 6:
        return 5;
      case 7:
        return 6;
      default:
        return -1;
    }
  }

  const ConsignmentStatus(this.num, this.str);
}

/// 个人寄卖订单筛选状态
enum ConsignmentSearchStatus {
  all(0, '全部'),
  unSign(1, '待签订'),
  unPublish(2, '待发布'),
  publish(3, '审核中'),
  theUpper(4, '已驳回'),
  sale(5, '在售'),
  account(6, '已售'),
  cancel(7, '交易取消');
  final int typeNum;
  final String typeStr;

  static ConsignmentSearchStatus getValue(int value) =>
      ConsignmentSearchStatus.values
          .firstWhere((element) => element.typeNum == value);

  const ConsignmentSearchStatus(this.typeNum, this.typeStr);
}

///车商订单状态
enum CarConsignmentStatus {
  cancel(0, '交易取消'),
  publish(1, '审核中'),
  theUpper(2, '在售'),
  sale(3, '出售'),
  account(4, '已到账'),
  uFinal(5, '已成交');

  final int num;
  final String str;

  static CarConsignmentStatus getStatus(int value) =>
      CarConsignmentStatus.values.firstWhere((element) => element.num == value);

  int get carProgressNum {
    switch (num) {
      case 0:
        return 4;
      case 3:
        return 1;
      case 4:
        return 2;
      case 5:
        return 3;
      case 6:
        return 4;
      case 7:
        return 5;
      default:
        return -1;
    }
  }

  const CarConsignmentStatus(this.num, this.str);
}

///车商订单筛选状态
enum CarConsignmentSearchStatus {
  all(0, '全部'),
  publish(1, '审核中'),
  theUpper(2, '在售'),
  sale(3, '出售'),
  account(4, '已到账'),
  uFinal(5, '已成交'),
  cancel(6, '交易取消');

  final int num;
  final String str;

  static CarConsignmentSearchStatus getStatus(int value) =>
      CarConsignmentSearchStatus.values
          .firstWhere((element) => element.num == value);

  const CarConsignmentSearchStatus(this.num, this.str);
}

///叫车订单状态
enum CallCarStatus {
  unPaid(1, '待付款'),
  unComplete(2, '付款成功'),
  complete(3, '交车完成'),
  refundAudit(4, '申请退款'),
  refund(5, '已退款'),
  reject(6, '退款驳回');

  final int typeNum;
  final String typeStr;

  static CallCarStatus getValue(int value) =>
      CallCarStatus.values.firstWhere((element) => element.typeNum == value);

  const CallCarStatus(this.typeNum, this.typeStr);
}

///叫车订单筛选状态
enum CallCarSearchStatus {
  all(0, '全部'),
  unPaid(1, '待支付'),
  unComplete(2, '待交车'),
  complete(3, '已完成'),
  refundAudit(4, '申请退款'),
  refund(5, '已退款'),
  reject(6, '已驳回');

  final int typeNum;
  final String typeStr;

  static CallCarSearchStatus getValue(int value) => CallCarSearchStatus.values
      .firstWhere((element) => element.typeNum == value);

  const CallCarSearchStatus(this.typeNum, this.typeStr);
}

enum OrderType {
  sale(1, '售车订单'),
  personal(2, '个人寄卖'),
  callCar(3, '叫车订单'),
  carDealer(4, '车商寄卖'),
  pushOrder(5, '发布订单');
  final int typeNum;
  final String typeStr;

  static OrderType getValue(int value) =>
      OrderType.values.firstWhere((element) => element.typeNum == value);

  const OrderType(this.typeNum, this.typeStr);
}
