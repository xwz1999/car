import 'package:azlistview/azlistview.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lpinyin/lpinyin.dart';

part 'az_city_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class AzCityModel extends ISuspensionBean {
  @HiveField(0)
  final int cityId;
  @HiveField(1)
  final String cityName;
  @HiveField(2)
  final int provId;
  @HiveField(3)
  final String provName;

  String get tag {
    var upperFirst =
        PinyinHelper.getFirstWordPinyin(cityName).substring(0, 1).toUpperCase();
    if (upperFirst == "★") return '★ 热门城市';
    return RegExp('[A-Z]').hasMatch(upperFirst) ? upperFirst : "#";
  }

  @override
  String getSuspensionTag() {
    return tag;
  }

  AzCityModel({
    required this.cityId,
    required this.cityName,
    required this.provId,
    required this.provName,
  });
}
