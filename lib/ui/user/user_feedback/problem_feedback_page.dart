import 'dart:io';

import 'package:cloud_car/ui/home/car_manager/direct_sale/car_image_page.dart';
import 'package:cloud_car/ui/user/interface/feedback_func.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';

class ProblemFeedbackPage extends StatefulWidget {
  final String title;
  final String content;
  final String phone;
  final String img;
  final String title1;
  final String text;
  final bool isTitle;

  const ProblemFeedbackPage({
    super.key,
    this.title = '问题反馈',
    this.content = '',
    this.img = '',
    this.phone = '',
    required this.title1,
    required this.text,
    this.isTitle = false,
  });

  @override
  State<ProblemFeedbackPage> createState() => _ProblemFeedbackPageState();
}

class _ProblemFeedbackPageState extends State<ProblemFeedbackPage> {
  late String content = widget.content;
  late String img = widget.img;
  late String phone = widget.phone;
  late bool res = false;

  @override
  void initState() {
    super.initState();
  }

  // _refresh() async {
  //   // ignore: unused_local_variable
  //   zhi = await FeedbackFunc.getFeedback(widget.title, content, phone, img);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          title: Text(widget.isTitle ? '问题反馈' : '',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
          backgroundColor: kForeGroundColor,

          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        backgroundColor: bodyColor,
        body: ListView(children: [
          24.hb,
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: Text(
              widget.title1,
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          24.hb,
          Container(
            // height: 520.w,
            color: kForeGroundColor,
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
            child: SizedBox(
              width: double.infinity,
              // padding:
              //     EdgeInsets.symmetric(vertical: 16.w, horizontal: 20.w),
              height: 200.w,
              child: TextField(
                maxLines: 50,
                keyboardType: TextInputType.text,
                onEditingComplete: () {
                  setState(() {});
                  // _refreshController.callRefresh();
                },
                onChanged: (text) {
                  content = text;
                  setState(() {});
                },
                style: TextStyle(
                  color: BaseStyle.color333333,
                  fontSize: BaseStyle.fontSize28,
                ),
                // controller: _editingController5,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  isDense: true,
                  fillColor: Colors.white,
                  hintText: widget.text,
                  hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          CarImageItem(
            imageBack: (List<File> image) {
              img = image.first.path;
            },

            //isPadding: false,
          ),
          24.hb,
          Padding(
            padding: EdgeInsets.only(
              left: 32.w,
            ),
            child: Text(
              '联系方式',
              style: TextStyle(
                  color: const Color(0xFF111111),
                  fontSize: BaseStyle.fontSize28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          24.hb,
          SizedBox(
            height: 200.w,
            child: TextField(
              keyboardType: TextInputType.text,
              onEditingComplete: () {
                setState(() {});
                // _refreshController.callRefresh();
              },
              onChanged: (text) {
                phone = text;
                setState(() {});
              },
              style: TextStyle(
                color: BaseStyle.color333333,
                fontSize: BaseStyle.fontSize28,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 32.w),
                filled: true,
                fillColor: Colors.white,
                hintText: "请输入您的手机号码方便联系",
                hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
                border: InputBorder.none,
              ),
            ),
          ),
          CloudBottomButton(
            onTap: () async {
              bool res = await FeedbackFunc.getFeedback(
                  widget.title, content, phone, img);
              if (res) {
                //print('标题+${widget.title}+文本$content+手机 $phone+图片+$img');
                CloudToast.show('提交成功');
                Get.back();
              }

              //  BotToast.showText(text: '请输入内容');
              // if (img.isEmail) {
              //   BotToast.showText(text: '图片');
              // } else {
              //   if (phone.isEmail) {
              //     BotToast.showText(text: '手机号');
              //   } else {
              //     BotToast.showText(text: '提交成功');
              //     Future.delayed(const Duration(milliseconds: 0), () async {
              //       await _refresh();
              //       //Get.back();
              //       setState(() {});
              //     });
              //   }
              // }
            },
            text: '提 交',
          ),
          32.hb,
        ]));
  }
}
