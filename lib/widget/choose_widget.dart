import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChooseWidget<T> extends StatefulWidget {
  final T? item;
  final List<T> items;
  final Function(int) callBack;
  final bool carState;

  const ChooseWidget(
      {super.key,
      required this.items,
      required this.callBack,
      required this.item,
      this.carState = false});

  @override
  _ChooseWidgetState createState() => _ChooseWidgetState();
}

class _ChooseWidgetState extends State<ChooseWidget> {
  late  String text='';

  @override
  Widget build(BuildContext context) {
    return widget.carState
        ? Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.w),
                    bottomRight: Radius.circular(8.w))),
            width: 750.w,
            height: 100.w,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...widget.items.mapIndexed(
                  (e, index) => SizedBox(
                      // height: 88.w,
                      child: GestureDetector(
                    onTap: () {
                      widget.callBack(index);
                      text = e;
                    },
                    child: Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        width: 150.w,
                        padding: EdgeInsets.symmetric(vertical: 20.w),
                        child: Text(
                          e,
                          style: TextStyle(
                              fontSize: 28.sp,
                              color: e == widget.item
                                  ? kPrimaryColor
                                  : BaseStyle.color333333),
                        )),
                  )),
                )
              ],
            ))
        : Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.w),
              bottomRight: Radius.circular(8.w))),
            width: 750.w,
            height: 100.w,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...widget.items.mapIndexed(
                  (e, index) =>  GestureDetector(
                    onTap: () => widget.callBack(index),
                    child: Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        width: 130.w,
                        padding: EdgeInsets.symmetric(vertical: 20.w),
                        child: Text(
                          e,
                          style: TextStyle(
                              fontSize: 28.sp,
                              color: e == widget.item
                                  ? kPrimaryColor
                                  : BaseStyle.color333333),
                        )),
                  )),

              ],
            ),
          );
  }
}
