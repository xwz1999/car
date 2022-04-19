import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/model/pay/wx_pay_model.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
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
  Future<bool> callAliPay(String order, String apiPath) async {
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
      String _res = result['result'];
      PayModel _model = PayModel.fromJson(jsonDecode(_res));
      bool _confirmResult = await _confirmPayResult(
          apiPath, _model.aliPayTradeAppPayResponse.outTradeNo);
      return _confirmResult;
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

  Future wxPay(WxPayModel payModel, VoidCallback paySuccess,
      VoidCallback? payError) async {
    payWithWeChat(
        appId: 'wx9bc3ffb23a749254',
        partnerId: payModel.partnerId,
        prepayId: payModel.prepayId,
        packageValue: payModel.package,
        nonceStr: payModel.nonceStr,
        timeStamp: int.parse(payModel.timeStamp),
        sign: payModel.sign);
    weChatResponseEventHandler.listen((event) {
      if (kDebugMode) {
        print('errorCode:' +
            event.errCode.toString() +
            'errorStr' +
            event.errStr.toString());
      }
      if (event.errCode == 0) {
        paySuccess();
      } else {
        payError == null
            ? () {
                LoggerData.addData('errorCode:' +
                    event.errCode.toString() +
                    'errorStr' +
                    event.errStr.toString());
                CloudToast.show(event.errStr.toString());
              }
            : payError();
      }
    });
  }
}