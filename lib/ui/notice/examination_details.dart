import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../widget/alert.dart';
import '../../widget/button/cloud_back_button.dart';

class ExaminationDetails extends StatefulWidget {
  ///状态
  final int state;

  ///审核状态
  final int auditState;

  ///驳回理由
  final String reasonText;

  ///通过 驳回
  final int resultsState;

  const ExaminationDetails({
    Key? key,
    required this.state,
    required this.auditState,
    required this.reasonText,
    required this.resultsState,
  }) : super(key: key);

  @override
  _ExaminationDetailsState createState() => _ExaminationDetailsState();
}

class _ExaminationDetailsState extends State<ExaminationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text(
          widget.state==1?'卖车合同':'出售合同',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      backgroundColor: bodyColor,
      extendBody: true,
      body: ListView(
        children: [
          Container(
            width: 750.w,
            height: 200.w,
            color: Colors.deepOrange,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.w),
        decoration: BoxDecoration(
            border: Border.all(width: 1.w, color: const Color(0xFFEEEEEE)),
            color: Colors.white),
        height: 160.w,//double.infinity,
        child: getBottomState(),
      ),
    );
  }

  getBottomState() {
    switch (widget.state) {
      case 1:
        return widget.resultsState == 0
            ? Row(
                children: [
                  getContact(),
                  28.wb,
                  Expanded(
                      child: Row(
                    children: [
                      getBox('驳回', Colors.white, 2, const Color(0xFF027AFF),
                          const Color(0xFF027AFF), () {
                        Alert.show(
                            context,
                            NormalContentDialog(
                              type: NormalTextDialogType.delete,
                              title: '驳回理由',
                              content: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4.w)),
                                child: const TextField(
                                  maxLines: null,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    hintText: '请输入',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              items: const ['取消'],
                              deleteItem: '确定',
                              //监听器
                              listener: (index) {
                                Alert.dismiss(context);
                              },
                              deleteListener: () {
                                Alert.dismiss(context);
                              },
                            ));
                      }),
                      16.wb,
                      getBox('通过', const Color(0xFF027AFF), 0, Colors.white,
                          Colors.white, () {}),
                    ],
                  )),
                ],
              )
            : Column(
                children: [
                  Row(
                    children: [
                      getContact(),
                      const Spacer(),
                      Text(
                        widget.resultsState == 0 ? "已同意" : '已驳回',
                        style: TextStyle(
                            color: widget.resultsState == 0
                                ? const Color(0xFF027AFF)
                                : const Color(0xFFFF3B02),
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  // const Spacer(),

                  widget.resultsState == 0
                      ? const SizedBox()
                      : Flexible(
                          child: Text(
                            '驳回理由:${widget.reasonText}',
                            style: TextStyle(
                                fontSize: 28.sp,
                                color: const Color(0xFF333333),
                                fontWeight: FontWeight.w600),
                          ),
                        )
                  // : Row(
                  //     children: [
                  //       Text(
                  //         '驳回理由:',
                  //         style: TextStyle(
                  //             fontSize: 28.sp,
                  //             color: const Color(0xFF333333),
                  //             fontWeight: FontWeight.w600),
                  //       ),
                  //
                  //     ],
                  //   )
                ],
              );
      case 2:
     return widget.resultsState == 0
            ? Row(
          children: [
            getContact(),
            28.wb,
            Expanded(
                child: Row(
                  children: [
                    getBox('驳回', Colors.white, 2, const Color(0xFF027AFF),
                        const Color(0xFF027AFF), () {
                          Alert.show(
                              context,
                              NormalContentDialog(
                                type: NormalTextDialogType.delete,
                                title: '驳回理由',
                                content: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(4.w)),
                                  child: const TextField(
                                    maxLines: null,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                      hintText: '请输入',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                items: const ['取消'],
                                deleteItem: '确定',
                                //监听器
                                listener: (index) {
                                  Alert.dismiss(context);
                                },
                                deleteListener: () {
                                  Alert.dismiss(context);
                                },
                              ));
                        }),
                    16.wb,
                    getBox('通过', const Color(0xFF027AFF), 0, Colors.white,
                        Colors.white, () {}),
                  ],
                )),
          ],
        )
            : Column(
          children: [
            Row(
              children: [
                getContact(),
                const Spacer(),
                Text(
                  widget.resultsState == 0 ? "已同意" : '已驳回',
                  style: TextStyle(
                      color: widget.resultsState == 0
                          ? const Color(0xFF027AFF)
                          : const Color(0xFFFF3B02),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            // const Spacer(),

            widget.resultsState == 0
                ? const SizedBox()
                : Flexible(
              child: Text(
                '驳回理由:${widget.reasonText}',
                style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w600),
              ),
            )
            // : Row(
            //     children: [
            //       Text(
            //         '驳回理由:',
            //         style: TextStyle(
            //             fontSize: 28.sp,
            //             color: const Color(0xFF333333),
            //             fontWeight: FontWeight.w600),
            //       ),
            //
            //     ],
            //   )
          ],
        );
    }
  }

  getContact() {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          SizedBox(
            width: 64.w,
            height: 64.w,
            child: Image.asset(Assets.images.imgPhone.path),
          ),
          18.wb,
          Text(
            '联系TA',
            style: TextStyle(
              fontSize: 24.sp,
            ),
          )
        ],
      ),
    );
  }

  getBox(String text, Color bgColor, int bWidth, Color bColor, Color tColor,
      VoidCallback ontap) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        width: 240.w,
        height: 72.w,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: bgColor,
          border: Border.all(width: bWidth.w, color: bColor),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 28.w, color: tColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
