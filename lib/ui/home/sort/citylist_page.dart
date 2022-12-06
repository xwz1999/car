import 'package:azlistview/azlistview.dart';
import 'package:cloud_car/model/region/china_region_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../model/region/az_city_model.dart';
import '../../../model/region/city_model.dart';
import '../az_region_model.dart';
import 'car_three_city_list_page.dart';
import 'citylist_item_page.dart';

///适配新数据
typedef CityCallback = Function(ChinaRegionModel model);

class CityListPage extends StatefulWidget {
  final CityCallback cityCallback;

  const CityListPage({super.key, required this.cityCallback});

  @override
  _CityListPageState createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  List<AzRegionModel> cityList = [];
  List<ChinaRegionModel> chinaLists = [];

  // List<CityModel> chinaLists=[];
  List<ChinaRegionModel> hotLists = [];

  double susItemHeight = 36;
  String imgFavorite = Assets.icons.barToTop.path;
  List<AzRegionModel> hotCityList = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () {
      loadData();
    });
  }

  void loadData() async {
    hotLists = UserTool.cityProvider.hotCities;
    // print(hotLists);
    for (var element in hotLists) {
      hotCityList
          .add(AzRegionModel(name: element.name, model: element.children));
    }
    //加载城市列表
    chinaLists = UserTool.cityProvider.regions;
    // print("这是数据，${chinaLists}");
    for (ChinaRegionModel element in chinaLists) {
      // print(element.name);
      cityList.add(AzRegionModel(name: element.name, model: element.children));

      // for(int i=0;i<element.children!.length;i++){
      //   // print(element.children);
      //   // cityList.add(AzRegionModel(name: element.name, model: element.children![i]));
      //   cityList.add(AzRegionModel(name: element.children![i].name, model: element.children));
      //
      // }
    }
    // print("这是数据$cityList");
    // _handleList(cityList);
    _handleList(cityList);
  }

  // void _handleList(List<AzRegionModel> list) {
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
    // cityList.insert(
    //     0,
    //     AzRegionModel(
    //         name: 'header',
    //         tagIndex: imgFavorite)); //index bar support local images.

    setState(() {});
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
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
                  childAspectRatio: 152 / 56),
              itemBuilder: (BuildContext context, int index) {
                //Widget Function(BuildContext context, int index)
                return _getCityView(hotCityList[index], isLocation: index == 0);
              }),
        ],
      ),
    );
  }

  _getCityView(AzRegionModel model, {bool isLocation = false}) {
    return GestureDetector(
      onTap: () {
        
        // widget.cityCallback(model.model!);
        // widget.cityCallback(model[1]);
      },
      child: Container(
        width: 56.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.w),
          border: Border.all(color: const Color(0xFFEEEEEE), width: 1.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              model.name,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 32.w),
        //   child: Text(
        //     "热门城市",
        //     style: TextStyle(color: BaseStyle.color999999, fontSize: 24.sp),
        //   ),
        // ),
        // _buildHeader(),
        Expanded(
          child:
          AzListView(
            padding: EdgeInsets.symmetric(vertical: 30.w),
            data: cityList,
            itemCount: cityList.length,
            itemBuilder: (BuildContext context, int index) {
              // if (index == 0) return _buildHeader();
              AzRegionModel model = cityList[index];
              return Utils.getListItem(context, model, (name, id) async{
                // Get.to(()=>
                //
                // );
                await Get.to(() => CityListItemPage(
                  cityCallback: (ChinaRegionModel model) {
                    // print("这是数据${model.name}");
                    // print("这是数据${model.id}");
                    widget.cityCallback(model);
                  },
                  cityName: model.name,
                  cityList: model.model!,
                ));
                // widget.cityCallback(model.model!);
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

              indexHintDecoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.icons.barBubbleGray.path),
                  fit: BoxFit.contain,
                ),
              ),
              selectTextStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              selectItemDecoration: const BoxDecoration(
                  shape: BoxShape.circle, color: kPrimaryColor),
              indexHintAlignment: Alignment.centerRight,
              indexHintChildAlignment: Alignment.center,
              indexHintTextStyle:
              TextStyle(fontSize: 40.sp, color: Colors.black87),

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
