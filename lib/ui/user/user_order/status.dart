///售车订单状态
enum OrderSaleStatus {
  cancel(0, '订单取消'),
  unSign(1, '待签订'),
  sign(2, '已签订'),
  deposit(3, '待检测'),
  testReport(10, '待检测'),
  uploadTestReport(11, '已检测'),
  downPaymentAudit(20, '支付首付'),
  dowPaymentAdopt(21, '已支付'),
  transfer(30, '过户'),
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
