import 'package:cloud_car/widget/progress_bar.dart';
import 'package:flutter/material.dart';

import '../../../../utils/headers.dart';
import '../../../../widget/button/cloud_back_button.dart';

class DealerConsignmentRejectedPage extends StatefulWidget {
  const DealerConsignmentRejectedPage({super.key});

  @override
  State<DealerConsignmentRejectedPage> createState() =>
      _DealerConsignmentRejectedPageState();
}

class _DealerConsignmentRejectedPageState
    extends State<DealerConsignmentRejectedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('车商寄卖',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),

        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: bodyColor,
      body: ListView(children: [
        16.hb,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 32.w),
          height: 120.w,
          color: Colors.white,
          child: ProgressBar(
            length: 6,
            num: 3,
            direction: false,
            HW: 96,
            cancel: false,
            texts: [
              text('发布'),
              text('上架'),
              text('订单取消'),
              text('到账'),
              text('成交'),
            ],
          ),
        ),
        16.hb,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 32.w),
          padding: EdgeInsets.all(28.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 0.w),
                child: getTitle('车商信息'),
              ),
              36.hb,
              _getText('车商编号', '莉丝'),
              36.hb,
              _getText(
                '车商名称',
                '18912345432',
              )
            ],
          ),
        ),
        16.hb,
        Container(
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
            margin: EdgeInsets.symmetric(horizontal: 32.w),
            decoration: BoxDecoration(
                color: kForeGroundColor,
                borderRadius: BorderRadius.circular(16.w)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(left: 0.w),
                child: Text(
                  '车辆信息',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              24.hb,
              Row(
                children: [
                  SizedBox(
                    width: 196.w,
                    height: 150.w,
                    child: Image.asset(
                      Assets.images.carBanner.path,
                      fit: BoxFit.fill,
                    ),
                  ),
                  20.wb,
                  SizedBox(
                    width: 406.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('奥迪Q3 2020款 35 TFSI 进取型SUV',
                            style: TextStyle(
                                fontSize: BaseStyle.fontSize28,
                                color: BaseStyle.color111111)),
                        32.hb,
                        Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: getText('2020年10月', '20.43万公里'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ])),
        16.hb,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 32.w),
          padding: EdgeInsets.all(28.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 0.w),
                child: getTitle('交易取消信息'),
              ),
              36.hb,
              _getText('取消人员', '9876524612'),
              36.hb,
              _getText(
                '取消时间',
                '2021-12-30 12:00:00',
              )
            ],
          ),
        ),
      ]),
    );
  }

  _getText(String title, String text) {
    return Row(
      children: [
        SizedBox(
          width: 120.w,
          child: Text(
            title,
            style: TextStyle(
                color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
          ),
        ),
        32.wb,
        Flexible(
          child: SizedBox(
            width: 478.w,
            child: Text(
              text,
              style: TextStyle(
                  color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
            ),
          ),
        ),
      ],
    );
  }

  getTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.subtitle2,
    );
  }

  getText(String time, String distance) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
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

  text(String text) {
    return Text(
      text,
      style: TextStyle(
          color: BaseStyle.color111111, fontSize: BaseStyle.fontSize24),
    );
  }
}
