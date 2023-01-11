import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/car/bank_card_info_model.dart';
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
import 'package:cloud_car/model/car/id_card_info_model.dart';
import 'package:cloud_car/model/car/new_car_info.dart';
import 'package:cloud_car/model/car/new_car_statistics_model.dart';
import 'package:cloud_car/model/contract/consignment_list_model.dart';
import 'package:cloud_car/model/contract/purchase_photo_model.dart';

import 'package:cloud_car/model/sort/sort_brand_model.dart';
import 'package:cloud_car/model/user/store_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/new_push_car_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_photo_model.dart';
import 'package:cloud_car/ui/home/car_purchase/purchase_info_page.dart';
import 'package:cloud_car/ui/home/car_purchase/purchase_push_car_page.dart';
import 'package:cloud_car/ui/home/car_valuation/car_valuation_page.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/net_work/inner_model/base_list_model.dart';
import 'package:cloud_car/utils/net_work/inner_model/base_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:flustars/flustars.dart';

import '../../../model/acquisition_info_model.dart';
import '../../../model/car/dealer_list_model.dart';
import '../../../model/car/economic_release_model.dart';
import '../../../model/contract/consignment_model.dart';
import '../../../model/price_info_model.dart';
import '../../../model/publish_info_model.dart';
import '../../../model/sale_info_model.dart';

class CarFunc {
  ///⾏驶证 识别
  static Future<IdCardInfoModel?> idCardOCR(String path) async {
    BaseModel model = await apiClient.request(API.car.getIdCard, data: {
      "path": path,
    });
    if (model.code == 0) {
      return IdCardInfoModel.fromJson(model.data);
    } else {
      CloudToast.show(model.msg);
      return null;
    }
  }

  ///⾏驶证 识别
  static Future<BankCardInfoModel?> bankCardOCR(String path) async {
    BaseModel model = await apiClient.request(API.car.getBankCard, data: {
      "path": path,
    });
    if (model.code == 0) {
      return BankCardInfoModel.fromJson(model.data);
    } else {
      CloudToast.show(model.msg);
      return null;
    }
  }

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
  static Future<List<CarEvaluationModel>> getCarEvaluationList({
    int page = 1,
    int size = 10,
    String? keyWords,
  }) async {
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

  ///评估记录详情
  static Future<PriceInfoModel?> getPriceInfo(int priceId) async {
    BaseModel res =
        await apiClient.request(API.car.priceInfo, data: {'priceId': priceId});
    if (res.code == 0) {
      return PriceInfoModel.fromJson(res.data);
    } else {
      CloudToast.show(res.msg);
      return null;
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
  static Future<NewCarInfo?> getNewCarInfo(int carId) async {
    BaseModel model = await apiClient.request(API.car.getCarIfo, data: {
      'carId': carId,
    });
    if (model.code == 0) {
      return NewCarInfo.fromJson(model.data);
    } else {
      CloudToast.show(model.msg);
      return null;
    }
  }

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
      'mileage': (num.parse(carModel.mileage!) * 10000).toString(),
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
      'Mileage': (num.parse(carInfo.mileage!) * 10000).toString(),
      'Transfer': carInfo.transfer,
      'Paint': carInfo.paint,
      'Plate': carInfo.plate,
      'Parts': carInfo.parts,
      'Engine': carInfo.engine,
      'Accidents': carInfo.accidents,
      'Maintain': carInfo.maintain,
      'vin': carInfo.vin,
      'engineNo': carInfo.engineNo,
      'source': UserTool.userProvider.userInfo.business.businessId == 1 ? 1 : 2,
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
  static Future<List<ConsignmentModel>> getConsignmentList(
      {required int page, int size = 10}) async {
    BaseListModel res = await apiClient.requestList(
        API.contract.consignmentList,
        data: {'size': size, 'page': page});
    if (res.code == 0) {
      return res.nullSafetyList
          .map((e) => ConsignmentModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  ///出售合同列表
  static Future<List<ConsignmentListModel>> getSaleList(
      {required int page, int size = 10, int status = 0}) async {
    BaseListModel res = await apiClient.requestList(API.contract.soldList,
        data: {'size': size, 'page': page, 'status': status});
    if (res.code == 0) {
      return res.nullSafetyList
          .map((e) => ConsignmentListModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  ///收车合同列表
  static Future<List<ConsignmentListModel>> getPurchaseList(
      {required int page, int size = 10, int status = 0}) async {
    BaseListModel res = await apiClient.requestList(API.contract.purchaseList,
        data: {'size': size, 'page': page, 'status': status});
    if (res.code == 0) {
      return res.nullSafetyList
          .map((e) => ConsignmentListModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  // ///出售合同列表
  // static Future<List<ConsignmentListModel>> getSaleDealerList(
  //     {required int page, int size = 10}) async {
  //   BaseListModel res = await apiClient.requestList(API.contract.soldList,
  //       data: {'size': size, 'page': page});
  //   if (res.code == 0) {
  //     return res.nullSafetyList
  //         .map((e) => ConsignmentListModel.fromJson(e))
  //         .toList();
  //   } else {
  //     return [];
  //   }
  // }

  ///车商出售合同列表
  static Future<List<ConsignmentListModel>> getSaleDealer(
      {required int page, int size = 10, int status = 0}) async {
    BaseListModel res = await apiClient.requestList(API.contract.dealerSale,
        data: {'size': size, 'page': page, 'status': status});
    if (res.code == 0) {
      return res.nullSafetyList
          .map((e) => ConsignmentListModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  ///车商收购合同列表
  static Future<List<ConsignmentListModel>> getPurchaseDealerList(
      {required int page, int size = 10, int status = 0}) async {
    BaseListModel res = await apiClient.requestList(
        API.contract.carDealerAcquisition,
        data: {'size': size, 'page': page, 'status': status});
    if (res.code == 0) {
      return res.nullSafetyList
          .map((e) => ConsignmentListModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  ///出售合同详情
  static Future<SaleInfoModel?> getSaleInfo(int modelId) async {
    var res = await apiClient
        .request(API.contract.saleInfo, data: {'contractId': modelId});
    if (res.code == 0) {
      return SaleInfoModel.fromJson(res.data);
    } else {
      CloudToast.show(res.msg);
      return null;
    }
  }

  ///收购合同详情
  static Future<AcquisitionInfoModel?> getPurchaseInfo(int modelId) async {
    var res = await apiClient
        .request(API.contract.purchaseInfo, data: {'contractId': modelId});
    if (res.code == 0) {
      return AcquisitionInfoModel.fromJson(res.data);
    } else {
      CloudToast.show(res.msg);
      return null;
    }
  }

  ///调价
  static Future<bool> adjustPrice(
      int id, num interiorPrice, String exteriorPrice) async {
    BaseModel model = await apiClient.request(API.car.adjustPrice, data: {
      'carId': id,
      'interior_price': interiorPrice,
      'exterior_price': exteriorPrice
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
      "photo": '',
    };
    BaseModel model =
        await apiClient.request(API.contract.addConsignment, data: {
      'priceId': contractModel.priceId,
      'customerId': contractModel.customerId,
      'price': contractModel.sellPrice,
      'masterInfo': params,
      'licensePlate': contractModel.publishCarInfo?.carNum ?? '',
      'keyCount': contractModel.keyCount,
      'useCharacter': contractModel.useCharacter,
      'compulsoryInsurance': contractModel.compulsoryInsurance,
      'compulsoryInsuranceDate': contractModel.compulsoryInsuranceDate,
      'commercialInsurance': contractModel.commercialInsurance,
      'commercialInsuranceDate': contractModel.commercialInsuranceDate,
      'commercialInsurancePrice': contractModel.commercialInsurancePrice,
      // 'exterior': contractModel.exterior,
      // 'interiorTrim': contractModel.interiorTrim,
      // 'workingCondition': contractModel.workingCondition,
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
    Map<String, dynamic> priceInfo = {
      'dealPrice': saleModel.priceInfo.dealPrice,
      'deposit': saleModel.priceInfo.deposit,
      'downPayment': saleModel.priceInfo.downPayment,
    };
    Map<String, dynamic> masterInfo = {
      'name': saleModel.masterInfo.name,
      'phone': saleModel.masterInfo.phone,
      'idCard': saleModel.masterInfo.idCard,
      'address': saleModel.masterInfo.address,
      'bank': saleModel.masterInfo.bank,
      'bankCard': saleModel.masterInfo.bankCard,
      'bankAccount': saleModel.masterInfo.bankAccount,
    };
    Map<String, dynamic> thirdPartInfo = {
      'kind': saleModel.thirdPartInfo.kind,
      'storeId': saleModel.thirdPartInfo.storeId,
      'saleServiceFeeRate': saleModel.thirdPartInfo.saleServiceFeeRate,
      'purchaseServiceFeeRate': saleModel.thirdPartInfo.purchaseServiceFeeRate,
    };
    BaseModel model =
        await apiClient.request(API.contract.addSaleContract, data: {
      "carId": saleModel.carId,
      'payType': saleModel.payType,
      'transferType': saleModel.transferType,
      'priceInfo': priceInfo,
      'customerId': saleModel.customerId,
      'customerChannel': saleModel.customerChannel,
      'masterInfo': masterInfo,
      'thirdPartInfo': thirdPartInfo,
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

  ///发起收购合同
  static Future<bool> addPurchase(
      PurchaseCarInfo purchaseCarInfo,
      PurchaseInfo purchaseInfo,
      PurchasePhotoModel purchasePhotoModel,
      String legalName) async {
    Map<String, dynamic> baseInfo = {
      'channel': purchaseCarInfo.channel,
      "modelId": purchaseCarInfo.carModelId,
      "vin": purchaseCarInfo.viNum,
      "engineNo": purchaseCarInfo.engineNum,
      "licensingDate": purchaseCarInfo.licensingDateStr,
      'licensePlate': purchaseCarInfo.licensePlate,
      "useCharacter": purchaseCarInfo.carNatureOfUseEM.typeNum,
      "color": purchaseCarInfo.color,
      "marketDate": purchaseCarInfo.productionDateStr == ''
          ? null
          : purchaseCarInfo.productionDateStr,
      "mileage": purchaseCarInfo.mileage != null
          ? num.parse(purchaseCarInfo.mileage!) * 10000
          : null,
      "compulsoryInsuranceDate":
          purchaseCarInfo.compulsoryInsuranceDateStr == ''
              ? null
              : purchaseCarInfo.compulsoryInsuranceDateStr,
      "condition": purchaseInfo.remark,
    };

    Map<String, dynamic> masterInfo = {
      "name": purchaseInfo.ownerName,
      "idCard": purchaseInfo.ownerId,
      "phone": purchaseInfo.phoneNum,
      "bankCard": purchaseInfo.bankNum,
      "bank": purchaseInfo.bank,
      "kind": purchaseInfo.kind,
      'legalName': legalName,
    };

    Map<String, dynamic> priceInfo = {
      "DealPrice": purchaseInfo.transactionAmount,
      "DownPaymentRate": purchaseInfo.downPaymentAmount,
      // purchaseInfo.downPaymentNum,
      // purchaseInfo.downPaymentNum!=null?
      // (num.parse(purchaseInfo.downPaymentNum!)/100).toString():
      // null,
      ////"BalancePaymentRate":purchaseInfo.downPaymentAmount!=null && purchaseInfo.transactionAmount !=null?(num.parse(purchaseInfo.transactionAmount!)-num.parse(purchaseInfo.downPaymentAmount!)).toString():null,
      // ( num.parse(purchaseInfo.transactionAmount!)-num.parse(purchaseInfo.downPaymentNum!)).toString(),
      // purchaseInfo.downPaymentNum!=null?
      // (1-num.parse(purchaseInfo.downPaymentNum!)/100).toString():null,
      "DeliverDate": purchaseInfo.deliveryDateStr,
    };

    Map<String, dynamic> base = {
      "customerId": purchaseCarInfo.customerId,
      "baseInfo": baseInfo,
      "masterInfo": masterInfo,
      "PriceInfo": priceInfo,
      "photos": purchasePhotoModel.toJson(),
    };

    BaseModel model =
        await apiClient.request(API.contract.addPurchase, data: base);
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

  static Future<List<StoreModel>> getStructureAll() async {
    var res =
        await apiClient.request(API.storeManagement.structureAll, data: {});

    if (res.data == null) return [];
    return (res.data as List).map((e) => StoreModel.fromJson(e)).toList();
  }

  static Future<bool> newPushCar({
    required NewPublishCarInfo newPublishCarInfo,
    required PushPhotoModel pushPhotoModel,
    // required ReportPhotoModel reportPhotoModel,
  }) async {
    Map<String, dynamic> baseInfo = {
      "source": newPublishCarInfo.carSource,
      "sourceId": newPublishCarInfo.carShopId,
      // "type":newPublishCarInfo.carTypeEM.typeStr,
      "type": newPublishCarInfo.carTypeEM.typeNum,
      "modelId": newPublishCarInfo.carModelId,
      "vin": newPublishCarInfo.viNum,
      "engineNo": newPublishCarInfo.engineNum,
      "licensingDate": newPublishCarInfo.licensingDateStr,
      "color": newPublishCarInfo.carColor,
      "interiorColor": newPublishCarInfo.carDecorativeColor,
      "temporaryLicensePlate": newPublishCarInfo.carTemporaryNum,
      "parkingNo": (newPublishCarInfo.carParkingNum).toString(),
      //"emissionStandard":newPublishCarInfo.environmentalLevel,
      // "useCharacter":newPublishCarInfo.natureOfUseEM.typeStr,
      "useCharacter": newPublishCarInfo.natureOfUseEM.typeNum,
      "shamMileage": newPublishCarInfo.mileage != null
          ? num.parse(newPublishCarInfo.mileage!)
          : null,
      //"marketDate":newPublishCarInfo.productionDateStr==''?null:newPublishCarInfo.productionDateStr,
      "newCarGuidePrice": newPublishCarInfo.newCarPrice != null
          ? num.parse(newPublishCarInfo.newCarPrice!) * 10000
          : null,
      "purchaseTax": newPublishCarInfo.purchaseTax != null
          ? num.parse(newPublishCarInfo.purchaseTax!) * 10000
          : null,
      "installationCost": newPublishCarInfo.retrofittingFee != null
          ? num.parse(newPublishCarInfo.retrofittingFee!)
          : null,
      "location": newPublishCarInfo.locationCityId,
      'attribution': newPublishCarInfo.attributionId,
      "condition": newPublishCarInfo.carDescription,
      "remark": newPublishCarInfo.remark,
    };
    Map<String, dynamic> priceInfo = {
      "interiorPrice": newPublishCarInfo.wholesalePrice != null
          ? num.parse(newPublishCarInfo.wholesalePrice!) * 10000
          : null,
      "exteriorPrice": newPublishCarInfo.salePrice != null
          ? num.parse(newPublishCarInfo.salePrice!) * 10000
          : null,
    };
    Map<String, dynamic> certificateInfo = {
      "transfer": newPublishCarInfo.transferNum != null
          ? int.parse(newPublishCarInfo.transferNum!)
          : null,
      "keyCount": newPublishCarInfo.keyCount != null
          ? int.parse(newPublishCarInfo.keyCount!)
          : null,
      "compulsoryInsurance": newPublishCarInfo.haveCompulsoryInsurance,
      "compulsoryInsuranceDate": newPublishCarInfo.compulsoryInsuranceDateStr,
      "commercialInsurance": newPublishCarInfo.haveCommercialInsurance,
      "commercialInsuranceDate": newPublishCarInfo.commercialInsuranceDateStr,
      "commercialInsurancePrice":
          newPublishCarInfo.commercialInsurancePrice != null
              ? num.parse(newPublishCarInfo.commercialInsurancePrice!)
              : null,
    };
    Map<String, dynamic> purchaseInfo = {
      'price': num.parse(newPublishCarInfo.purchasePrice == null
              ? '0'
              : newPublishCarInfo.purchasePrice!) *
          10000,
      'date': newPublishCarInfo.purchaseDateStr,
      'liaison': newPublishCarInfo.purchasePerson,
    };

    Map<String, dynamic> base = {
      "photos": pushPhotoModel.toJson(),
      "baseInfo": baseInfo,
      // "report":reportPhotoModel.toJson(),
      "priceInfo": priceInfo,
      "certificateInfo": certificateInfo,
      "purchaseInfo": purchaseInfo
    };

    BaseModel model = await apiClient.request(API.order.newPushCar, data: base);
    if (model.code == 0) {
      if (model.msg == '操作成功') {
        return true;
      } else {
        return false;
      }
    } else {
      //BotToast.showText(text: '发布失败');
      CloudToast.show(model.msg);
      return false;
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

  ///新车辆管理统计数据
  static Future<NewCarStatisticsModel> getNewStatisticNum() async {
    BaseModel res = await apiClient.request(
      API.car.personalStatisticNum,
    );
    if (res.code == 0) {
      return NewCarStatisticsModel.fromJson(res.data);
    } else {
      return NewCarStatisticsModel.init;
    }
  }

  ///经纪人车辆发布列表
  static Future<List<EconomicReleaseModel>> getPubLists(
      {required int page, int size = 10, int status = 0}) async {
    var res = await apiClient.requestList(API.order.pubLists,
        data: {'page': page, 'size': size, 'status': status});
    if (res.code == 0) {
      return res.nullSafetyList
          .map((e) => EconomicReleaseModel.fromJson(e))
          .toList();
    } else {
      CloudToast.show(res.msg);
      return [];
    }
  }

  ///车商车辆发布列表
  static Future<List<EconomicReleaseModel>> getEconomicPubLists(
      {required int page,
      int size = 10,
      int source = 0,
      int status = 0}) async {
    var res = await apiClient.requestList(API.order.dealerPubLists,
        data: {'page': page, 'size': size, 'source': source, 'status': status});
    if (res.code == 0) {
      return res.nullSafetyList
          .map((e) => EconomicReleaseModel.fromJson(e))
          .toList();
    } else {
      CloudToast.show(res.msg);
      return [];
    }
  }

  ///发布车辆详情
  static Future<PublishInfoModel> getPublishInfo(int carBaseId) async {
    var res = await apiClient
        .request(API.order.publishInfo, data: {'carBaseId': carBaseId});
    if (res.code == 0) {
      return PublishInfoModel.fromJson(res.data);
    } else {
      CloudToast.show(res.msg);
      return PublishInfoModel.init;
    }
  }
}
