import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChooseWidget extends StatefulWidget {
  final List items;
  final Function(String) callBack;

  const ChooseWidget({Key? key, required this.items, required this.callBack})
      : super(key: key);

  @override
  _ChooseWidgetState createState() => _ChooseWidgetState();
}

class _ChooseWidgetState extends State<ChooseWidget> {
  late int _isChoose = 0;

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
