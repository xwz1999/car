

class BusinessPushModel{
   int? priceId;
   int? dealerId;
   String? dealerName;
   CarOtherInfo other;  

   BusinessPushModel({
    this.priceId,
    this.dealerId,
     this.dealerName,
    required this.other,
  });


   static BusinessPushModel get init => BusinessPushModel(other: CarOtherInfo()
      );
}


class CarOtherInfo{
   // "price": 200000,
   // "keyCount": 2,
   // "compulsoryInsurance": 1,
   // "compulsoryInsuranceDate": "2022-09-09",
   // "commercialInsurance": 1,
   // "commercialInsuranceDate": "2022-09-09",
   // "commercialInsurancePrice": "5432.43"


   num? price;
   int? keyCount;
   ///接口暂时没有该字段
   int? transferNum;
   int? compulsoryInsurance;
   String? compulsoryInsuranceDate;
   int? commercialInsurance;
   String? commercialInsuranceDate;
   String? commercialInsurancePrice;

   CarOtherInfo({
    this.price ,
    this.keyCount,
    this.compulsoryInsurance = -1,
    this.compulsoryInsuranceDate='',
    this.commercialInsurance = -1,
     this.transferNum ,
    this.commercialInsuranceDate='',
    this.commercialInsurancePrice='',
  });



}