import 'package:cloud_car/extensions/string_extension.dart';
import 'package:cloud_car/model/sort/sort_brand_model.dart';
import 'package:cloud_car/model/sort/sort_car_model_model.dart';
import 'package:cloud_car/model/sort/sort_series_model.dart';

import '../func/car_map.dart';

class SearchParamModel {
  SortBrandModel brand;
  SortSeriesModel series;
  SortCarModelModel car;


  String? keyWords;///搜索值

  ///在哪个页面返回 1品牌 2车系
  int returnType;


  ///车价
  String price;

  ///筛选中输入的最大最小价格
  int? editMinPrice;
  int? editMaxPrice;

  int? get finalMinPrice =>
      editMinPrice == null ? price.minPrice : editMinPrice!;

  int? get finalMaxPrice =>
      editMaxPrice == null ? price.maxPrice : editMaxPrice!;

  ///车龄
  String carAge ;

  int get minCarAge {
    if (carAge.isEmpty) {
      return 0;
    } else {
      return CarMap.carAge[carAge]![0];
    }
  }

  int get maxCarAge {
    if (carAge.isEmpty) {
      return 0;
    } else {
      return CarMap.carAge[carAge]![1];
    }
  }

  ///车身结构
  String struct ;

  ///变速箱类型
  String gear;
  int? get gearType => CarMap.gearType[gear];

  ///里程
  String mile;

  ///筛选中输入的最大最小里程
  int? editMinMile;
  int? editMaxMile;

  int? get finalMinMile =>
      editMinMile == null ? 0 : editMinMile!;

  int? get finalMaxMile =>
      editMaxMile == null ? mile.maxMile : editMaxMile!;

  ///排放标准
  String dischargeStandard;

  SearchParamModel({
    required this.brand,
    required this.series,
    required this.car,
    this.returnType = 3,
    this.price = '',
    this.editMaxPrice,
    this.editMinPrice,
    this.mile='',
    this.editMaxMile,
    this.editMinMile,
    this.gear='',
    this.struct='',
    this.carAge='',
    this.dischargeStandard='',
    this.keyWords = '',
  });

  static SearchParamModel init({int? returnType}) => SearchParamModel(
      brand: SortBrandModel.init,
      series: SortSeriesModel.init,
      car: SortCarModelModel.init,
      returnType: returnType ?? 3);
}
