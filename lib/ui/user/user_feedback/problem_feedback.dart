import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';

class ProblemFeedback extends StatefulWidget {
  const ProblemFeedback({Key? key}) : super(key: key);

  @override
  State<ProblemFeedback> createState() => _ProblemFeedbackState();
}

class _ProblemFeedbackState extends State<ProblemFeedback> {
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
          96.hb,
          GestureDetector(
            onTap: () {
              //BotToast.showText(text: '验证码输入错误');
              //Get.to(() => const NoWithddrawalPage());
            },
            child: Container(
              width: 686.w,
              height: 72.w,
              margin: EdgeInsets.only(left: 32.w),
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
          ),
          500.hb,
        ],
      ),
    );
  }
}
