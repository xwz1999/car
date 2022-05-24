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

///个人寄卖订单
enum ConsignmentStatus {
  Cancel(0, '交易取消'),
  UnSign(1, '待签订'),
  UnPublish(2, '待发布'),
  Publish(3, '审核中'),
  TheUpper(4, '在售'),
  Sale(5, '出售'),
  Account(6, '已到账'),
  Final(7, '已成交');

  final int num;
  final String str;

  static ConsignmentStatus getStatus(int value) =>
      ConsignmentStatus.values.firstWhere((elment) => elment.num == value);

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

///车商订单状态
enum CarConsignmentStatus {
  Cancel(0, '交易取消'),
  Publish(1, '审核中'),
  TheUpper(2, '在售'),
  Sale(3, '出售'),
  Account(4, '已到账'),
  Final(5, '已成交');

  final int num;
  final String str;

  static CarConsignmentStatus getStatus(int value) =>
      CarConsignmentStatus.values.firstWhere((elment) => elment.num == value);

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

///叫车订单状态
enum OrderCallCarStatus {
  UnPay(1, '待支付'),
  Pay(2, '待交车'),
  Final(3, '已完成'),
  Refund(4, '已退款');

  final int num;
  final String str;

  static OrderCallCarStatus getStatus(int value) =>
      OrderCallCarStatus.values.firstWhere((element) => element.num == value);

  const OrderCallCarStatus(this.num, this.str);
}

///租车订单状态
