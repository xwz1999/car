
import 'package:cloud_car/model/order/publish_car_model.dart';



///添加车商寄卖订单接口
class OrderDealerModel {
  int? priceId;
  int? dealerId;
  Photos? photos;
  BaseInfo? baseInfo;
  Report? report;
  Other? other;

  OrderDealerModel(
      {this.priceId,
        this.dealerId,
        this.photos,
        this.baseInfo,
        this.report,
        this.other});




}






class Other {
  int? price;
  int? keyCount;
  int? compulsoryInsurance;
  String? compulsoryInsuranceDate;
  int? commercialInsurance;
  String? commercialInsuranceDate;
  String? commercialInsurancePrice;

  Other(
      {this.price,
        this.keyCount,
        this.compulsoryInsurance,
        this.compulsoryInsuranceDate,
        this.commercialInsurance,
        this.commercialInsuranceDate,
        this.commercialInsurancePrice});

}