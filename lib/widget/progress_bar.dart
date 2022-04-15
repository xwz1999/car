import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  final bool direction;
  final int index;
  final int num;
  final int length;
  const ProgressBar(
      {Key? key,
      this.direction = true,
      required this.index,
      required this.length,
      required this.num})
      : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    late bool ing = widget.length < widget.num;
    return Container(
        padding: EdgeInsets.only(left: 32.w),
        height: double.infinity,
        child: widget.direction
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      widget.index != 0
                          ? Container(
                              width: 2.w,
                              height: 10.w,
                              decoration: BoxDecoration(
                                color:
                                    ing ? kPrimaryColor : BaseStyle.colorcccccc,
                              ),
                            )
                          : const SizedBox(),
                      Container(
                        margin:
                            EdgeInsets.only(top: widget.index != 0 ? 0 : 10.w),
                        width: 20.w,
                        height: 20.w,
                        decoration: BoxDecoration(
                          color: ing ? kPrimaryColor : BaseStyle.colorcccccc,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 2.w,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: ing ? kPrimaryColor : BaseStyle.colorcccccc,
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemCount: widget.length,
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      widget.index != 0
                          ? Container(
                              width: 2.w,
                              height: 10.w,
                              decoration: BoxDecoration(
                                color:
                                    ing ? kPrimaryColor : BaseStyle.colorcccccc,
                              ),
                            )
                          : const SizedBox(),
                      Container(
                        margin:
                            EdgeInsets.only(top: widget.index != 0 ? 0 : 10.w),
                        width: 20.w,
                        height: 20.w,
                        decoration: BoxDecoration(
                          color: ing ? kPrimaryColor : BaseStyle.colorcccccc,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 2.w,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: ing ? kPrimaryColor : BaseStyle.colorcccccc,
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemCount: widget.length,
              ));
  }
}
