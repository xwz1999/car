import 'package:azlistview/azlistview.dart';
import 'package:cloud_car/base/base_style.dart';
import 'package:cloud_car/model/region/az_city_model.dart';
import 'package:cloud_car/providers/city_provider.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/utils/utils.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarThreeCityListPage extends StatefulWidget {
  final Function(AzCityModel city) onSelect;

  const CarThreeCityListPage({super.key, required this.onSelect});

  @override
  _CarThreeCityListPageState createState() => _CarThreeCityListPageState();
}

class _CarThreeCityListPageState extends State<CarThreeCityListPage> {
  String imgFavorite = Assets.icons.barToTop.path;
  double susItemHeight = 36;

  @override
  Widget build(BuildContext context) {
    var cityList = Provider.of<CityProvider>(context, listen: false).azCities;
    return CloudScaffold.normal(
      appbar: SizedBox(
        height: 88.w,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 32.w),
            child: Text(
              "热门城市",
              style: TextStyle(color: BaseStyle.color999999, fontSize: 24.sp),
            ),
          ),
          _buildHeader(),
          Expanded(
            child: AzListView(
              data: cityList,
              itemCount: cityList.length,
              itemBuilder: (BuildContext context, int index) {
                AzCityModel model = cityList[index];
                return ListTile(
                  title: Text(model.cityName),
                  onTap: () => widget.onSelect(model),
                );
              },
              susItemHeight: susItemHeight,
              susItemBuilder: (BuildContext context, int index) {
                AzCityModel model = cityList[index];
                String tag = model.getSuspensionTag();
                if (imgFavorite == tag) {
                  return const SizedBox.shrink();
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
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        children: [
          GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: UserTool.cityProvider.hotCarThreeCities.length,
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
                return _getCityView(
                    UserTool.cityProvider.hotCarThreeCities[index],
                    isLocation: index == 0);
              }),
        ],
      ),
    );
  }

  _getCityView(AzCityModel model, {bool isLocation = false}) {
    return GestureDetector(
      onTap: () => widget.onSelect(model),
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
              model.cityName,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
