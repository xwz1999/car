
import 'package:cloud_car/model/car_valuation/car_distinguish_model.dart';
import 'package:cloud_car/model/sort/sort_brand_model.dart';

import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_model.dart';

class CarFunc{

  ///获取车辆品牌
  static Future<List<SortBrandModel>> getBrandList() async {
    var model = await apiClient.request(
      API.home.sort.getCarBrand,
    );
    if ((model.data as List).isEmpty) return [];
    return (model.data as List).map((e) => SortBrandModel.fromJson(e)).toList();
  }





  ///行驶证 识别
  static Future<CarDistinguishModel?> carDistinguish(String path) async {
    BaseModel model = await apiClient.request(
      API.home.car.getCarVehicle,data: {
        "path":path,
    }
    );
    if (model.code==0) {
      return CarDistinguishModel.fromJson( model.data);
    } else{
      return null;
    }
  }


}