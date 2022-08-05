// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayModel _$PayModelFromJson(Map<String, dynamic> json) => PayModel(
      aliPayTradeAppPayResponse: AliPayTradeAppPayResponse.fromJson(
          json['alipay_trade_app_pay_response'] as Map<String, dynamic>),
      sign: json['sign'] as String,
      signType: json['sign_type'] as String,
    );

Map<String, dynamic> _$PayModelToJson(PayModel instance) => <String, dynamic>{
      'alipay_trade_app_pay_response': instance.aliPayTradeAppPayResponse,
      'sign': instance.sign,
      'sign_type': instance.signType,
    };

AliPayTradeAppPayResponse _$AliPayTradeAppPayResponseFromJson(
        Map<String, dynamic> json) =>
    AliPayTradeAppPayResponse(
      code: json['code'] as String,
      msg: json['msg'] as String,
      appId: json['app_id'] as String,
      outTradeNo: json['out_trade_no'] as String,
      tradeNo: json['trade_no'] as String,
      totalAmount: json['total_amount'] as String,
      sellerId: json['seller_id'] as String,
      charset: json['charset'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$AliPayTradeAppPayResponseToJson(
        AliPayTradeAppPayResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'app_id': instance.appId,
      'out_trade_no': instance.outTradeNo,
      'trade_no': instance.tradeNo,
      'total_amount': instance.totalAmount,
      'seller_id': instance.sellerId,
      'charset': instance.charset,
      'timestamp': instance.timestamp,
    };
