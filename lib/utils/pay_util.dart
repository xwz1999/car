import 'dart:async';
import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/model/pay/wx_pay_model.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluwx/fluwx.dart';
import 'package:power_logger/power_logger.dart';
import 'package:tobias/tobias.dart';

import '../model/pay/pay_model.dart';

enum PAYTYPE {
  ///支付宝
  ali,

  ///微信
  wx,

  ///现金
  cash,

  ///pos
  pos
}

class PayUtil {
  static final PayUtil _instance = PayUtil._();

  factory PayUtil() => _instance;

  PayUtil._();

  void resultSatus(String status) {
    switch (status) {
      case '8000':
        BotToast.showText(text: '正在处理中');
        break;
      case '4000':
        BotToast.showText(text: '订单支付失败');
        break;
      case '5000':
        BotToast.showText(text: '重复请求');
        break;
      case '6001':
        BotToast.showText(text: '	用户中途取消');
        break;
      case '6002':
        BotToast.showText(text: '网络连接出错');
        break;
      case '6004':
        BotToast.showText(text: '支付结果未知,请查询商户订单列表中订单的支付状态');
        break;
      default:
        BotToast.showText(text: '其他支付错误');
        break;
    }
  }

  String _resultStatus = '';

  ///支付宝支付
  ///传入订单信息和确认订单请求地址
  Future<bool> callAliPay(String order, {String? apiPath}) async {
    var install = await isAliPayInstalled();
    if (!install) {
      BotToast.showText(text: '未安装支付宝！');
      return false;
    }
    Map<dynamic, dynamic> result = {};
    try {
      result = await aliPay(order);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    _resultStatus = result['resultStatus'];
    if (_resultStatus == '9000') {
      String res = result['result'];
      PayModel model = PayModel.fromJson(jsonDecode(res));
      if (apiPath != null) {
        bool confirmResult = await _confirmPayResult(
            apiPath, model.aliPayTradeAppPayResponse.outTradeNo);
        return confirmResult;
      } else {
        CloudToast.show('支付成功');
        return true;
      }
    } else {
      resultSatus(_resultStatus);
      return false;
    }
  }

  Future<bool> _confirmPayResult(String path, String code) async {
    try {
      int status = 0;
      for (var i = 0; i < 3; i++) {
        await Future.delayed(const Duration(milliseconds: 1000), () async {
          Response response = await apiClient.dio.get(path, queryParameters: {
            "code": code,
          });
          status = response.data['status'] as int;
        });
        if (status == 2) {
          break;
        }
      }
      if (status == 2) {
        BotToast.showText(text: '交易成功');
        return true;
      } else {
        BotToast.showText(text: '交易失败 错误码$status');
        return false;
      }
    } catch (e) {
      BotToast.showText(text: '网络请求错误');
      LoggerData.addData(e);
      return false;
    }
  }

  ///微信支付

  StreamSubscription? _wxPayStream;

  void wxPayAddListener(
      {required VoidCallback paySuccess,
      Function(BaseWeChatResponse)? payError}) {
    _wxPayStream = weChatResponseEventHandler.listen((event) {
      if (kDebugMode) {
        print('errorCode:${event.errCode}    errorStr:${event.errStr}');
      }
      if (event.errCode == 0) {
        paySuccess();
      } else {
        LoggerData.addData(
            'errorCode:${event.errCode}    errorStr:${event.errStr ?? '支付失败'}');
        CloudToast.show(event.errStr ?? '支付失败');
        if (payError != null) payError(event);
        //payError == null ? null : payError(event);
      }
    });
  }

  void removeWxPayListener() {
    _wxPayStream?.cancel();
  }

  Future callWxPay({
    required WxPayModel payModel,
  }) async {
    await payWithWeChat(
        appId: 'wx9bc3ffb23a749254',
        partnerId: payModel.partnerId,
        prepayId: payModel.prepayId,
        packageValue: payModel.package,
        nonceStr: payModel.nonceStr,
        timeStamp: int.parse(payModel.timeStamp),
        sign: payModel.sign);
  }
}
