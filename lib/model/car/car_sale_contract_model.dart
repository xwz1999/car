

///出售合同上传model
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'car_sale_contract_model.g.dart';



@JsonSerializable()
class CarSaleContractModel extends Equatable{
    int carId;
   int payType;///支付方式1=全款 2=按揭
   int transferType; ///过户方式1=本地 2=外迁
   PriceInfo priceInfo;
   int? customerId;
   int? customerChannel;
   MasterInfo masterInfo;
   ThirdPartInfo thirdPartInfo;
   String remark;
    factory CarSaleContractModel.fromJson(Map<String, dynamic> json) =>_$CarSaleContractModelFromJson(json);


   CarSaleContractModel({
    required this.carId,
     required this.payType,
    required this.transferType,
    required this.priceInfo,
    required this.customerId,
    required this.masterInfo,
    required this.thirdPartInfo,
    required this.remark,
     required this.customerChannel,
  });
  @override
  List<Object?> get props => [carId,payType,transferType,priceInfo,customerId,masterInfo,thirdPartInfo,remark,customerChannel];
}

@JsonSerializable()
class PriceInfo{
  String dealPrice;
  String deposit;
  String downPayment;
  factory PriceInfo.fromJson(Map<String, dynamic> json) =>_$PriceInfoFromJson(json);

  PriceInfo({
    required this.dealPrice,
    required this.deposit,
    required this.downPayment,
  });
  List<Object?> get props => [dealPrice,deposit,downPayment];
}


@JsonSerializable()
class MasterInfo{
String name;
String phone;
String idCard;
String address;
String bank;
String bankCard;
String bankAccount;
factory MasterInfo.fromJson(Map<String, dynamic> json) =>_$MasterInfoFromJson(json);
MasterInfo({
  required this.name,
  required this.phone,
  required this.idCard,
  required this.address,
  required this.bank,
  required this.bankCard,
  required this.bankAccount,
  
});
List<Object?> get props => [name,phone,idCard,address,bank,bankCard,bankAccount];
}
@JsonSerializable()
class ThirdPartInfo{
  int kind;
  int storeId;
  String saleServiceFeeRate;
  String purchaseServiceFeeRate;
  factory ThirdPartInfo.fromJson(Map<String, dynamic> json) =>_$ThirdPartInfoFromJson(json);

  ThirdPartInfo({
    required this.kind,
    required this.storeId,
    required this.saleServiceFeeRate,
    required this.purchaseServiceFeeRate,
  });

List<Object?> get props => [kind,storeId,saleServiceFeeRate,];
}
// class CarSaleContractModel{
//   int? carId;
//   int? payType;  ///支付方式  1：全款2：按揭
//   int? transferType; ///过户方式 1：本地 2：外迁
//   PriceInfo priceInfo;
//   int? customerId;
//
//   String? phone;
//   String? name;
//   String? address;
//   String? idCard;
//   String? openBank;
//   String? bankCard;
//   String? remark;
//
//   CarSaleContractModel({
//     this.carId,
//     this.customerId,
//     this.phone,
//     this.name,
//     this.address,
//     this.idCard,
//     this.openBank,
//     this.bankCard,
//     this.remark,
//   });
//
// }
// class PriceInfo{
//   String dealPrice;
//   String deposit;
//   String downPayment;
//
//   PriceInfo({
//     required this.deposit,
//     required this.downPayment,
//     required this.dealPrice,
// })
// }

