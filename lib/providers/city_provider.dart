import 'package:azlistview/azlistview.dart';
import 'package:cloud_car/model/region/az_city_model.dart';
import 'package:cloud_car/model/region/city_model.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../constants/api/api.dart';
import '../model/region/china_region_model.dart';

class CityProvider extends ChangeNotifier {
  late Box _regionBox;
  List<ChinaRegionModel> _regions = [];

  List<ChinaRegionModel> get regions => _regions;

  Future init() async {
    _regionBox = await Hive.openBox('ChinaRegionBox');
    var versionModel = await apiClient.request(API.region.version);
    int cloudVersion = versionModel.data?['version'] ?? 0;
    if (_regionBox.containsKey('version')) {
      int version = _regionBox.get('version');
      if (version < cloudVersion) {
        await updateRegion();
        _regionBox.put('version', cloudVersion);
      } else {
        // var baseModel = await apiClient.request(API.region.all);
        // if (baseModel.code != 0) return [];
          // _regions=[];
        _regions = (_regionBox.get('regions') as List)
            .cast<ChinaRegionModel>()
            .toList();
      }
    } else {
      _regionBox.put('version', cloudVersion);
      await updateRegion();
    }
  }

  Future updateRegion() async {
    var baseModel = await apiClient.request(API.region.all);
    if (baseModel.code != 0) return [];
    // _regions=[];
    _regions = (baseModel.data as List<dynamic>)
        .map((e) => ChinaRegionModel.fromJson(e))
        .toList();
    await _regionBox.delete('regions');
    await _regionBox.put('regions', _regions);
    notifyListeners();
  }

  List<ChinaRegionModel> get hotCities {
    var hots = [
      '杭州',
      '北京',
      '上海',
      '广州',
      '深圳',
      '成都',
      '重庆',
      '天津',
      '南京',
      '武汉',
      '苏州',
      '西安'
    ];
    List hotss = [
      '杭州',
      '北京',
      '上海',
      '广州',
      '深圳',
      '成都',
      '重庆',
      '天津',
      '南京',
      '武汉',
      '苏州',
      '西安'
    ];

    if (_regions.isEmpty) {
      return [];
    } else {
      var list = <ChinaRegionModel>[];
      //遍历省
      for (var element in _regions) {
        if (element.children == null) {
          break;
        }
        //遍历市
        for (var item in element.children!) {
          //遍历热门城市列表 若其中包含此城市名则加入列表
          for (var i in hots) {
            if (item.name.contains(i)) {
              hotss.remove(i);
              list.add(item);
              if (hotss.isEmpty) {
                return list;
              }
            }
          }
        }
      }
      return list;
    }
  }

  /// 车300城市数据
  List<CityModel> _cities = [];
  List<AzCityModel> _azCities = [];

  List<CityModel> get cities => _cities;

  List<AzCityModel> get azCities => _azCities;

  Future initCities() async {
    final cityBox = await Hive.openBox('cities');
    _azCities = cityBox.values.cast<AzCityModel>().toList();
    if (_azCities.isEmpty) {
      try {
        var base = await apiClient.request(API.region.cities);
        if (base.code == 0) {
          _cities = (base.data as List)
              .map((e) => CityModel.fromJson(e))
              .toList();
          _azCities = _cities
              .map((e) => AzCityModel(
                  cityId: e.id,
                  cityName: e.cityName,
                  provId: e.provId,
                  provName: e.provName))
              .toList();
          SuspensionUtil.sortListBySuspensionTag(_azCities);
          SuspensionUtil.setShowSuspensionStatus(_azCities);
          cityBox.addAll(_azCities);
        } else {
          CloudToast.show(base.msg);
        }
      } catch (e) {
        CloudToast.show('获取城市数据失败');
      }
    }
  }

  List<AzCityModel> get hotCarThreeCities {
    final hots = [
      '宁波',
      '北京',
      '上海',
      '广州',
      '深圳',
      '成都',
      '重庆',
      '天津',
      '南京',
      '武汉',
      '苏州',
      '西安'
    ];
    return _handleCities<AzCityModel>(
            (e) => hots.contains(e.cityName), _azCities)
        .toList();
  }

  Iterable<T> _handleCities<T>(bool Function(T e) filter, List<T> list) sync* {
    final it = list.iterator;
    while (it.moveNext()) {
      if (filter(it.current)) yield it.current;
    }
  }
}
