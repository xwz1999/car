import 'package:cloud_car/model/user/handbook_model.dart';
import 'package:cloud_car/ui/user/interface/manuals_func.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';

class ProductManuals extends StatefulWidget {
  const ProductManuals({super.key});

  @override
  State<ProductManuals> createState() => _ProductManualsState();
}

class _ProductManualsState extends State<ProductManuals> {
  List<HandbookModel> productManuals = [
    const HandbookModel(name: '买车流程', items: [
      Staff(
          id: 0,
          name: '首先需要客户有看中的车辆，例如客户在小程序自己浏览，'
              '或者经纪人分享车辆给客户。与客户跟进车辆信息，如果觉得合适可以叫车去给客户看车，'
              '或者约客户实地看车，如果客户觉得车辆情况符合预期，价格可以接受，则可以发起买车合同，'
              '客户支付完定金后经纪人给车辆做检测，通过检测后，客户支付首付，经纪人代理给车辆过户，'
              '完成后客户支付尾款即可交车。',
          updatedAt: 0)
    ]),
    const HandbookModel(name: '卖车流程', items: [
      Staff(
          id: 0,
          name: '客户有车子想要寄卖，会在小程序上估车，估值的价格如果满意，'
              '觉得可以卖，则会预约经纪人看车，约定好时间地点，经纪人赴约，'
              '现场验车，根据实际情况给车辆再次估值，客户对经纪人估值的价格满意则经纪人发起寄卖合同，'
              '车辆留在门店，在平台是寄卖。',
          updatedAt: 0)
    ]),
    const HandbookModel(name: '人物身份', items: [
      Staff(
          id: 0,
          name: '店长：能够管理店内的客户、车辆、订单                           '
              '  车务：负责录入车辆信息、编辑店里的车辆                          '
              '  经纪人：能够查看全店的车，并进行客户跟进、销售下单',
          updatedAt: 0)
    ]),
  ];
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _easyRefreshController.dispose();
  }

  _refresh() async {
    productManuals = await ManualsFunc.getHandbookAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('产品手册', style: Theme.of(context).textTheme.headline4),
//leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: bodyColor,
      body: Column(
        children: [
          ///搜索框
          // Container(
          //   width: 750.w,
          //   height: 96.h,
          //   color: Colors.white,
          //   child: _search(),
          // ),

          ///列表
          Expanded(
              child: EasyRefresh(
            firstRefresh: true,
            header: MaterialHeader(),
            footer: MaterialFooter(),
            controller: _easyRefreshController,
            onRefresh: () async {
              _refresh();
              setState(() {});
            },
            child: ListView.builder(
              itemBuilder: (context, index) {
                return getList(productManuals[index]);
              },
              itemCount: productManuals.length,
            ),
          ))
        ],
      ),
    );
  }

  // _search() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       32.wb,
  //       Container(
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(36.w),
  //             border: Border.all(width: 2.w, color: const Color(0xFFE7E7E7))),
  //         width: 606.w,
  //         height: 72.w,
  //         child: TextField(
  //           keyboardType: TextInputType.text,
  //           onTap: () {},
  //           style: TextStyle(
  //             textBaseline: TextBaseline.ideographic,
  //             fontSize: 32.sp,
  //             color: Colors.black,
  //           ),
  //           decoration: InputDecoration(
  //             contentPadding: EdgeInsets.only(left: 20.w, bottom: 10.w),
  //             filled: true,
  //             fillColor: Colors.white,
  //             hintText: "请输入员工名称",
  //             hintStyle: TextStyle(
  //                 color: Colors.grey.shade500,
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.w300),
  //             prefixIcon: const Icon(
  //               CupertinoIcons.search,
  //               size: 16,
  //             ),
  //             enabledBorder: UnderlineInputBorder(
  //               //
  //               // 不是焦点的时候颜色
  //               borderRadius: BorderRadius.circular(36.w),
  //               borderSide: const BorderSide(
  //                 color: kForeGroundColor,
  //               ),
  //             ),
  //             focusedBorder: UnderlineInputBorder(
  //               // 焦点集中的时候颜色
  //               borderRadius: BorderRadius.circular(36.w),
  //               borderSide: const BorderSide(color: kForeGroundColor),
  //             ),
  //             border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(36.w),
  //                 borderSide: const BorderSide(color: kForeGroundColor)),
  //           ),
  //         ),
  //       ),
  //       12.wb,
  //       GestureDetector(
  //         onTap: () {},
  //         child: Text('取消', style: Theme.of(context).textTheme.bodyText2),
  //       ),
  //       20.wb,
  //     ],
  //   );
  // }

  getList(HandbookModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        40.hb,
        getTitle(model.name),
        24.hb,
        ...model.items != null
            ? model.items!.mapIndexed((e, index) {
                return GestureDetector(
                    onTap: () {
                      // Get.to(() => HandbookInfoPage(
                      //       //manualsBack: (int id) {},
                      //       itemId: e.id,
                      //       name: e.name,
                      //     ));
                    },
                    child: getText(
                        e.name,
                        DateUtil.formatDateMs(e.updatedAt.toInt() * 1000,
                            format: 'yyyy-MM-dd'),index==2),);
              }).toList()
            : []
        //ListView.builder(itemBuilder: (context, index) {})
        //_getText('销售更多服务', '2021-12-01')
      ],
    );
  }

  getText(String text, String time,bool height) {
    return Container(
        width: 750.w,
        // height: 92.h,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 16.w
        ),
        child: Row(
          children: [
            // flexible(Text(
            //   text,
            //   style: Theme.of(context).textTheme.subtitle2,
            // ),)
            Flexible(
          // flex:,
                child: Text(
              text,
              style: TextStyle(fontSize: 28.sp,height: height?2:1.5,color: Colors.black87),
            )),
            // const Spacer(),
            // Text(
            //   time,
            //   style: Theme.of(context)
            //       .textTheme
            //       .subtitle2
            //       ?.copyWith(color: BaseStyle.color999999),
            // )
          ],
        )

        // ListTile(
        // title: Text(
        // text,
        // style: Theme
        //     .of(context)
        //     .textTheme
        //     .subtitle2,
        //   ),
        //   trailing: Text(
        //     time,
        //     style: Theme.of(context)
        //         .textTheme
        //         .subtitle2
        //         ?.copyWith(color: BaseStyle.color999999),
        //   ),
        // ),
        );
  }

  getTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 32.w),
      child: Text(
        title,
        style: TextStyle(
            fontSize: BaseStyle.fontSize32,
            color: const Color(0xFF110000),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
