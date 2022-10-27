// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_card_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankCardInfoModel _$BankCardInfoModelFromJson(Map<String, dynamic> json) =>
    BankCardInfoModel(
      bankCardNo: json['bankCardNo'] as String,
      bankCardType: json['bankCardType'] as String,
      bankName: json['bankName'] as String,
    );

Map<String, dynamic> _$BankCardInfoModelToJson(BankCardInfoModel instance) =>
    <String, dynamic>{
      'bankCardNo': instance.bankCardNo,
      'bankCardType': instance.bankCardType,
      'bankName': instance.bankName,
    };
