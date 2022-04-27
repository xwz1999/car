import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChooseWidget<T> extends StatefulWidget{
  final T? item;
  final List<T> items;
  final Function(String) callBack;

  const ChooseWidget({Key? key, required this.items, required this.callBack, required this.item})
      : super(key: key);

  @override
  _ChooseWidgetState createState() => _ChooseWidgetState();
}

class _ChooseWidgetState extends State<ChooseWidget> {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...widget.items.mapIndexed(
          (e, index) => Expanded(
              child: GestureDetector(
            onTap: () {

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
                      color: e == widget.item
                          ? kPrimaryColor
                          : BaseStyle.color333333),
                )),
          )),
        )
      ],
    );
  }
}
