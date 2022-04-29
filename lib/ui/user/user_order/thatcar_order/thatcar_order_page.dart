import 'package:cloud_car/ui/user/user_order/thatcar_order/thatcar_order_complete.dart';
import 'package:cloud_car/ui/user/user_order/thatcar_order/thatcar_order_complete_other.dart';
import 'package:cloud_car/ui/user/user_order/thatcar_order/thatcar_order_unpaid.dart';
import 'package:cloud_car/ui/user/user_order/thatcar_order/thatcar_order_unpaid_other.dart';

import 'package:cloud_car/utils/headers.dart';

import 'package:cloud_car/widget/car_widget.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThatcarOrderPage extends StatefulWidget {
  final Function callBack;
  const ThatcarOrderPage({
    Key? key,
    required this.callBack,
  }) : super(key: key);

  @override
  State<ThatcarOrderPage> createState() => _ThatcarOrderPageState();
}

class _ThatcarOrderPageState extends State<ThatcarOrderPage> {
  List<Widget> listWidget = []; //创建方法列表
  //List<ChooseItem> _sortList = [];
  final List<ChooseItem> _sortList = [];
  List carList = [
    {
      'judge': false,
      'judgename': '待支付',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'pice1name': '叫车总价',
      'pice1': '100.00',
      'picename': '已付金额',
      'pice': '0.00',
      'buttomname': '',
    },
    {
      'judge': false,
      'judgename': '待交车',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'pice1name': '叫车总价',
      'pice1': '100.00',
      'picename': '已付金额',
      'pice': '100.00',
      'buttomname': '',
    },
    {
      'judge': false,
      'judgename': '已完成',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'pice1name': '叫车总价',
      'pice1': '100.00',
      'picename': '已付金额',
      'pice': '100.00',
      'buttomname': '',
    },
    {
      'judge': false,
      'judgename': '已退款',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'pice1name': '叫车总价',
      'pice1': '100.00',
      'picename': '已付金额',
      'pice': '100.00',
      'buttomname': '',
    },
  ];

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.callBack();
        },
        child: Column(
          children: [
            const SizedBox(
              height: kToolbarHeight + 10,
            ),
            SizedBox(
              height: 88.w,
              child: CarWidget(
                items: const [
                  '全部',
                  '待支付',
                  '待公交',
                  '已完成',
                ],
                callBack: (name) {
                  setState(() {});
                },
              ),
            ),
            16.hb,
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return getCar(carList[index]);
                  },
                  itemCount: carList.length),
            ),
          ],
        ));
  }

  getCar(item) {
    late bool bl = true;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
        child: GestureDetector(
          onTap: () {
            switch (item['judgename']) {
              case '待支付':
                Get.to(() => bl == true
                    ? const ThatcarUnpaid(
                        stat: '待支付',
                      )
                    : const UnpaidOther(
                        stat: '待支付',
                      ));
                break;
              case '待交车':
                Get.to(() => bl
                    ? const ThatcarUnpaid(
                        stat: '待交车',
                      )
                    : const UnpaidOther(
                        stat: '待交车',
                      ));
                break;
              case '已完成':
                Get.to(() => bl
                    ? const ThatcarComplete(
                        stat: '已完成',
                      )
                    : const Complete0ther(
                        stat: '已完成',
                      ));
                break;
              case '已退款':
                Get.to(() => bl
                    ? const ThatcarComplete(
                        stat: '已退款',
                      )
                    : const Complete0ther(
                        stat: '已退款',
                      ));
                break;
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
            decoration: BoxDecoration(
                color: kForeGroundColor,
                borderRadius: BorderRadius.circular(16.w)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(left: 0.w),
                child: Text(
                  item['judgename'],
                  style: TextStyle(
                      color: item['judgename'] != '已退款'
                          ? const Color(0xFF027AFF)
                          : const Color(0xFF666666),
                      fontSize: BaseStyle.fontSize28),
                ),
              ),
              // 24.hb,
              Row(
                children: [
                  SizedBox(
                    width: 196.w,
                    height: 150.w,
                    child: Image.asset(item['url']),
                  ),
                  20.wb,
                  SizedBox(
                    width: 406.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(item['title'],
                            style: TextStyle(
                                fontSize: BaseStyle.fontSize28,
                                color: BaseStyle.color111111)),
                        32.hb,
                        Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: getText('过户0次', '2020年10月', '20.43万公里',
                              item['judgename']),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              40.hb,
              SizedBox(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        child: Text(
                          item['pice1name'],
                          style: TextStyle(
                              fontSize: BaseStyle.fontSize28,
                              color: BaseStyle.color999999),
                        ),
                      ),
                      16.wb,
                      SizedBox(
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: '¥',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: item['pice1'],
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                        ])),
                      ),
                      56.wb,
                      SizedBox(
                        child: Text(
                          item['picename'],
                          style: TextStyle(
                              fontSize: BaseStyle.fontSize28,
                              color: BaseStyle.color999999),
                        ),
                      ),
                      16.wb,
                      SizedBox(
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: '¥',
                              style: TextStyle(
                                  color: item['judgename'] == '已取消'
                                      ? const Color(0xFF333333)
                                      : const Color(0xFFFF3B02),
                                  fontSize: BaseStyle.fontSize24,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: item['pice'],
                              style: TextStyle(
                                  color: item['judgename'] == '已取消'
                                      ? const Color(0xFF333333)
                                      : const Color(0xFFFF3B02),
                                  fontSize: BaseStyle.fontSize28,
                                  fontWeight: FontWeight.bold)),
                        ])),
                      ),
                    ],
                  ),
                ],
              ))
            ]),
          ),
        ));
  }

  getText(String num, String time, String distance, String conditions) {
    return Row(
      children: [
        //Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: conditions != '已退款'
                  ? const Color(0xFF027AFF).withOpacity(0.08)
                  : const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            num,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20,
                color: conditions != '已退款'
                    ? const Color(0xFF027AFF)
                    : const Color(0xFF4F5A74)),
          ),
        ),
        16.wb,
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
}
