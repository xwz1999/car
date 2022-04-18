part of 'api.dart';

class _UserApi {
  _Wallet wallet = _Wallet();
}

class _Wallet {
///获取剩余评估次数
  String get assessCount => '/user/wallet/assess/count';
}
