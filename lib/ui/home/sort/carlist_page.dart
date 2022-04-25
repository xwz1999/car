

import 'package:azlistview/azlistview.dart';
import 'package:cloud_car/model/sort/sort_brand_model.dart';
import 'package:cloud_car/ui/home/sort/sort_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:lpinyin/lpinyin.dart';

import '../models.dart';
import 'choose_car_next_page.dart';

typedef CarCallback = Function(String city,int id);

class CarListPage extends StatefulWidget {
   final CarCallback carCallback;

  const CarListPage({Key? key, required this.carCallback}) : super(key: key);
  @override
  _CarListPageState createState() =>
      _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  List<CityModel> cityList = [];
  List<SortBrandModel> brandList =[ ];
  double susItemHeight = 36;
  String imgFavorite = Assets.icons.barToTop.path;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () {
      loadData();
    });
  }

  void loadData() async {
    brandList = await SortFunc.getBrandList();
    if(brandList.isNotEmpty){
      for (var v in brandList) {
        cityList.add(CityModel(
          name: v.name,id: v.id));
      }
      _handleList(cityList);

    }

        //加载城市列表
    // rootBundle.loadString('assets/data/china.json').then((value) {
    //   cityList.clear();
    //   Map countyMap = json.decode(value);
    //   List list = countyMap['china'];
    //   for (var v in list) {
    //     cityList.add(CityModel.fromJson(v));
    //   }
    //   _handleList(cityList);
    // });

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


    setState(() {});
  }

  // Widget _buildHeader() {
  //   List<CityModel> hotCityList = [];
  //   hotCityList.addAll([
  //     CityModel(name: "奥迪"),
  //     CityModel(name: "奔驰"),
  //     CityModel(name: "宝马"),
  //     CityModel(name: "雷克萨斯"),
  //     CityModel(name: "沃尔沃"),
  //   ]);
  //
  //   return
  //
  //     Column(
  //       children: [
  //
  //         GridView.builder(
  //           shrinkWrap: true,
  //           padding: EdgeInsets.zero,
  //           itemCount: 5,
  //           //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
  //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //             //横轴元素个数
  //               crossAxisCount: 5,
  //               //纵轴间距
  //               mainAxisSpacing: 6,
  //               //横轴间距
  //               crossAxisSpacing: 24,
  //               //子组件宽高长度比例
  //               childAspectRatio: 1),
  //           itemBuilder: (BuildContext context, int index) {
  //             //Widget Function(BuildContext context, int index)
  //             return _getCityView(
  //                 hotCityList[index].name,isLocation: index==0);
  //           }),
  //       ],
  //     );
  // }


  // _getCityView(String name,{bool isLocation = false}){
  //   return Container(
  //     width: 54.w,
  //     padding: EdgeInsets.symmetric(vertical:14.w ),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(4.w),
  //       border: Border.all(color: const Color(0xFFEEEEEE),width: 1.w),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text(name,style: Theme.of(context).textTheme.subtitle2,)
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kForeGroundColor,
      child: Column(
        children: [

          Expanded(
            child: AzListView(
              data: cityList,
              itemCount: cityList.length,
              itemBuilder: (BuildContext context, int index) {
                // if (index == 0) return _buildHeader();
                CityModel model = cityList[index];
                return Utils.getListItem(context, model, (name, id) {
                  print(1111111111111);
                    Get.to(()=>ChooseCarNextPage(name: name, callback: (String name, int id) {
                      widget.carCallback(name,id);
                    }, id: id,));
                });

                  // Utils.getListItem(context, model,
                  //   susHeight: susItemHeight);
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
      ),
    );
  }
}
