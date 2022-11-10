import 'package:cloud_car/model/car/car_amount_model.dart';
import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/model/customer/customer_list_model.dart';

class InitiateContractModel{
  CarAmountModel? carAmountModel;
  CustomerListModel? customerModel;///客户
  String? phone;///手机号
  String? name;///姓名
  String? cardNo;///身份证号
  String? origin;///客户来源
  String? address;///地址
  String? location;///所在地
  String? payer;///付款人
  String? bank;///开户行
  String? bankCard;///银行卡号
  String? remarks;///备注

  CarListModel? carModel;///车辆信息


  InitiateContractModel({
    this.carAmountModel,

    this.customerModel,
    this.phone,
    this.name,
    this.cardNo,
    this.origin,
    this.address,
    this.location,
    this.payer,
    this.bank,
    this.bankCard,
    this.remarks,
    this.carModel,
  });


}