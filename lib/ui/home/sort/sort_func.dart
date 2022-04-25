
import 'package:cloud_car/model/sort/sort_brand_model.dart';
import 'package:cloud_car/model/sort/sort_car_model_model.dart';
import 'package:cloud_car/model/sort/sort_series_model.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/constants/api/api.dart';

class SortFunc{

  ///获取车辆品牌
  static Future<List<SortBrandModel>> getBrandList() async {
    var model = await apiClient.request(
        API.car.getCarBrand,
    );
    if ((model.data as List).isEmpty) return [];
    return (model.data as List).map((e) => SortBrandModel.fromJson(e)).toList();
  }


  ///获取车辆品牌
  static Future<List<SortSeriesModel>> getSeriesList(int brandId) async {
    var model = await apiClient.request(
      API.car.getCarSeries,data:{'brandId':brandId}
    );
    if ((model.data as List).isEmpty) return [];
    return (model.data as List).map((e) => SortSeriesModel.fromJson(e)).toList();
  }


  ///获取车型
  static Future<List<SortCarModelModel>> getModelList(int seriesId) async {
    var model = await apiClient.request(
        API.car.getCarModel,data:{'seriesId':seriesId}
    );
    if ((model.data as List).isEmpty) return [];
    return (model.data as List).map((e) => SortCarModelModel.fromJson(e)).toList();
  }

}