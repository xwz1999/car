import 'package:cloud_car/model/customer/customer_statistics_model.dart';
import 'package:cloud_car/ui/home/func/customer_func.dart';
import 'package:cloud_car/ui/home/user_manager/user_manager_detail_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../manager_container_item.dart';

enum CustomerClassify {
  normal(1, '浏览客户'),
  intended(2, '意向客户'),
  invite(3, '邀请注册'),
  deal(4, '成交客户');

  static CustomerClassify getValue(int value) =>
      CustomerClassify.values.firstWhere((element) => element.typeNum == value);
  final int typeNum;
  final String typeStr;

  const CustomerClassify(this.typeNum, this.typeStr);
}

class UserManagerPage extends StatefulWidget {
  const UserManagerPage({super.key});

  @override
  _UserManagerPageState createState() => _UserManagerPageState();
}

class _UserManagerPageState extends State<UserManagerPage> {
  List<dynamic>? data;

  late CustomerStatisticsModel? _model = const CustomerStatisticsModel(
      intentionCount: 0, doneCount: 0, registerCount: 0, browseCount: 0);

  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _easyRefreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _easyRefreshController.callRefresh();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('客户管理',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text('客户统计',
                style: TextStyle(
                    color: BaseStyle.color333333,
                    fontSize: BaseStyle.fontSize32,
                    fontWeight: FontWeight.bold)),
          ),
          24.hb,
          Expanded(
            child: EasyRefresh(
              firstRefresh: true,
              header: MaterialHeader(),
              footer: MaterialFooter(),
              scrollController: _scrollController,
              controller: _easyRefreshController,
              onRefresh: () async {
                _model = await CustomerFunc.getCustomerStatistics();
                setState(() {});
              },
              child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //横轴元素个数
                      crossAxisCount: 3,
                      //纵轴间距
                      mainAxisSpacing: 24.w,
                      //横轴间距
                      crossAxisSpacing: 40.w,
                      //子组件宽高长度比例
                      childAspectRatio: 200 / 176),
                  itemBuilder: (BuildContext context, int index) {
                    //Widget Function(BuildContext context, int index)
                    return GestureDetector(
                        onTap: () {
                          Get.to(() => const UserManagerDetailPage());
                        },
                        child: getItem(index));
                  }),
            ),
          ),
        ],
      ),
    );
  }

  getItem(int index) {
    switch (index) {
      case 0:
        return ManagerContainerItem(
          text: '浏览客户',
          num: '${_model?.browseCount}',
        );
      case 1:
        return ManagerContainerItem(
          text: '意向客户',
          num: '${_model?.intentionCount}',
        );
      case 2:
        return ManagerContainerItem(
          text: '邀请注册',
          num: '${_model?.registerCount}',
        );
      case 3:
        return ManagerContainerItem(
          text: '成交客户',
          num: '${_model?.doneCount}',
        );
    }
  }
}
