import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/ui/user/interface/feedback_func.dart';
import 'package:cloud_car/widget/button/cloud_bottom.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';

class ProblemFeedback extends StatefulWidget {
  final String title;
  final String content;
  final String phone;
  final String img;

  const ProblemFeedback(
      {Key? key,
      this.title = '问题反馈',
      this.content = '',
      this.img = '',
      this.phone = ''})
      : super(key: key);

  @override
  State<ProblemFeedback> createState() => _ProblemFeedbackState();
}

class _ProblemFeedbackState extends State<ProblemFeedback> {
  late String content = widget.content;
  late String img = widget.img;
  late String phone = widget.phone;
  late bool zhi = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        title: Text('问题反馈',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        backgroundColor: kForeGroundColor,

        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: bodyColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          32.hb,
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: Text(
              '问题描述',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          24.hb,
          Container(
              height: 520.w,
              color: kForeGroundColor,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    // padding:
                    //     EdgeInsets.symmetric(vertical: 16.w, horizontal: 20.w),
                    height: 120.w,
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
                        hintText: "请输入您的问题并上传页面截屏可帮助技术人员更快地解决问题",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  158.hb,
                  DottedBorder(
                      dashPattern: const [16, 8],
                      strokeWidth: 4.w,
                      color: const Color(0xFFDDDDDD),
                      radius: Radius.circular(8.w),
                      child: SizedBox(
                        width: 169.w,
                        height: 120.w,

                        //padding: EdgeInsets.all(76.w),
                        child: GestureDetector(
                          onTap: () {},
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
                              left: 85.w,
                              top: 36.w,
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
              )),
          32.hb,
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: Text(
              '联系方式',
              style: TextStyle(
                  color: const Color(0xFF111111),
                  fontSize: BaseStyle.fontSize28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          24.hb,
          Expanded(
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
          const Spacer(),
          CloudBottom(
            ontap: () async {
              if (zhi) {
                Future.delayed(const Duration(milliseconds: 0), () async {
                  await _refresh();
                  Get.back();
                  setState(() {});
                });
              } else {
                BotToast.showText(text: '请输入内容');
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
              }
            },
            text: '提 交',
          ),
          32.hb,
        ],
      ),
    );
  }

  _refresh() async {
    // ignore: unused_local_variable
    zhi = await Feedbacks.getFeedback(widget.title, content, phone, img);
  }
}
