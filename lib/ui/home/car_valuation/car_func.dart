import 'package:cloud_car/model/car_manager/car_amount_model.dart';
import 'package:cloud_car/model/car_manager/car_info_model.dart';
import 'package:cloud_car/model/car_manager/car_list_model.dart';
import 'package:cloud_car/model/car_manager/car_sale_contract_model.dart';
import 'package:cloud_car/model/car_valuation/car_distinguish_model.dart';
import 'package:cloud_car/model/car_manager/consignment_contact_model.dart';
import 'package:cloud_car/model/sort/sort_brand_model.dart';
import 'package:cloud_car/ui/home/car_valuation/car_valuation_page.dart';

import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_list_model.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';

class CarFunc {
  ///获取车辆品牌
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

  ///行驶证 识别
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

  ///获取车辆列表
  static Future<List<CarListModel>> getCarList(int page,
      {String? order,String? search,}) async {
    Map<String, dynamic> params = {
      "page": page,
      'size':10,
    };
    BaseListModel baseList = await apiClient
        .requestList(API.car.getCarLists, data: {'page': page, 'size': 10});
    if (baseList.code != 0) {
      CloudToast.show(baseList.msg);
      return [];
    } else {
      return baseList.nullSafetyList
          .map((e) => CarListModel.fromJson(e))
          .toList();
    }
  }

  ///获取我的车辆列表  new_create=最新创建 max_price=标价最高 min_price=标价最低 min_age=车龄最短 min_mileage=里程最少 new_update=最近更新
  static Future<List<CarListModel>> getMyCarList(
      {required int page, int size = 10, String? order}) async {
    var baseList = await apiClient.requestList(API.car.getCarSelfLists,
        data: {'page': page, 'size': size, 'order': order});
    if (baseList.code != 0) {
      CloudToast.show(baseList.msg);
      return [];
    } else {
      return baseList.nullSafetyList
          .map((e) => CarListModel.fromJson(e))
          .toList();
    }
  }

  ///车辆详情
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

  ///费用计算
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

  ///估算价格
  static Future<String> getEstimatePrice(CarInfo carInfo) async {
    BaseModel model = await apiClient.request(API.car.estimatePrice, data: {
      'modelId': carInfo.modelId,
      'licensePlate': carInfo.licensePlate,
      'color': carInfo.color,
      'licensingDate': carInfo.licensingDate,
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
      'source': carInfo.source,
      'shamMileage': carInfo.shamMileage
    });
    if (model.code == 0) {
      return model.data['price'];
    } else {
      CloudToast.show(model.msg);
      return '0';
    }
  }

  ///发起寄卖合同
  static Future<bool> addConsignment(
      ConsignmentContractModel contractModel) async {
    Map<String, dynamic> params = {
      "name": contractModel.masterInfo?.name,
      "idCard": contractModel.masterInfo?.idCard,
      "phone": contractModel.masterInfo?.phone,
      "bankCard": contractModel.masterInfo?.bankCard,
      "bank": contractModel.masterInfo?.bank,
      "idCardFront": contractModel.masterInfo?.idCardFront,
      "idCardBack": contractModel.masterInfo?.idCardBack,
      "photo": contractModel.masterInfo?.photo,
    };

    BaseModel model =
        await apiClient.request(API.contract.addSaleContract, data: {
      'priceId': contractModel.priceId,
      'customerId': contractModel.customerId,
      'price': contractModel.price,
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
}
