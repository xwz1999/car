
import 'package:cloud_car/model/car/car_amount_model.dart';
import 'package:cloud_car/model/car/car_distinguish_model.dart';
import 'package:cloud_car/model/car/car_info_model.dart';
import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/model/car/car_sale_contract_model.dart';
import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/model/sort/sort_brand_model.dart';
import 'package:cloud_car/ui/home/car_valuation/car_valuation_page.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_list_model.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
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
      {String? order,Map<String,dynamic>? searchParams}) async {
    var data = {'page': page, 'size': size,'order':order,'search':searchParams};
    BaseListModel baseList = await apiClient
        .requestList(API.car.getCarLists, data: data);
    if (baseList.code != 0) {
      CloudToast.show(baseList.msg);
      return [];
    } else {
      return baseList.nullSafetyList
          .map((e) => CarListModel.fromJson(e))
          .toList();
    }
  }
  ///获取我的⻋辆列表 new_create=最新创建 max_price=标价最⾼ min_price=标价最低 min_age=⻋龄最短 min_mileage=⾥程最少 new_update=最近更新
  static Future<List<CarListModel>> getMyCarList(
      {required int page, int size = 10, String? order,Map<String,dynamic>? searchParams}) async {
    var baseList = await apiClient.requestList(API.car.getCarSelfLists,
        data: {'page': page, 'size': size, 'order': order,'search':searchParams});
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
<<<<<<< HEAD






=======
>>>>>>> e2cb8e226335cf3a406974911829726a91f67838
}