import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/order/order_dealer_model.dart';
import 'package:cloud_car/model/order/publish_car_model.dart';
import 'package:cloud_car/model/user/lists_model.dart';
import 'package:cloud_car/model/user/salelists_model.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_list_model.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';

class OrderFunc{


  ///独立合伙人签订合同
  static Future<bool> getSign(String sign) async {
    BaseModel res =
    await apiClient.request(API.user.sign.contractSign, data: {'sign': sign});
    if (res.code==0) {
      return true;
    } else{
      CloudToast.show(res.msg);
      return false;
    }

  }

///寄卖订单列表
  static Future<List<ListsModel>> getLists() async {
    BaseListModel baseList =
    await apiClient.requestList(API.order.consignmentLists, data: {});
    if (baseList.code!=0) {
      CloudToast.show(baseList.msg);
      return [];
    }else{
      return baseList.nullSafetyList.map((e) => ListsModel.fromJson(e)).toList();
    }
  }

  ///发布车辆
  static Future<bool> getPublish(PublishCarModel publishCarModel) async {
    Map<String, dynamic> photos = {
      "carPhotos": publishCarModel.photos?.dataPhotos,
      "interiorPhotos": publishCarModel.photos?.interiorPhotos,
      "defectPhotos": publishCarModel.photos?.defectPhotos,
      "dataPhotos": publishCarModel.photos?.dataPhotos,
    };
    Map<String, dynamic> baseInfo = {
      "type": publishCarModel.baseInfo?.type,
      "interiorColor": publishCarModel.baseInfo?.interiorColor,
      "displacement": publishCarModel.baseInfo?.displacement,
      "gearbox": publishCarModel.baseInfo?.gearbox,
      "emissionStandard": publishCarModel.baseInfo?.emissionStandard,
      "useCharacter": publishCarModel.baseInfo?.useCharacter,
      "location": publishCarModel.baseInfo?.location,
      "attribution": publishCarModel.baseInfo?.attribution,
      "conditionIn": publishCarModel.baseInfo?.conditionIn,
      "conditionOut": publishCarModel.baseInfo?.conditionOut,
    };
    Map<String, dynamic> report = {
      "paints": publishCarModel.report?.paints,
    };
    BaseModel model = await apiClient
        .request(API.order.consignmentPublish, data: {
      'orderId':publishCarModel.orderId,
      'photos':photos,
      'baseInfo':baseInfo,
      'report':report
    });
    if (model.code==0) {
      return true;
    } else{
      CloudToast.show(model.msg);
      return false;
    }
  }


  ///添加车商寄卖订单
  static Future<bool> addDealerOrder(OrderDealerModel orderDealerModel) async {
    Map<String, dynamic> photos = {
      "carPhotos": orderDealerModel.photos?.dataPhotos,
      "interiorPhotos": orderDealerModel.photos?.interiorPhotos,
      "defectPhotos": orderDealerModel.photos?.defectPhotos,
      "dataPhotos": orderDealerModel.photos?.dataPhotos,
    };
    Map<String, dynamic> baseInfo = {
      "type": orderDealerModel.baseInfo?.type,
      "interiorColor": orderDealerModel.baseInfo?.interiorColor,
      "displacement": orderDealerModel.baseInfo?.displacement,
      "gearbox": orderDealerModel.baseInfo?.gearbox,
      "emissionStandard": orderDealerModel.baseInfo?.emissionStandard,
      "useCharacter": orderDealerModel.baseInfo?.useCharacter,
      "location": orderDealerModel.baseInfo?.location,
      "attribution": orderDealerModel.baseInfo?.attribution,
      "conditionIn": orderDealerModel.baseInfo?.conditionIn,
      "conditionOut": orderDealerModel.baseInfo?.conditionOut,
    };

    Map<String, dynamic> other = {

      "price": orderDealerModel.other?.price,
      "keyCount": orderDealerModel.other?.keyCount,
      "compulsoryInsurance": orderDealerModel.other?.compulsoryInsurance,
      "compulsoryInsuranceDate": orderDealerModel.other?.compulsoryInsuranceDate,
      "commercialInsurance": orderDealerModel.other?.commercialInsurance,
      "commercialInsuranceDate": orderDealerModel.other?.commercialInsuranceDate,
      "commercialInsurancePrice": orderDealerModel.other?.commercialInsurancePrice,
    };

    Map<String, dynamic> report = {
      "paints": orderDealerModel.report?.paints,
    };
    BaseModel model = await apiClient
        .request(API.order.consignmentPublish, data: {
      'priceId':orderDealerModel.priceId,
      'photos':photos,
      'baseInfo':baseInfo,
      'report':report,
      'other':other
    });
    if (model.code==0) {
      return true;
    } else{
      CloudToast.show(model.msg);
      return false;
    }
  }


  ///邀约
  static Future<bool> getAdd(
      int customerId,
      int carId,
      String inviteAt,
      String address,
      String remark,
      ) async {
    BaseModel res = await apiClient.request(API.order.inviteAdd, data: {
      'customerId': customerId,
      'carId': carId,
      'inviteAt': inviteAt,
      'address': address,
      'remark': remark,
    });
    if (res.code==0) {
      return true;
    } else{
      CloudToast.show(res.msg);
      return false;
    }

  }

  ///售车订单列表
  static Future<List<SalelistsModel>> getSaleList() async {
    BaseListModel baseList =
    await apiClient.requestList(API.order.saleLists.saleLists, data: {});
    if (baseList.code!=0) {
      CloudToast.show(baseList.msg);
      return [];
    }else{
      return baseList.nullSafetyList.map((e) => SalelistsModel.fromJson(e)).toList();
    }
  }

  //上传检车报告
  static Future<bool> getTestrepord(
      int orderId,
      String report,
      ) async {
    BaseModel res = await apiClient.request(API.order.saleTestrepord, data: {
      'orderId': orderId,
      'report': report,
    });
    if (res.code==0) {
      return true;
    } else{
      CloudToast.show(res.msg);
      return false;
    }

  }

  ///过户
  static Future<bool> getTransfer(
      int orderId,
      String certificate,
      String vehicleLicence,
      String invoice,
      String guaranteeSlip,
      num commercialInsurancePrice,
      ) async {
    BaseModel res = await apiClient.request(API.order.scaleTransfer, data: {
      'orderId': orderId,
      'certificate': certificate,
      'vehicleLicense': vehicleLicence,
      'invoice': invoice,
      'guaranteeSlip': guaranteeSlip,
      'commercialInsurancePrice': commercialInsurancePrice
    });
    if (res.code==0) {
      return true;
    } else{
      CloudToast.show(res.msg);
      return false;
    }

  }

  ///完结订单
  static Future<bool> getFinal(int orderId) async {
    BaseModel res = await apiClient.request(API.order.saleFinal, data: {
      'orderId': orderId,
    });
    if (res.code==0) {
      return true;
    } else{
      CloudToast.show(res.msg);
      return false;
    }

  }

  ///叫车订单->添加叫车订单
  static Future<bool> getCaradd(
      int carId,
      int customerId,
      String phone,
      String reserveTime,
      String address,
      String remark,
      ) async {
    BaseModel res = await apiClient.request(API.order.carAdd, data: {
      'carId': carId,
      'customerId': customerId,
      'phone': phone,
      'reserveTime': reserveTime,
      'address': address,
      'remark': remark
    });
    if (res.code==0) {
      return true;
    } else{
      CloudToast.show(res.msg);
      return false;
    }

  }

  ///交车
  static Future<bool> getCarfinal(int orderId) async {
    BaseModel res = await apiClient.request(API.order.carFinal, data: {
      'orderId': orderId,
    });
    if (res.code==0) {
      return true;
    } else{
      CloudToast.show(res.msg);
      return false;
    }

  }


}