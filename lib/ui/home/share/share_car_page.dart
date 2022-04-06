import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/model/car_item_model.dart';
import 'package:cloud_car/ui/home/share/share_car_detail_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widget/button/cloud_back_button.dart';
import '../../../widget/button/colud_check_radio.dart';
import '../../../widget/car_item_widget.dart';

typedef CarCallback = Function(String city);

class ShareCarPage extends StatefulWidget {
  const ShareCarPage({
    Key? key,
  }) : super(key: key);

  @override
  _ShareCarPageState createState() => _ShareCarPageState();
}

class _ShareCarPageState extends State<ShareCarPage> {
  //选中的item
  final List<int> _selectIndex = [];
  final List<CarItemModel> _chooseModels = [];

  List<CarItemModel> models = [
    CarItemModel(
      name: '奔驰CLE 插电混动 纯电动续航103km',
      time: '2019年5月',
      distance: '20.43万公里',
      standard: '国六',
      url: Assets.images.homeBg.path,
      price: '27.43万',
    ),
    CarItemModel(
      name: '奔驰CLE 插电混动 纯电动续航103km',
      time: '2019年5月',
      distance: '20.43万公里',
      standard: '国六',
      url: Assets.images.homeBg.path,
      price: '27.43万',
    ),
    CarItemModel(
      name: '奔驰CLE 插电混动 纯电动续航103km',
      time: '2019年5月',
      distance: '20.43万公里',
      standard: '国六',
      url: Assets.images.homeBg.path,
      price: '27.43万',
    ),
    CarItemModel(
      name: '奔驰CLE 插电混动 纯电动续航103km',
      time: '2019年5月',
      distance: '20.43万公里',
      standard: '国六',
      url: Assets.images.homeBg.path,
      price: '27.43万',
    ),
    CarItemModel(
      name: '奔驰CLE 插电混动 纯电动续航103km',
      time: '2019年5月',
      distance: '20.43万公里',
      standard: '国六',
      url: Assets.images.homeBg.path,
      price: '27.43万',
    ),
    CarItemModel(
      name: '奔驰CLE 插电混动 纯电动续航103km',
      time: '2019年5月',
      distance: '20.43万公里',
      standard: '国六',
      url: Assets.images.homeBg.path,
      price: '27.43万',
    ),
    CarItemModel(
      name: '奔驰CLE 插电混动 纯电动续航103km',
      time: '2019年5月',
      distance: '20.43万公里',
      standard: '国六',
      url: Assets.images.homeBg.path,
      price: '27.43万',
    ),
  ];

  bool get _allSelect =>
      _selectIndex.length == models.length && _selectIndex.isNotEmpty;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('分享车辆',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: const Color(0xFFF6F6F6),
      extendBody: true,
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 20.w),
          itemBuilder: (context, index) {
            return _getItem(index, models[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              color: const Color(0xFFF6F6F6),
              height: 16.w,
            );
          },
          itemCount: models.length,
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 100.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            50.wb,
            GestureDetector(
              onTap: () {
                if (_allSelect) {
                  _selectIndex.clear();
                  _chooseModels.clear();
                } else {
                  _selectIndex.clear();
                  _chooseModels.clear();
                  _chooseModels.addAll(models);
                  _selectIndex
                      .addAll(List.generate(models.length, (index) => index));
                }
                setState(() {});
              },
              child: Container(
                width: 50.w,
                height: 60.w,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Container(
                      width: 44.w,
                      height: 44.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(_allSelect ? 1 : 0),
                        borderRadius: BorderRadius.circular(22.w),
                        border: Border.all(
                          color: (_allSelect
                              ? kPrimaryColor
                              : const Color(0xFF979797)),
                          width: 2.w,
                        ),
                      ),
                      child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: _allSelect ? 1 : 0,
                          child: Icon(
                            CupertinoIcons.checkmark,
                            color: Colors.white,
                            size: 28.w,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            10.wb,
            Text('全选',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: BaseStyle.fontSize28,
                    fontWeight: FontWeight.bold)),
            8.wb,
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (_selectIndex.isEmpty) {
                  BotToast.showText(text: '请先选择车辆');
                } else if (_selectIndex.length == 1) {
                  showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      builder: (BuildContext context) {
                        return const ShareCarDetailPage(
                          isMore: false,
                        );
                      });
                } else {
                  showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      builder: (BuildContext context) {
                        return const ShareCarDetailPage(
                          isMore: true,
                        );
                      });
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: 320.w,
                height: 72.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  gradient: const LinearGradient(
                    colors: <Color>[
                      Color(0xFF0593FF),
                      Color(0xFF027AFF),
                    ],
                  ),
                ),
                child: Text('确认分享',
                    style: TextStyle(
                        color: kForeGroundColor,
                        fontSize: BaseStyle.fontSize28,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            30.wb,
          ],
        ),
      ),
    );
  }

  _getItem(int index, CarItemModel model) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
      // width: double.infinity,
      height: 250.w,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (_selectIndex.contains(index)) {
                _selectIndex.remove(index);
                _chooseModels.remove(model);
              } else {
                _selectIndex.add(index);
                _chooseModels.add(model);
              }

              setState(() {});
            },
            child: Container(
              color: Colors.transparent,
              height: 230.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: double.infinity,
                alignment: Alignment.center,
                child: BeeCheckRadio(
                  value: index,
                  groupValue: _selectIndex,
                  //backColor: Colors.blue,
                  // indent: Container(
                  //   width: 24.w,
                  //   height: 24.w,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(22.w),
                  //       border: Border.all(color: Color(0xFFCCCCCC),width: 2.w)),
                  // ),
                ),
              ),
            ),
          ),
          Expanded(
            child: CarItemWidget(
              widgetPadding: EdgeInsets.zero,
              name: '奔驰CLE 插电混动 纯电动续航103km',
              time: '2019年5月',
              distance: '20.43万公里',
              standard: '国六',
              url: Assets.images.homeBg.path,
              price: '27.43万',
            ),
          ),
        ],
      ),
    );
  }
}
