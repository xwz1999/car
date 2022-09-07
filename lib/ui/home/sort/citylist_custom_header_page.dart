import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:cloud_car/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lpinyin/lpinyin.dart';

import '../az_region_model.dart';

class CityListCustomHeaderPage extends StatefulWidget {
  const CityListCustomHeaderPage({super.key});

  @override
  _CityListCustomHeaderPageState createState() =>
      _CityListCustomHeaderPageState();
}

class _CityListCustomHeaderPageState extends State<CityListCustomHeaderPage> {
  List<AzRegionModel> cityList = [];
  double susItemHeight = 36;
  String imgFavorite = Utils.getImgPath('ic_favorite');

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      loadData();
    });
  }

  void loadData() async {
    //加载城市列表
    rootBundle.loadString('assets/data/china.json').then((value) {
      cityList.clear();
      Map countyMap = json.decode(value);
      List list = countyMap['china'];
      for (var v in list) {
        cityList.add(AzRegionModel.fromJson(v));
      }
      _handleList(cityList);
    });
  }

  void _handleList(List<AzRegionModel> list) {
    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp('[A-Z]').hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = '#';
      }
    }
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(list);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(cityList);

    // add header.
    cityList.insert(
        0,
        AzRegionModel(
            name: 'header',
            tagIndex: imgFavorite)); //index bar support local images.

    setState(() {});
  }

  Widget _buildHeader() {
    List<AzRegionModel> hotCityList = [];
    hotCityList.addAll([
      AzRegionModel(name: "北京市"),
      AzRegionModel(name: "广州市"),
      AzRegionModel(name: "成都市"),
      AzRegionModel(name: "深圳市"),
      AzRegionModel(name: "杭州市"),
      AzRegionModel(name: "武汉市"),
    ]);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 10.0,
        children: hotCityList.map((e) {
          return OutlinedButton(
            style: const ButtonStyle(
                //side: BorderSide(color: Colors.grey[300], width: .5),
                ),
            onPressed: () {
              if (kDebugMode) {
                print("OnItemClick: $e");
              }
              Navigator.pop(context, e);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(e.name),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            title: const Text("当前城市"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Icon(
                  Icons.place,
                  size: 20.0,
                ),
                Text(" 成都市"),
              ],
            )),
        const Divider(
          height: .0,
        ),
        Expanded(
          child: AzListView(
            data: cityList,
            itemCount: cityList.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) return _buildHeader();
              AzRegionModel model = cityList[index];
              return Utils.getListItem(context, model, (name, id) {

              });
            },
            susItemHeight: susItemHeight,
            susItemBuilder: (BuildContext context, int index) {
              AzRegionModel model = cityList[index];
              String tag = model.getSuspensionTag();
              if (imgFavorite == tag) {
                return Container();
              }
              return Utils.getSusItem(context, tag, susHeight: susItemHeight);
            },
            indexBarData: SuspensionUtil.getTagIndexList(cityList),
            indexBarOptions: IndexBarOptions(
              needRebuild: true,
              color: Colors.transparent,
              downColor: const Color(0xFFEEEEEE),
              localImages: [imgFavorite], //local images.
            ),
          ),
        ),
      ],
    );
  }
}
