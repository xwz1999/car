import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ChangeNameData extends StatefulWidget {
  const ChangeNameData({Key? key}) : super(key: key);

  @override
  State<ChangeNameData> createState() => _ChangeNameDataState();
}

class _ChangeNameDataState extends State<ChangeNameData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor, //头部颜色
        title: Text('个人实名认证',
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
              getText('登记证书'),
              //48.hb,
              getText('行驶证'),
              //48.hb,
              getText('发票'),
              //48.hb,
              getText('保单'),
              //48.hb,
              Row(
                children: [
                  SizedBox(
                    width: 150.w,
                    child: Text(
                      '商业险金额',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  SizedBox(
                      width: 300.w,
                      height: 35.w,
                      child: TextField(
                          decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(bottom: 23.w), //文字与边框的距离
                        border: InputBorder.none, //去掉下划线
                        hintText: '请输入金额',
                        hintStyle: TextStyle(
                          fontSize: BaseStyle.fontSize28,
                          color: BaseStyle.colorcccccc,
                          // onChanged: ,
                        ),
                      ))),
                  Padding(
                    padding: EdgeInsets.only(top: 5.w, left: 191.w),
                    child: Text(
                      '元',
                      style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28),
                    ),
                  )
                ],
              ),
              144.hb,
              GestureDetector(
                onTap: () {
                  //BotToast.showText(text: '验证码输入错误');
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
          GestureDetector(
            onTap: () {},
            child: SizedBox(child: Image.asset(Assets.images.addcar.path)),
          )
        ],
      ),
    );
  }
}
