import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class DropDownHeadWidget extends StatefulWidget {
  final String title;
  final bool isForward;
  final Function onClick;
  final double headFontSize;
  final IconData? iconData;
  final Decoration? decoration;

  const DropDownHeadWidget({
    super.key,
    required this.title,
    required this.isForward,
    required this.onClick,
    this.headFontSize = 12.0,
    this.iconData = Icons.arrow_drop_down_outlined,
    this.decoration = const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.zero,
      ),
      color: Colors.white,
    ),
  });

  @override
  State<StatefulWidget> createState() {
    return _DropDownHeadWidgetState();
  }
}

class _DropDownHeadWidgetState extends State<DropDownHeadWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> shAnimation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant DropDownHeadWidget oldWidget) {
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
          TextStyle(fontSize: widget.headFontSize, color: Colors.blue);
      iconData = Icon(
        widget.iconData ?? Icons.arrow_drop_down_sharp,
        color: Colors.blue,
        size: 20.sp,
      );
      //
    } else {
      headTextStyle = TextStyle(
          fontSize: widget.headFontSize, color: const Color(0xff333333));
      iconData = Icon(
        widget.iconData ?? Icons.arrow_drop_down_sharp,
        size: 20.sp,
        color: const Color(0xff333333),
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
          padding: EdgeInsets.only(left: 5.r, right: 5.r),

          decoration: widget.decoration,
          // border: Border(
          //     bottom: BorderSide(color: BaseStyle.colordddddd, width: 1.w),
          //     left: BorderSide(color: BaseStyle.colordddddd, width: 1.w)),

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
