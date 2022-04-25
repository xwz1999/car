import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../constants/api/api.dart';
import '../model/region/china_region_model.dart';
import '../utils/hive_store.dart';
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
}
