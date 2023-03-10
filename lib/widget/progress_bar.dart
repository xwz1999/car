// ignore_for_file: non_constant_identifier_names

import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  final bool direction;
  //final int index;
  final bool cancel;
  final int num;
  final int length;
  final int HW;
  final List<dynamic> texts;
  const ProgressBar(
      {super.key,

      ///true垂直 false水平
      this.direction = true,

      ///是否取消订单   true:不取消  false:取消
      this.cancel = true,
      required this.texts,
      //required this.index,
      required this.length,
      required this.num,
      required this.HW});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  late List<Widget> time = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 32.w),
      height: 750.w,
      width: 750.w,
      child: widget.direction
          ? ListView.builder(
              itemBuilder: (context, index) {
                late bool ing = index < widget.num;
                return IntrinsicWidth(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: (widget.HW + 30).w,
                          child: Column(
                            children: [
                              // index != 0
                              //     ? Container(
                              //         width: 2.w,
                              //         height: 10.w,
                              //         decoration: BoxDecoration(
                              //           color: ing
                              //               ? kPrimaryColor
                              //               : BaseStyle.colorcccccc,
                              //         ),
                              //       )
                              //     : const SizedBox(),
                              Container(
                                margin:
                                    EdgeInsets.only(top: index != 0 ? 0 : 10.w),
                                width: 20.w,
                                height: 20.w,
                                decoration: BoxDecoration(
                                  color: ing
                                      ? kPrimaryColor
                                      : BaseStyle.colorcccccc,
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                              ),
                              index + 1 == widget.length
                                  ? const SizedBox()
                                  : Container(
                                      width: 2.w,
                                      height: widget.HW.w,
                                      decoration: BoxDecoration(
                                        color: ing
                                            ? kPrimaryColor
                                            : BaseStyle.colorcccccc,
                                      ),
                                    ),
                            ],
                          )),
                      34.wb,
                      Column(
                        children: [widget.texts[index]],
                      )
                    ],
                  ),
                );
              },
              itemCount: widget.length,
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                late bool ing = index < widget.num;
                late bool ing2 = (index + 1) - widget.num == 0;
                return IntrinsicWidth(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: (widget.HW + 20).w,
                          child: Row(
                            children: [
                              // index != 0
                              //     ? Container(
                              //         width: 2.w,
                              //         height: 10.w,
                              //         decoration: BoxDecoration(
                              //           color: ing
                              //               ? kPrimaryColor
                              //               : BaseStyle.colorcccccc,
                              //         ),
                              //       )
                              //     : const SizedBox(),
                              Container(
                                margin: EdgeInsets.only(left: 0.w),
                                width: 20.w,
                                height: 20.w,
                                decoration: BoxDecoration(
                                  color: widget.cancel
                                      ? ing
                                          ? kPrimaryColor
                                          : BaseStyle.colorcccccc
                                      : ing
                                          ? ing2
                                              ? const Color(0xFFE62222)
                                              : kPrimaryColor
                                          : BaseStyle.colorcccccc,
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                              ),
                              index + 1 == widget.length
                                  ? const SizedBox()
                                  : Container(
                                      width: widget.HW.w,
                                      height: 2.w,
                                      decoration: BoxDecoration(
                                        color: widget.cancel
                                            ? ing
                                                ? kPrimaryColor
                                                : BaseStyle.colorcccccc
                                            : ing
                                                ? ing2
                                                    ? BaseStyle.colorcccccc
                                                    : kPrimaryColor
                                                : BaseStyle.colorcccccc,
                                      ),
                                    ),
                            ],
                          )),
                      12.hb,
                      Row(
                        children: [widget.texts[index]],
                      ),
                    ],
                  ),
                );
              },
              itemCount: widget.length,
            ),
    );
  }

  // getDot(int i, bool ing) {
  //   return Container(
  //     margin: EdgeInsets.only(top: i != 0 ? 0 : 10.w),
  //     width: 20.w,
  //     height: 20.w,
  //     decoration: BoxDecoration(
  //       color: ing ? kPrimaryColor : BaseStyle.colorcccccc,
  //       borderRadius: BorderRadius.circular(10.w),
  //     ),
  //   );
  // }

  // getVertical(bool ing) {
  //   return Expanded(
  //     child: Container(
  //       width: 2.w,
  //       height: double.infinity,
  //       decoration: BoxDecoration(
  //         color: ing ? kPrimaryColor : BaseStyle.colorcccccc,
  //       ),
  //     ),
  //   );
  // }
}
