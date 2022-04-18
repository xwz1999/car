
import 'package:cloud_car/ui/home/car_manager/direct_sale/car_detail_item.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_car_detail_item.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_car_owner_item.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_car_report_page.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_car_source_item.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

import 'car_image_page.dart';

class EditCarPage extends StatefulWidget {
  const EditCarPage({Key? key}) : super(key: key);

  @override
  _EditCarPageState createState() => _EditCarPageState();
}

class _EditCarPageState extends State<EditCarPage>  with SingleTickerProviderStateMixin{
  late TabController _tabController;
  List tabs = [];

  @override
  void initState() {
    ///自己发布的 tab2个 否则1个
    tabs = ['车辆图片','基本信息','车辆报告','来源信息','车主信息','牌证信息','价格信息'];
    _tabController = TabController(initialIndex: 0, length: tabs.length, vsync: this);

    super.initState();

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const CloudBackButton(
              isSpecial: true,
            ),
            backgroundColor: kForeGroundColor,
            title: Text('编辑车辆',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
            actions: [
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  padding: EdgeInsets.only(right: 32.w),
                  child: Text(
                    '提交', style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 28.sp,
                  ),
                  ),
                ),
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight - 10.w),
              child: Container(
                height: kToolbarHeight - 10.w,
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 40.w),
                child: TabBar(
                    onTap: (index) {
                      setState(() {});
                    },
                    isScrollable: true,
                    labelPadding: EdgeInsets.symmetric(
                        vertical: 10.w, horizontal: 10.w),
                    controller: _tabController,
                    indicatorWeight: 3,
                    labelColor: kPrimaryColor,
                    unselectedLabelColor: BaseStyle.color333333,
                    indicatorPadding: EdgeInsets.symmetric(
                        horizontal: 30.w, vertical: 0.w),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                    ),
                    indicator: const BoxDecoration(),
                    indicatorColor: kPrimaryColor,
                    tabs: [

                      _tab(0, tabs[0]),
                      _tab(1, tabs[1]),
                      _tab(2, tabs[2]),
                      _tab(3, tabs[3]),
                      _tab(4, tabs[4]),
                      _tab(5, tabs[5]),
                      _tab(6, tabs[6]),


                    ]),
                decoration: BoxDecoration(
                    color: Colors.white,

                    border: Border(
                        bottom: BorderSide(
                            color: BaseStyle.colordddddd, width: 2.w))),
              ),
            )
        ),
        backgroundColor: bodyColor,
        extendBody: true,
        body:TabBarView(
          controller: _tabController,
          children: const [
            CarImageItem(),
            EditCarDetailItem(),

            EditCarReportPage(),
            EditCarSourceItem(),
            EditCarOwnerItem(),


            CarDetailItem(),
            CarDetailItem(),
          ],
        ),

    );
  }
  _tab(int index, String text) {
    return SizedBox(width: 140.w, child: Text(text));
  }
}
