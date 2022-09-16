// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'split_account_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplitAccountInfoModel _$SplitAccountInfoModelFromJson(
        Map<String, dynamic> json) =>
    SplitAccountInfoModel(
      amount: json['amount'] as String,
      billAmount: json['billAmount'] as String,
      saleAmount: json['saleAmount'] as String,
      name: json['name'] as String,
      brokers: (json['brokers'] as List<dynamic>)
          .map((e) => BrokerItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateBills: (json['dateBills'] as List<dynamic>)
          .map((e) => DateBillItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      finish: json['finish'] as bool,
      ownBillAmount: json['ownBillAmount'] as String,
      ownProfit: json['ownProfit'] as String,
      totalProfit: json['totalProfit'] as String,
    );

Map<String, dynamic> _$SplitAccountInfoModelToJson(
        SplitAccountInfoModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'billAmount': instance.billAmount,
      'saleAmount': instance.saleAmount,
      'name': instance.name,
      'brokers': instance.brokers,
      'dateBills': instance.dateBills,
      'finish': instance.finish,
      'ownBillAmount': instance.ownBillAmount,
      'ownProfit': instance.ownProfit,
      'totalProfit': instance.totalProfit,
    };

BrokerItem _$BrokerItemFromJson(Map<String, dynamic> json) => BrokerItem(
      brokerId: json['brokerId'] as int,
      name: json['name'] as String,
      roleId: json['roleId'] as int,
      avatar: json['avatar'] as String,
      proportion: json['proportion'] as String,
      amount: json['amount'] as String,
      billAmount: json['billAmount'] as String,
      profit: json['profit'] as String,
    );

Map<String, dynamic> _$BrokerItemToJson(BrokerItem instance) =>
    <String, dynamic>{
      'brokerId': instance.brokerId,
      'name': instance.name,
      'roleId': instance.roleId,
      'avatar': instance.avatar,
      'proportion': instance.proportion,
      'amount': instance.amount,
      'billAmount': instance.billAmount,
      'profit': instance.profit,
    };

DateBillItem _$DateBillItemFromJson(Map<String, dynamic> json) => DateBillItem(
      date: json['date'] as String,
      bills: (json['bills'] as List<dynamic>)
          .map((e) => BillItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DateBillItemToJson(DateBillItem instance) =>
    <String, dynamic>{
      'date': instance.date,
      'bills': instance.bills,
    };

BillItem _$BillItemFromJson(Map<String, dynamic> json) => BillItem(
      name: json['name'] as String,
      brokerName: json['brokerName'] as String,
      amount: json['amount'] as String,
      symbol: json['symbol'] as bool,
      createAt: json['createAt'] as int,
    );

Map<String, dynamic> _$BillItemToJson(BillItem instance) => <String, dynamic>{
      'name': instance.name,
      'brokerName': instance.brokerName,
      'amount': instance.amount,
      'symbol': instance.symbol,
      'createAt': instance.createAt,
    };
