part of 'api.dart';

class _UserApi {
  _Wallet wallet = _Wallet();
  _Ail ail = _Ail();
  _Result result = _Result();
  _Sign sign = _Sign();
  _Pay pay = _Pay();
}

class _Wallet {
  ///获取剩余评估次数
  String get assessCount => '/user/wallet/assess/count';
//钱包充值
  String get assessRecharge => '/user/wallet/assess/recharge';
//评估记录
  String get assessHistory => '/user/wallet/assess/history';
}

//实名认证
class _Ail {
  String get certifyAil => '/user/certify/ali';
}

//获取支付宝实名认证结果
class _Result {
  String get ailResult => '/user/certify/ali/result';
}

//独立合伙人——>签订合同
class _Sign {
  String get contractSign => '/user/partner/contract/sign';
}

//独立合伙人——>支付
class _Pay {
  String get partnerPay => '/user/partner/pay';
}
