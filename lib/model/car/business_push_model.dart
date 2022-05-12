

class BusinessPushModel{
   int? priceId;
   int? dealerId;
   CarOtherInfo other;

   BusinessPushModel({
    this.priceId,
    this.dealerId,
    required this.other,
  });
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
   int? compulsoryInsurance;
   String? compulsoryInsuranceDate;
   int? commercialInsurance;
   String? commercialInsuranceDate;
   String? commercialInsurancePrice;

   CarOtherInfo({
    this.price = 0,
    this.keyCount=0,
    this.compulsoryInsurance = 0,
    this.compulsoryInsuranceDate='',
    this.commercialInsurance = 0,
    this.commercialInsuranceDate='',
    this.commercialInsurancePrice='',
  });
}