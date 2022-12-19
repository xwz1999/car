import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CarWidget extends StatefulWidget {
  final List items;
  final Function(int index) callBack;

  const CarWidget({
    super.key,
    required this.items,
    required this.callBack,
  });

  @override
  _CarWidgetState createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
  late int _isChoose = 0;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      //height: 88.w,
      decoration: BoxDecoration(
          color: kForeGroundColor, borderRadius: BorderRadius.circular(16.w)),
      child:
      ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...widget.items.mapIndexed(
            (e, index) => SizedBox(
                //height: 88.w,
                child: GestureDetector(
              onTap: () {
                _isChoose = index;
                widget.callBack(index);
              },
              child: Container(
                  width: 160.w,
                  alignment: Alignment.center,
                  // padding: EdgeInsets.symmetric(
                  //   vertical: 20.w,
                  // ),
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
      ),
    );
  }
}
