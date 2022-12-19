import 'package:cloud_car/model/region/az_city_model.dart';
import 'package:cloud_car/model/region/china_region_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveStore {
  static Box? _appBox;

  static Box? get appBox => _appBox;
  static Box? _userBox;

  static Box? get userBox => _userBox;
  static Box? _dataBox;

  static Box? get dataBox => _dataBox;

      static Box? _carBox;
  static Box? get carBox => _carBox;



  static Future init() async {
    if (!kIsWeb) {
      var dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      Hive.registerAdapter(ChinaRegionModelAdapter()); //type 0
      Hive.registerAdapter(AzCityModelAdapter());
      _appBox = await Hive.openBox('app');
      _userBox = await Hive.openBox('userBox');
      _dataBox = await Hive.openBox('dataBox');
      _carBox =await Hive.openBox('car');
    }
  }
}
