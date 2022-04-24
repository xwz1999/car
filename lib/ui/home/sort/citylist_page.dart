import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lpinyin/lpinyin.dart';

import '../models.dart';

typedef CityCallback = Function(String city);

class CityListPage extends StatefulWidget {
  final CityCallback cityCallback;

  const CityListPage({Key? key, required this.cityCallback}) : super(key: key);
  @override
  _CityListPageState createState() =>
      _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  List<CityModel> cityList = [];
  double susItemHeight = 36;
  String imgFavorite = Assets.icons.barToTop.path;

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
        cityList.add(CityModel.fromJson(v));
      }
      _handleList(cityList);
    });
  }

  void _handleList(List<CityModel> list) {
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
        CityModel(
            name: 'header',
            tagIndex: imgFavorite)); //index bar support local images.

    setState(() {});
  }

  Widget _buildHeader() {
    List<CityModel> hotCityList = [];
    hotCityList.addAll([
      CityModel(name: "杭州"),
      CityModel(name: "北京"),
      CityModel(name: "上海"),
      CityModel(name: "广州"),
      CityModel(name: "深圳"),
      CityModel(name: "成都"),

      CityModel(name: "重庆"),
      CityModel(name: "天津"),
      CityModel(name: "南京"),
      CityModel(name: "苏州"),
      CityModel(name: "武汉"),
      CityModel(name: "西安"),
    ]);

    return

      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          children: [

            GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: hotCityList.length,
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                    crossAxisCount: 4,
                    //纵轴间距
                    mainAxisSpacing: 6,
                    //横轴间距
                    crossAxisSpacing: 10,
                    //子组件宽高长度比例
                    childAspectRatio: 152/56),
                itemBuilder: (BuildContext context, int index) {
                  //Widget Function(BuildContext context, int index)
                  return _getCityView(
                      hotCityList[index].name,isLocation: index==0);
                }),
          ],
        ),
      );
  }


  _getCityView(String name,{bool isLocation = false}){
    return GestureDetector(
      onTap: (){
        Get.back();
        widget.cityCallback(name);
      },
      child: Container(
        width: 56.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.w),
          border: Border.all(color: const Color(0xFFEEEEEE),width: 1.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name,style: Theme.of(context).textTheme.subtitle2,)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 16.w,horizontal: 32.w),
          child: Text("热门城市",style: TextStyle(
            color: BaseStyle.color999999,fontSize: 24.sp
          ),),
        ),
        Expanded(
          child: AzListView(
            data: cityList,
            itemCount: cityList.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) return _buildHeader();
              CityModel model = cityList[index];
              return Utils.getListItem(context, model, (name, id) {
                Get.back();
                widget.cityCallback(name);


              });
            },
            susItemHeight: susItemHeight,
            susItemBuilder: (BuildContext context, int index) {
              CityModel model = cityList[index];
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

              indexHintDecoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.icons.barBubbleGray.path),
                  fit: BoxFit.contain,
                ),
              ),
              selectTextStyle: const TextStyle(
                  fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
              selectItemDecoration:
              const BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
              indexHintAlignment: Alignment.centerRight,
              indexHintChildAlignment: Alignment.center,
              indexHintTextStyle: TextStyle(fontSize: 40.sp, color: Colors.black87),

              indexHintOffset: const Offset(-10, 0),
              indexHintWidth: 100.w,
              indexHintHeight: 100.w,
              localImages: [imgFavorite], //local images.
            ),
          ),
        ),
      ],
    );
  }
}