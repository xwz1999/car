import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChooseCarPicWidget extends StatefulWidget {
  final List items;
  final Function(String) callBack;
  final int pageNum;

  const ChooseCarPicWidget({Key? key, required this.items, required this.callBack, required this.pageNum})
      : super(key: key);

  @override
  _ChooseCarPicWidgetState createState() => _ChooseCarPicWidgetState();
}

class _ChooseCarPicWidgetState extends State<ChooseCarPicWidget> {
  late int _isChoose = widget.pageNum;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...widget.items.mapIndexed(
              (e, index) => Expanded(
              child: GestureDetector(
                onTap: () {
                  _isChoose = index;
                  widget.callBack(e);
                },
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    width: 100.w,
                    padding: EdgeInsets.symmetric(vertical: 20.w),
                    child: Text(
                      e,
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: index == _isChoose
                              ? kPrimaryColor
                              : BaseStyle.color333333),
                    )),
              )),
        )
      ],
    );
  }
}
