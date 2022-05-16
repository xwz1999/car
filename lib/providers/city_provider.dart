import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../constants/api/api.dart';
import '../model/region/china_region_model.dart';
import '../utils/new_work/api_client.dart';

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
}
