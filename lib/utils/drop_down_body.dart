import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final Widget title;
  final Widget text;
  final Widget widget;
  final bool horizontalLine;
  const DropDown(
      {Key? key,

      ///是否需要水平线   false///不需要 true////需要
      this.horizontalLine = false,
      required this.text,
      required this.title,
      required this.widget})
      : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  int num = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        num++;
        setState(() {});
      },
      child: Column(
        children: [
          Container(
            width: 750.w,
            height: 96.w,
            decoration: widget.horizontalLine
                ? BoxDecoration(
                    color: kForeGroundColor,
                    border: Border(
                        bottom: BorderSide(
                            width: 0.5.w, color: BaseStyle.color999999)))
                : const BoxDecoration(
                    color: kForeGroundColor,
                  ),
            padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.title,
                300.wb,
                widget.text,
                // Text(
                //   widget.title,
                //   style: Theme.of(context)
                //       .textTheme
                //       .subtitle1
                //       ?.copyWith(fontSize: 32.w),
                // ),
                // Text(
                //   widget.text,
                //   style: Theme.of(context)
                //       .textTheme
                //       .subtitle1
                //       ?.copyWith(fontSize: 32.w),
                // ),
                const Spacer(),
                SizedBox(
                  width: 32.w,
                  height: 32.w,
                  child: Image.asset(
                    num.isEven ? Assets.icons.up.path : Assets.icons.down.path,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
          getList()
        ],
      ),
    );
  }

  getList() {
    return Offstage(
      offstage: !num.isEven,
      child: Container(
        color: Colors.white,
        child: widget.widget,
      ),
    );
  }
}
