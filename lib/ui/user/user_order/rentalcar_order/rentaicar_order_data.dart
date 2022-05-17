import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class RentaicarOrderData extends StatefulWidget {
  const RentaicarOrderData({super.key});

  @override
  State<RentaicarOrderData> createState() => _RentaicarOrderDataState();
}

class _RentaicarOrderDataState extends State<RentaicarOrderData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor, //头部颜色
        title: Text('租车订单',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: kForeGroundColor, //内容颜色
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 32.w),
          child: ListView(
            children: [
              getText('押金凭证'),
              //48.hb,
              getText('人车合影'),
              144.hb,
              GestureDetector(
                onTap: () {
                  BotToast.showText(text: '提交成功');
                },
                child: Container(
                  width: 686.w,
                  height: 72.w,
                  padding: EdgeInsets.only(left: 318.w, top: 22.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF0593FF), Color(0xFF027AFF)])),
                  child: SizedBox(
                    width: 252.w,
                    height: 28.w,
                    child: Text(
                      '提交',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: kForeGroundColor),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  getTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.subtitle2,
    );
  }

  getText(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150.w,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: const Color(0xFF999999)),
            ),
          ),
          32.wb,
          DottedBorder(
              dashPattern: const [16, 8],
              strokeWidth: 4.w,
              color: const Color(0xFFDDDDDD),
              radius: Radius.circular(8.w),
              child: SizedBox(
                width: 200.w,
                height: 150.w,

                //padding: EdgeInsets.all(76.w),
                child: GestureDetector(
                  child: Stack(children: [
                    Align(
                      child: Container(
                        width: 48.w,
                        height: 2.w,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4.w),
                            color: const Color(0xFFDDDDDD),
                            borderRadius: BorderRadius.circular(1.4.w)),
                      ),
                    ),
                    Positioned(
                      left: 100.w,
                      top: 48.w,
                      child: Container(
                        width: 2.w,
                        height: 48.w,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4.w),
                            color: const Color(0xFFDDDDDD),
                            borderRadius: BorderRadius.circular(1.4.w)),
                      ),
                    )
                  ]),
                ),
              ))
        ],
      ),
    );
  }
}
