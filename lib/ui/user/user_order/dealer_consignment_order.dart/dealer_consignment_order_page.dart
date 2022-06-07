import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/user/lists_model.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../../widget/car_widget.dart';

class DealerConsignmentOrderPage extends StatefulWidget {
  final Function callBack;

  const DealerConsignmentOrderPage({super.key, required this.callBack});

  @override
  State<DealerConsignmentOrderPage> createState() =>
      _DealerConsignmentOrderPageState();
}

class _DealerConsignmentOrderPageState
    extends State<DealerConsignmentOrderPage> {
  List<Widget> listWidget = []; //创建方法列表
  final List<ChooseItem> _sortList = [];
  List<ListsModel> _dealerConsignmentList = [];
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  int _page = 1;
  final int _size = 10;
  bool _onLoad = true;

  @override
  void initState() {
    super.initState();
    listWidget = [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.w)),
            color: kForeGroundColor),
        clipBehavior: Clip.antiAlias,
        child: ScreenWidget(
          pickString: '',
          childAspectRatio: 200 / 56,
          callback: (String item, int value) {
            if (kDebugMode) {
              print(item);
            }

            ///调研接口 按照item进行排序
            // screenControl.screenHide();
            setState(() {});
          },
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 3,
          itemList: _sortList,
        ),
      ),
    ];
  }

  String text = '全部';

  @override
  void dispose() {
    _easyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.callBack();
      },
      child: Column(
        children: [
          SizedBox(
            height: kToolbarHeight + 50.w,
          ),
          SizedBox(
            height: 88.w,
            child: CarWidget(
                items: const ['全部', '审核中', '已驳回', '在售', '已售', '交易取消'],
                callBack: (name) {
                  text = name;
                  setState(() {});
                }),
          ),
          Expanded(
            child: EasyRefresh(
              firstRefresh: true,
              header: MaterialHeader(),
              footer: MaterialFooter(),
              controller: _easyRefreshController,
              onRefresh: () async {
                _page = 1;
                _dealerConsignmentList =
                    await OrderFunc.getDealerLists(page: _page, size: _size);
                //_DealerConsignmentList = [
                // const ListsModel(
                //     id: 13,
                //     orderSn: '202205120008',
                //     status: 0,
                //     auditStatus: 0,
                //     modeName: "2020款 奥迪A4L 45 TFSI quattro 臻选致雅型",
                //     licensingDate: 1640966400,
                //     mileage: '1',
                //     price: '11',
                //     createdAt: 1652322521),
                // ];
                _onLoad = false;
                setState(() {});
              },
              onLoad: () async {
                _page++;
                var baseList = await apiClient.requestList(
                    API.order.dealerConsignmentOrderPage,
                    data: {'page': _page, 'size': _size});
                if (baseList.nullSafetyTotal > _dealerConsignmentList.length) {
                  _dealerConsignmentList.addAll(baseList.nullSafetyList
                      .map((e) => ListsModel.fromJson(e))
                      .toList());
                } else {
                  _easyRefreshController.finishLoad(noMore: true);
                }
                setState(() {});
              },
              child: _onLoad
                  ? const SizedBox()
                  : _dealerConsignmentList.isEmpty
                      ? const NoDataWidget(
                          text: '暂无相关车辆信息',
                          paddingTop: 300,
                        )
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return _getCar(_dealerConsignmentList[index]);
                          },
                          itemCount: _dealerConsignmentList.length),
            ),
          ),
        ],
      ),
    );
  }

  _getCar(ListsModel model) {
    var a = 0;
    return Offstage(
        offstage: text == '全部' ? a == 1 : model.carStatusEnum.str != text,
        //text == '全部' ? false : model.carStatusEnum.carProgressNum != text,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
          child: GestureDetector(
            onTap: () {
              // Get.to(() => DealerConsignmentSigned(
              //       status: model.statusEnum,
              //       price: model.price,
              //       id: model.id,
              //
              //       auditStatus: model.auditStatus,
              //       //stat: '审核中',
              //     ));

              //   case 0:
              //     Get.to(() => const DealerConsignmentRejected());
              //     break;
              // }
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
                decoration: BoxDecoration(
                    color: kForeGroundColor,
                    borderRadius: BorderRadius.circular(16.w)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0.w),
                      child: Text(
                        model.carStatusEnum.str,
                        style: TextStyle(
                            color: getColor(
                              model,
                            ),
                            fontSize: BaseStyle.fontSize28),
                      ),
                    ),
                    // 24.hb,
                    Row(
                      children: [
                        SizedBox(
                          width: 196.w,
                          height: 150.w,
                          child: const CloudImageNetworkWidget.car(
                            urls: [],
                          ),
                        ),
                        20.wb,
                        SizedBox(
                          width: 406.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(model.modeName,
                                  style: TextStyle(
                                      fontSize: BaseStyle.fontSize28,
                                      color: BaseStyle.color111111)),
                              32.hb,
                              Padding(
                                padding: EdgeInsets.only(right: 16.w),
                                child: getText(
                                    DateUtil.formatDateMs(
                                        model.licensingDate.toInt() * 1000,
                                        format: 'yyyy年MM月'),
                                    '${model.mileage}万公里'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    32.hb,
                  ],
                )),
          ),
        ));
  }

  getText(String time, String distance) {
    return Row(
      children: [
        //Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            time,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        ),
        16.wb,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            distance,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        )
        // Padding(padding: EdgeInsets.symmetric(horizontal: 24.w)),
        // Chip(
        //   label: Text(num),
        //   labelPadding: EdgeInsets.only(left: 8.w, top: 8.w),
        //   backgroundColor: const Color(0xFF027AFF).withOpacity(0.08),
        //   labelStyle: TextStyle(
        //       fontSize: BaseStyle.fontSize20, color: const Color(0xFF027AFF)),
        //   shape:
        //       BeveledRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
        // ),
        // ChipTheme(
        //     data: ChipThemeData(
        //       backgroundColor: const Color(0xFF4F5A74).withOpacity(0.08),
        //       labelStyle: TextStyle(
        //           fontSize: BaseStyle.fontSize20,
        //           color: const Color(0xFF4F5A74)),
        //       shape: BeveledRectangleBorder(
        //           borderRadius: BorderRadius.circular(4.w)),
        //       labelPadding: EdgeInsets.only(left: 8.w, top: 8.w),
        //     ),
        //     child: Wrap(
        //       children: [Chip(label: Text(time)), Chip(label: Text(distance))],
        //     ))
      ],
    );
  }

  Color getColor(ListsModel model) {
    if (model.status == 0) {
      return const Color(0xFF666666);
    } else if (model.status == 1) {
      if (model.auditStatus == 3) {
        return Colors.red;
      } else {
        return const Color(0xFFFE8029);
      }
    } else {
      return const Color(0xFF027AFF);
    }
  }

// getTitle(String title) {
//   return Text(
//     title,
//     style: Theme.of(context).textTheme.subtitle2,
//   );
// }
}

///
