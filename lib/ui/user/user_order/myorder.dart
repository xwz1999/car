import 'package:cloud_car/model/order/order_statistics_model.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/ui/user/user_order/sales_orders.dart';
import 'package:cloud_car/utils/headers.dart';
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

  Future _getStatisticsNum() async {
    _model = await OrderFunc.getStatisticNum();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getStatisticsNum();
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
        mainAxisSpacing: 15,
      crossAxisSpacing: 10,
        childAspectRatio: 200 / 176,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(()=> const SalesOrder());
            },
            child: ManagerContainerItem(
              text: '售车订单',
              num: '${_model.saleCount}',
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(()=> const SalesOrder());
            },
            child: ManagerContainerItem(
              text: '个人寄卖',
              num: '${_model.consignmentCount}',
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(()=> const SalesOrder());
            },
            child: ManagerContainerItem(
              text: '租车订单',
              num: '${_model.dealerConsignmentCount}',
            ),
          ),
            GestureDetector(
            onTap: () {
              Get.to(()=> const SalesOrder());
            },
            child: ManagerContainerItem(
              text: '车商寄卖',
              num: '${_model.consignmentCount}',
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(()=> const SalesOrder());
            },
            child: ManagerContainerItem(
              text: '叫车订单',
              num: '${_model.callCarCount}',
            ),
          )
        ],
      ),
    );
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
