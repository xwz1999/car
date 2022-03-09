import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BeeCheckRadio<T> extends StatefulWidget {
  final T? value;
  final List<T>? groupValue;
  final Widget? indent;
  final Color? backColor;

  const BeeCheckRadio(
      {Key? key, this.value, this.groupValue, this.indent, this.backColor})
      : super(key: key);

  @override
  _BeeCheckRadioState createState() => _BeeCheckRadioState();
}

class _BeeCheckRadioState extends State<BeeCheckRadio> {
  bool get _selected {
    if (widget.groupValue!.contains(widget.value)) {
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
      decoration: BoxDecoration(
        color: widget.backColor ?? kPrimaryColor.withOpacity(_selected ? 1 : 0),
        border: Border.all(
          color: widget.backColor != null
              ?   kForeGroundColor
              : (_selected ? kPrimaryColor : const Color(0xFF979797)),
          width: 2.w,
        ),
        borderRadius: BorderRadius.circular(20.w),
      ),
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
              color: Colors.white,
              size: 28.w,
            ),
      ),
    );
  }
}
