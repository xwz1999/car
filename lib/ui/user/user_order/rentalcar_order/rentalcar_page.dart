///需要修改****************
import 'package:cloud_car/ui/user/user_order/rentalcar_order/rentaicar_alsocar_order_page.dart';
import 'package:cloud_car/ui/user/user_order/rentalcar_order/rentalcar_transaction_cancelled_order_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/car_widget.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class RentalcarOrderPage extends StatefulWidget {
  final Function callBack;

  const RentalcarOrderPage({super.key, required this.callBack});

  @override
  State<RentalcarOrderPage> createState() => _RentalcarOrderPageState();
}

class _RentalcarOrderPageState extends State<RentalcarOrderPage> {
  List<Widget> listWidget = []; //创建方法列表
  final List<ChooseItem> _sortList = [];

  //bool _onLoad = true;

//List<> _RentalCarList=[];
  //int _page = 1;
  final int _size = 10;
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  //ScreenControl screenControl = ScreenControl();
  String text = '全部';

  List carList = [
    {
      'judge': false,
      'judgeName': '进行中',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'price1name': '租车总价',
      'price1': '220.00',
      'priceName': '已付租金',
      'price': '220.00',
      'buttonName': '',
    },
    {
      'judge': false,
      'judgename': '已完成',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'pice1name': '租车总价',
      'pice1': '220.00',
      'picename': '已付租金',
      'pice': '220.00',
      'buttomname': '',
    },
    {
      'judge': false,
      'judgename': '已取消',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'pice1name': '租车总价',
      'pice1': '220.00',
      'picename': '已付租金',
      'pice': '220.00',
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
  void dispose() {
    _easyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // widget.callBack();
      },
      child: Column(
        children: [
          SizedBox(
            height: kToolbarHeight + 50.w,
          ),
          SizedBox(
            height: 88.w,
            child: CarWidget(
              items: const [
                '全部',
                '进行中',
                '已完成',
                '已取消',
              ],
              callBack: (name) {
                text = name;
                setState(() {});
              },
            ),
          ),
          16.hb,
          Expanded(
              child: EasyRefresh(
            firstRefresh: true,
            header: MaterialHeader(),
            footer: MaterialFooter(),
            controller: _easyRefreshController,
            onRefresh: () async {
              // _page
            },
            onLoad: () async {},
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return _getCar(carList[index]);
                },
                itemCount: carList.length),
          )),
        ],
      ),
    );
  }

  _getCar(item) {
    return Offstage(
        offstage: false, //text == '全部' ? false : item['judgename'] != text,
        child: Container(
            color: bodyColor,
            child: GestureDetector(
              onTap: () {
                switch (item['judgename']) {
                  case '进行中':
                    //Get.to(() => const RentalcarOrderPage());
                    break;
                  case '已完成':
                    Get.to(() => const AlsoCarOrderPage(
                          bl: false,
                          orderId: 1,
                        ));
                    break;
                  case '已取消':
                    Get.to(() => const CancelOrderPage());
                    break;
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
                margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.w),
                decoration: BoxDecoration(
                    color: kForeGroundColor,
                    borderRadius: BorderRadius.circular(16.w)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0.w),
                        child: Text(
                          item['judgename'],
                          style: TextStyle(
                              color: item['judgename'] != '已取消'
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
                                  child: _getText(
                                    '自动2.0T',
                                    '国VI',
                                    '五座',
                                  ),
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
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: item['pice1'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold)),
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
                          32.hb,
                        ],
                      ))
                    ]),
              ),
            )));
  }

  _getText(String num, String time, String distance) {
    return Row(
      children: [
        //Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            num,
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
      ],
    );
  }
}
