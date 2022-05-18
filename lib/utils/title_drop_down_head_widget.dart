import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class TitleDropDownHeadWidget extends StatefulWidget {
  final String title;
  final bool isForward;
  final Function onClick;
  final double headFontSize;
  final IconData? iconData;

  const TitleDropDownHeadWidget(this.title, this.isForward, this.onClick,
      {this.headFontSize = 12.0,
      this.iconData = Icons.arrow_drop_down_outlined,
      key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TitleDropDownHeadWidgetState();
  }
}

class _TitleDropDownHeadWidgetState extends State<TitleDropDownHeadWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> shAnimation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant TitleDropDownHeadWidget oldWidget) {
    if (widget.isForward) {
      controller.forward();
    } else {
      controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    shAnimation = Tween(begin: .0, end: .5).animate(controller)
      ..addStatusListener((status) {
        setState(() {
          if (status == AnimationStatus.completed) {
          } else {}
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle headTextStyle;
    Icon iconData;
    if (shAnimation.isCompleted) {
      headTextStyle =
          TextStyle(fontSize: widget.headFontSize, color: const Color(0xff333333),fontWeight: FontWeight.bold);
      iconData = Icon(
        widget.iconData ?? Icons.arrow_drop_down_sharp,
        color: const Color(0xFFCCCCCC),
        size: 40.sp,
      );
      //
    } else {
      headTextStyle = TextStyle(
          fontSize: widget.headFontSize, color: const Color(0xff333333),fontWeight: FontWeight.bold);
      iconData = Icon(
        widget.iconData ?? Icons.arrow_drop_down_sharp,
        size: 40.sp,
        color:const Color(0xFFCCCCCC),
      );
    }
    return InkWell(
      onTap: () {
        widget.onClick();
      },
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(left: 5.w, right: 5.w),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(widget.title, style: headTextStyle),
            RotationTransition(
              turns: shAnimation,
              child: iconData,
            )
          ])),
    );
  }
}
