

///寄卖合同上传model
class ConsignmentContractModel{
  int? priceId;
  int? customerId;
  String? price;
  MasterInfo? masterInfo;
  int? keyCount;
  int? compulsoryInsurance;
  String? compulsoryInsuranceDate;
  int? commercialInsurance;
  String? commercialInsuranceDate;
  String? commercialInsurancePrice;
  String? exterior;
  String? interiorTrim;
  String? workingCondition;
  String? serviceFeeRate;

  ConsignmentContractModel(
      {this.priceId,
        this.customerId,
        this.price,
        this.masterInfo,
        this.keyCount,
        this.compulsoryInsurance,
        this.compulsoryInsuranceDate,
        this.commercialInsurance,
        this.commercialInsuranceDate,
        this.commercialInsurancePrice,
        this.exterior,
        this.interiorTrim,
        this.workingCondition,
        this.serviceFeeRate});


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
      {this.name,
        this.idCard,
        this.phone,
        this.bankCard,
        this.bank,
        this.idCardFront,
        this.idCardBack,
        this.photo});

}