import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BeeCheckRadio<T> extends StatefulWidget {
  final T? value;
  final List<T>? groupValue;
  final Widget? indent;
  final Color? backColor;
  final bool? border;
  final bool according;
  const BeeCheckRadio({
    super.key,
    this.value,
    this.groupValue,
    this.indent,
    this.backColor,
    this.according=false,
    this.border = true,
  });

  @override
  _BeeCheckRadioState createState() => _BeeCheckRadioState();
}

class _BeeCheckRadioState extends State<BeeCheckRadio> {
  // widget.according? widget.groupValue?.first==widget.value:
  bool get _selected {
    if ( widget.groupValue!.contains(widget.value)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 40.w,
      width: 40.w,
      decoration: widget.border!
          ? BoxDecoration(
              color: widget.backColor ??
                  kPrimaryColor.withOpacity(_selected ? 1 : 0),
              border: Border.all(
                color: widget.backColor != null
                    ? kForeGroundColor
                    : (_selected ? kPrimaryColor : const Color(0xFFcccccc)),
                width: 2.w,
              ),
              borderRadius: BorderRadius.circular(20.w),
            )
          : const BoxDecoration(),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
      alignment: Alignment.center,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
        opacity: _selected ? 1 : 0,
        child: widget.indent ??
            Icon(
              CupertinoIcons.checkmark,
              color: widget.border! ? Colors.white : const Color(0xFF027AFF),
              size: 28.w,
            ),
      ),
    );
  }
}
