import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/model/order/order_statistics_model.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/ui/user/user_order/sales_orders_page.dart';
import 'package:cloud_car/ui/user/user_order/status.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

import '../../home/manager_container_item.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  OrderStatisticsModel _model = OrderStatisticsModel.init;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero,()async{
      _model = await OrderFunc.getStatisticNum();
      setState(() {});
    });
  }

  @override
  void dispose() {
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
        title: Text('我的订单',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: GridView.count(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 32.w, right: 32.w),
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 24.w,
        //横轴间距
        crossAxisSpacing: 40.w,
        childAspectRatio: 200 / 176,
        children: [
          ManagerContainerItem(
            onTap: () {
              Get.to(() => const SalesOrderPage(
                    orderType: OrderType.sale,
                  ));
            },
            text: '售车订单',
            num: '${_model.saleCount}',
          ),
          UserTool.userProvider.userInfo.businessAscription ==
                  BusinessAscription.normal
              ? ManagerContainerItem(
                  onTap: () {
                    Get.to(() =>
                        const SalesOrderPage(orderType: OrderType.personal));
                  },
                  text: '个人寄卖',
                  num: '${_model.consignmentCount}',
                )
              : ManagerContainerItem(
                  onTap: () {
                    Get.to(() =>
                        const SalesOrderPage(orderType: OrderType.carDealer));
                  },
                  text: '车商寄卖',
                  num: '${_model.consignmentCount}',
                ),
          ManagerContainerItem(
            onTap: () {
              Get.to(() => const SalesOrderPage(orderType: OrderType.callCar));
            },
            text: '叫车订单',
            num: '${_model.callCarCount}',
          ),
          ManagerContainerItem(
            onTap: () {
              Get.to(() => const SalesOrderPage(orderType: OrderType.pushOrder));
            },
            text: '发布订单',
            num: '${_model.businessConsignmentCount}',
          )
        ],
      ),
    );
  }
}
