import 'package:cloud_car/model/order/ordercount_model.dart';
import 'package:cloud_car/ui/user/user_order/sales_orders.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../home/manager_container_item.dart';
import '../interface/order_func.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  List<dynamic>? data;
  late OrdercountModel? _model = const OrdercountModel(
    callCarCount: 0,
    dealerConsignmentCount: 0,
    saleCount: 0,
    consignmentCount: 0,
  );
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _easyRefreshController.dispose();
    _scrollController.dispose();
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
      body: EasyRefresh(
          firstRefresh: true,
          header: MaterialHeader(),
          footer: MaterialFooter(),
          scrollController: _scrollController,
          controller: _easyRefreshController,
          onRefresh: () async {
            _model = await OrderFunc.getOrderCount();
            setState(() {});
          },
          child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 32.w, right: 32.w),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                  crossAxisCount: 3,
                  //纵轴间距
                  mainAxisSpacing: 10,
                  //横轴间距
                  crossAxisSpacing: 15,
                  //子组件宽高长度比例
                  childAspectRatio: 200 / 176),
              itemBuilder: (BuildContext context, int index) {
                //Widget Function(BuildContext context, int index)
                return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Get.to(() => const SalesOrder());
                          break;
                        case 1:
                          Get.to(() => const SalesOrder());
                          break;
                        case 2:
                          Get.to(() => const SalesOrder());
                          break;
                        case 3:
                          Get.to(() => const SalesOrder());
                          break;
                        case 4:
                          Get.to(() => const SalesOrder());
                          break;
                      }
                      //Get.to(() => const SalesOrder());
                    },
                    child: getItem(index));
              })),
    );
  }

  getItem(int index) {
    switch (index) {
      case 0:
        return ManagerContainerItem(
          text: '售车订单',
          num: '${_model?.saleCount}',
        );
      case 1:
        return ManagerContainerItem(
          text: '个人寄卖',
          num: '${_model?.consignmentCount}',
        );
      case 2:
        return ManagerContainerItem(
          text: '租车订单',
          num: '${_model?.dealerConsignmentCount}',
        );
      case 3:
        return ManagerContainerItem(
          text: '叫车订单',
          num: '${_model?.callCarCount}',
        );
      case 4:
        return ManagerContainerItem(
          text: '车商寄卖',
          num: '${_model?.consignmentCount}',
        );
    }
  }

//
// _getItem(String text) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//         padding: const EdgeInsets.only(left: 12),
//         child: Text(text,
//             style: TextStyle(
//                 color: BaseStyle.color333333,
//                 fontSize: BaseStyle.fontSize32,
//                 fontWeight: FontWeight.bold)),
//       ),
//       24.hb,
//       GridView.builder(
//           shrinkWrap: true,
//           padding: EdgeInsets.only(left: 32.w, right: 32.w),
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: 5,
//           //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               //横轴元素个数
//               crossAxisCount: 3,
//               //纵轴间距
//               mainAxisSpacing: 10,
//               //横轴间距
//               crossAxisSpacing: 15,
//               //子组件宽高长度比例
//               childAspectRatio: 200 / 176),
//           itemBuilder: (BuildContext context, int index) {
//             //Widget Function(BuildContext context, int index)
//             return GestureDetector(
//               onTap: () {
//                 Get.to(() => const SalesOrders());
//               },
//               child: const ManagerContainerItem(
//                 text: '浏览客户',
//                 num: '12',
//               ),
//             );
//           }),
//     ],
//   );
// }
}
