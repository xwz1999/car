import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/car/business_push_model.dart';
import 'package:cloud_car/model/car/car_amount_model.dart';
import 'package:cloud_car/model/car/car_distinguish_model.dart';
import 'package:cloud_car/model/car/car_evaluation_model.dart';
import 'package:cloud_car/model/car/car_info_model.dart';
import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/model/car/car_photo_model.dart';
import 'package:cloud_car/model/car/car_sale_contract_model.dart';
import 'package:cloud_car/model/car/car_statistics_model.dart';
import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/model/car/estimate_price_model.dart';
import 'package:cloud_car/model/contract/consignment_list_model.dart';
import 'package:cloud_car/model/sort/sort_brand_model.dart';
import 'package:cloud_car/ui/home/car_valuation/car_valuation_page.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/net_work/inner_model/base_list_model.dart';
import 'package:cloud_car/utils/net_work/inner_model/base_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:flustars/flustars.dart';

import '../../../model/car/dealer_list_model.dart';

class CarFunc {
  ///获取⻋辆品牌
  static Future<List<SortBrandModel>> getBrandList() async {
    BaseListModel baseList = await apiClient.requestList(
      API.car.getCarBrand,
    );
    if (baseList.code != 0) {
      CloudToast.show(baseList.msg);
      return [];
    } else {
      return baseList.nullSafetyList
          .map((e) => SortBrandModel.fromJson(e))
          .toList();
    }
  }

  ///⾏驶证 识别
  static Future<CarDistinguishModel?> carDistinguish(String path) async {
    BaseModel model = await apiClient.request(API.car.getCarVehicle, data: {
      "path": path,
    });
    if (model.code == 0) {
      return CarDistinguishModel.fromJson(model.data);
    } else {
      CloudToast.show(model.msg);
      return null;
    }
  }

  ///获取⻋辆列表
  static Future<List<CarListModel>> getCarList(int page, int size,
      {String? order, Map<String, dynamic>? searchParams}) async {
    var data = {
      'page': page,
      'size': size,
      'order': order,
      'search': searchParams
    };
    BaseListModel baseList =
        await apiClient.requestList(API.car.getCarLists, data: data);
    if (baseList.code != 0) {
      CloudToast.show(baseList.msg);
      return [];
    } else {
      return baseList.nullSafetyList
          .map((e) => CarListModel.fromJson(e))
          .toList();
    }
  }

  ///获取评估列表
  static Future<List<CarEvaluationModel>> getCarEvaluationList(
      int page, int size,
      {String? keyWords}) async {
    var data = {
      'page': page,
      'size': size,
      'modelName': keyWords,
    };
    BaseListModel baseList =
        await apiClient.requestList(API.car.getCarEvaluationList, data: data);
    if (baseList.code != 0) {
      CloudToast.show(baseList.msg);
      return [];
    } else {
      return baseList.nullSafetyList
          .map((e) => CarEvaluationModel.fromJson(e))
          .toList();
    }
  }

  ///获取我的⻋辆列表 new_create=最新创建 max_price=标价最⾼ min_price=标价最低 min_age=⻋龄最短 min_mileage=⾥程最少 new_update=最近更新
  static Future<List<CarListModel>> getMyCarList(
      {required int page,
      int size = 10,
      String? order,
      Map<String, dynamic>? searchParams}) async {
    var baseList = await apiClient.requestList(API.car.getCarSelfLists, data: {
      'page': page,
      'size': size,
      'order': order,
      'search': searchParams
    });
    if (baseList.code != 0) {
      CloudToast.show(baseList.msg);
      return [];
    } else {
      return baseList.nullSafetyList
          .map((e) => CarListModel.fromJson(e))
          .toList();
    }
  }

  ///⻋辆详情
  static Future<CarInfoModel?> getCarInfo(int carId) async {
    BaseModel model = await apiClient.request(API.car.getCarIfo, data: {
      'carId': carId,
    });
    if (model.code == 0) {
      return CarInfoModel.fromJson(model.data);
    } else {
      CloudToast.show(model.msg);
      return null;
    }
  }

  ///费⽤计算
  static Future<CarAmountModel?> getCarAmount(num amount) async {
    BaseModel model = await apiClient.request(API.car.priceAmount, data: {
      'amount': amount,
    });
    if (model.code == 0) {
      return CarAmountModel.fromJson(model.data);
    } else {
      CloudToast.show(model.msg);
      return null;
    }
  }

  ///快速估价
  static Future<String> getQuickAmount(CarInfo carModel) async {
    BaseModel model = await apiClient.request(API.car.fastEstimatePrice, data: {
      'modelId': carModel.modelId,
      // 'licensePlate': carModel.licensePlate,
      'cityId': carModel.locationCityId,
      'color': carModel.color,
      'licensingDate': DateUtil.formatDate(carModel.licensingDate,
          format: DateFormats.y_mo_d),
      'mileage': carModel.mileage,
    });
    if (model.code == 0) {
      UserTool.userProvider.updateUserInfo();
      return model.data['price'];
    } else {
      CloudToast.show(model.msg);
      return '';
    }
  }

  ///估算价格
  static Future<EstimatePriceModel?> getEstimatePrice(CarInfo carInfo) async {
    BaseModel model = await apiClient.request(API.car.estimatePrice, data: {
      'modelId': carInfo.modelId,
      // 'licensePlate': carInfo.licensePlate,
      'cityId': carInfo.locationCityId,
      'color': carInfo.color,
      'licensingDate': DateUtil.formatDate(carInfo.licensingDate,
          format: DateFormats.y_mo_d),
      'Mileage': carInfo.mileage,
      'Transfer': carInfo.transfer,
      'Paint': carInfo.paint,
      'Plate': carInfo.plate,
      'Parts': carInfo.parts,
      'Engine': carInfo.engine,
      'Accidents': carInfo.accidents,
      'Maintain': carInfo.maintain,
      'vin': carInfo.vin,
      'engineNo': carInfo.engineNo,
      'source': UserTool.userProvider.userInfo.businessId == 1 ? 1 : 2,
      'shamMileage': carInfo.shamMileage
    });

    if (model.code == 0) {
      UserTool.userProvider.updateUserInfo();
      return EstimatePriceModel.fromJson(model.data);
    } else {
      CloudToast.show(model.msg);
      return null;
    }
  }

  ///寄卖合同列表
  static Future<List<ConsignmentListModel>> getConsignmentList(
      {required int page, int size = 10}) async {
    BaseListModel res = await apiClient.requestList(
        API.contract.consignmentList,
        data: {'size': size, 'page': page});
    if (res.code == 0) {
      return res.nullSafetyList
          .map((e) => ConsignmentListModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  ///出售合同列表
  static Future<List<ConsignmentListModel>> getSaleList(
      {required int page, int size = 10}) async {
    BaseListModel res = await apiClient.requestList(
        API.contract.consignmentList,
        data: {'size': size, 'page': page});
    if (res.code == 0) {
      return res.nullSafetyList
          .map((e) => ConsignmentListModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  ///发起寄卖合同
  static Future<bool> addConsignment(
      ConsignmentContractModel contractModel) async {
    Map<String, dynamic> params = {
      "name": contractModel.masterInfo.name,
      "idCard": contractModel.masterInfo.idCard,
      "phone": contractModel.masterInfo.phone,
      "bankCard": contractModel.masterInfo.bankCard,
      "bank": contractModel.masterInfo.bank,
      "idCardFront": contractModel.masterInfo.idCardFront,
      "idCardBack": contractModel.masterInfo.idCardBack,
      "photo": contractModel.masterInfo.photo,
    };
    BaseModel model =
        await apiClient.request(API.contract.addConsignment, data: {
      'priceId': contractModel.priceId,
      'customerId': contractModel.customerId,
      'price': contractModel.sellPrice,
      'masterInfo': params,
      'keyCount': contractModel.keyCount,
      'compulsoryInsurance': contractModel.compulsoryInsurance,
      'compulsoryInsuranceDate': contractModel.compulsoryInsuranceDate,
      'commercialInsurance': contractModel.commercialInsurance,
      'commercialInsuranceDate': contractModel.commercialInsuranceDate,
      'commercialInsurancePrice': contractModel.commercialInsurancePrice,
      'exterior': contractModel.exterior,
      'interiorTrim': contractModel.interiorTrim,
      'workingCondition': contractModel.workingCondition,
      'serviceFeeRate': contractModel.serviceFeeRate,
    });
    if (model.code == 0) {
      if (model.msg == '操作成功') {
        return true;
      } else {
        return false;
      }
    } else {
      CloudToast.show(model.msg);
      return false;
    }
  }

  ///发起出售合同
  static Future<bool> addSale(CarSaleContractModel saleModel) async {
    BaseModel model =
        await apiClient.request(API.contract.addSaleContract, data: {
      'carId': saleModel.carId,
      'customerId': saleModel.customerId,
      'phone': saleModel.phone,
      'name': saleModel.name,
      'idCard': saleModel.idCard,
      'address': saleModel.address,
      'openBank': saleModel.openBank,
      'bankCard': saleModel.bankCard,
      'remark': saleModel.remark,
    });
    if (model.code == 0) {
      if (model.msg == '操作成功') {
        return true;
      } else {
        return false;
      }
    } else {
      CloudToast.show(model.msg);
      return false;
    }
  }

  ///获取车商列表

  static Future<List<DealerListModel>> getDealerList() async {
    BaseModel res = await apiClient.request(
      API.car.dealerList,
    );
    if (res.code == 0) {
      return (res.data as List)
          .map((e) => DealerListModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  ///车商发布车辆
  static Future<bool> dealerPushCar({
    required BusinessPushModel businessPushModel,
    required CarPhotoModel carPhotoModel,
  }) async {
    Map<String, dynamic> baseInfo = {
      "type": carPhotoModel.baseInfo.type,
      "interiorColor": carPhotoModel.baseInfo.interiorColor,
      "displacement": carPhotoModel.baseInfo.displacement,
      "gearbox": carPhotoModel.baseInfo.gearbox,
      "emissionStandard": carPhotoModel.baseInfo.emissionStandard,
      "useCharacter": carPhotoModel.baseInfo.useCharacter,
      "location": carPhotoModel.baseInfo.location,
      "attribution": carPhotoModel.baseInfo.attribution,
      "conditionIn": carPhotoModel.baseInfo.conditionIn,
      "conditionOut": carPhotoModel.baseInfo.conditionOut,
    };

    Map<String, dynamic> photos = {
      "carPhotos": carPhotoModel.photos.carPhotos,
      "interiorPhotos": carPhotoModel.photos.interiorPhotos,
      "defectPhotos": carPhotoModel.photos.defectPhotos,
      "dataPhotos": carPhotoModel.photos.dataPhotos,
    };

    Map<String, dynamic> report = {
      "paints": carPhotoModel.report.paints,
    };

    Map<String, dynamic> other = {
      "price": businessPushModel.other.price,
      "keyCount": businessPushModel.other.keyCount,
      "compulsoryInsurance": businessPushModel.other.compulsoryInsurance,
      "compulsoryInsuranceDate":
          businessPushModel.other.compulsoryInsuranceDate == ''
              ? null
              : businessPushModel.other.compulsoryInsuranceDate,
      "commercialInsurance": businessPushModel.other.commercialInsurance,
      "commercialInsuranceDate":
          businessPushModel.other.commercialInsuranceDate == ''
              ? null
              : businessPushModel.other.commercialInsuranceDate,
      "commercialInsurancePrice":
          businessPushModel.other.commercialInsurancePrice == ''
              ? null
              : businessPushModel.other.commercialInsurancePrice,
    };

    BaseModel model = await apiClient.request(API.order.addConsignment, data: {
      'priceId': businessPushModel.priceId,
      'dealerId': businessPushModel.dealerId,
      'photos': photos,
      'baseInfo': baseInfo,
      'report': report,
      'other': other,
    });
    if (model.code == 0) {
      if (model.msg == '操作成功') {
        return true;
      } else {
        return false;
      }
    } else {
      CloudToast.show(model.msg);
      return false;
    }
  }

  ///个人发布车辆
  static Future<bool> personalPushCar({
    required int orderId,
    required CarPhotoModel carPhotoModel,
  }) async {
    Map<String, dynamic> baseInfo = {
      "type": carPhotoModel.baseInfo.type,
      "interiorColor": carPhotoModel.baseInfo.interiorColor,
      "displacement": carPhotoModel.baseInfo.displacement,
      "gearbox": carPhotoModel.baseInfo.gearbox,
      "emissionStandard": carPhotoModel.baseInfo.emissionStandard,
      "useCharacter": carPhotoModel.baseInfo.useCharacter,
      "location": carPhotoModel.baseInfo.location,
      "attribution": carPhotoModel.baseInfo.attribution,
      "conditionIn": carPhotoModel.baseInfo.conditionIn,
      "conditionOut": carPhotoModel.baseInfo.conditionOut,
    };

    Map<String, dynamic> photos = {
      "carPhotos": carPhotoModel.photos.carPhotos,
      "interiorPhotos": carPhotoModel.photos.interiorPhotos,
      "defectPhotos": carPhotoModel.photos.defectPhotos,
      "dataPhotos": carPhotoModel.photos.dataPhotos,
    };

    Map<String, dynamic> report = {
      "paints": carPhotoModel.report.paints,
    };

    BaseModel model =
        await apiClient.request(API.order.consignmentPublish, data: {
      'orderId': orderId,
      'photos': photos,
      'baseInfo': baseInfo,
      'report': report,
    });
    if (model.code == 0) {
      if (model.msg == '操作成功') {
        return true;
      } else {
        return false;
      }
    } else {
      CloudToast.show(model.msg);
      return false;
    }
  }

  ///车辆管理统计数据
  static Future<CarStatisticsModel> getStatisticNum() async {
    BaseModel res = await apiClient.request(
      API.car.statisticsNum,
    );
    if (res.code == 0) {
      return CarStatisticsModel.fromJson(res.data);
    } else {
      return CarStatisticsModel.init;
    }
  }

  ///个人车辆管理统计数据
  static Future<CarStatisticsModel> getPersonalStatisticNum() async {
    BaseModel res = await apiClient.request(
      API.car.personalStatisticNum,
    );
    if (res.code == 0) {
      return CarStatisticsModel.fromJson(res.data);
    } else {
      return CarStatisticsModel.init;
    }
  }
}
