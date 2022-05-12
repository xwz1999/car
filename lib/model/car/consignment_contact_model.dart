import 'dart:io';

import 'package:cloud_car/ui/home/car_manager/publish_car/push_car_page.dart';

///寄卖合同上传model
class ConsignmentContractModel {
  int? priceId;
  int? customerId;
  String? customerName;
  String? evaluationPrice;
  String? sellPrice;
  MasterInfo masterInfo;
  int? keyCount;
  int? transferNum;///过户次数


  bool? get compulsory=> compulsoryInsurance==1;

  int? compulsoryInsurance;///1有
  String? compulsoryInsuranceDate;
  int? commercialInsurance;///1有
  String? commercialInsuranceDate;
  String? commercialInsurancePrice;
  String? exterior;
  String? interiorTrim;
  String? workingCondition;
  String? serviceFeeRate;
  PublishCarInfo? publishCarInfo;
  List<File>? idFront;
  List<File>? idBack;
  List<File>? bust;



  ConsignmentContractModel(
      {this.priceId,
      this.customerId,
        this.transferNum,
      this.customerName = '',
      this.evaluationPrice,
      this.sellPrice = '',
      required this.masterInfo,
      this.keyCount,
      this.compulsoryInsurance,
      this.compulsoryInsuranceDate='',
      this.commercialInsurance,
      this.commercialInsuranceDate='',
      this.commercialInsurancePrice,
      this.exterior,
      this.interiorTrim,
      this.workingCondition,
      this.serviceFeeRate,
      this.publishCarInfo,
      this.bust,
      this.idBack,
      this.idFront});
}

class MasterInfo {
  String? name;
  String? idCard;
  String? phone;
  String? bankCard;
  String? bank;
  String? idCardFront;
  String? idCardBack;
  String? photo;

  MasterInfo(
      {this.name = '',
      this.idCard ='',
      this.phone='',
      this.bankCard='',
      this.bank='',
      this.idCardFront='',
      this.idCardBack='',
      this.photo=''});
}
