import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'car_picker_box.dart';

class CloudGridPickerWidget extends StatefulWidget {
  final String title;
  final List<String> items;
  final Function(List<String>, List<int>) onConfirm;
  final List<int>? initIndex;
  final int? crossAxisCount;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final double? childAspectRatio;
  final bool multi;
  final bool isWrap;

  const CloudGridPickerWidget(
      {super.key,
      required this.title,
      required this.items,
      required this.onConfirm,
      this.initIndex,
      this.crossAxisCount = 4,
      this.mainAxisSpacing,
      this.crossAxisSpacing,
      this.childAspectRatio = 72 / 28, })
      : multi = false,isWrap=false;

  const CloudGridPickerWidget.multi(
      {super.key,
      required this.title,
      required this.items,
      required this.onConfirm,
      this.initIndex,
      this.crossAxisCount = 4,
      this.mainAxisSpacing,
      this.crossAxisSpacing,
      this.childAspectRatio = 72 / 28})
      : multi = true,isWrap=false;


  const CloudGridPickerWidget.wrap({
  super.key,
  required this.title,
  required this.items,
  required this.onConfirm,
  this.initIndex,
  this.crossAxisCount = 4,
  this.mainAxisSpacing,
  this.crossAxisSpacing,
  this.childAspectRatio = 72 / 28
  })   : multi = false,isWrap=true;

  @override
  _CloudGridPickerWidgetState createState() => _CloudGridPickerWidgetState();
}

class _CloudGridPickerWidgetState extends State<CloudGridPickerWidget> {
  List<int> _groupIndex = [];
  final List<String> _groupString = [];

  @override
  void initState() {
    if (widget.initIndex != null) {
      _groupIndex = widget.initIndex!;
      for (var item in widget.initIndex!) {
        _groupString.add(widget.items[item]);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarPickerBox(
      height: (widget.items.length / widget.crossAxisCount!) *50.w + 300.w,
      title: widget.title,
      onPressed: () => widget.onConfirm(_groupString, _groupIndex),
      child:
      widget.isWrap?Wrap(
        spacing: widget.mainAxisSpacing??24.w,
        runSpacing: widget.crossAxisSpacing ?? 24.w,
        children: [
          ...widget.items.mapIndexed((currentValue, index) => _getItem(currentValue,index))
        ],

      ):


      GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 20.w,left:32.w,right:32.w ),
          itemCount: widget.items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
              crossAxisCount: widget.crossAxisCount!,
              //纵轴间距
              mainAxisSpacing: widget.mainAxisSpacing ?? 24.w,
              //横轴间距
              crossAxisSpacing: widget.crossAxisSpacing ?? 24.w,
              //子组件宽高长度比例
              childAspectRatio: widget.childAspectRatio!),
          itemBuilder: (BuildContext context, int index) {
            return _getItem(widget.items[index], index);
          }),
    );
  }

  _getItem(String item, int index) {
    return GestureDetector(
      onTap: () {
        if (_groupIndex.contains(index)) {
          _groupIndex.remove(index);
          _groupString.remove(item);
        } else {
          if (!widget.multi) {
            _groupIndex.clear();
            _groupString.clear();
          }
          _groupIndex.add(index);
          _groupString.add(item);
        }
        setState(() {});
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: _groupIndex.contains(index)
                ? const Color(0x1A027AFF)
                : const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(4.w),
            border: !(_groupIndex.contains(index))
                ? Border.all(color: Colors.transparent, width: 1.w)
                : Border.all(color: const Color(0xFF027AFF), width: 1.w)),
        child: Text(
          item,
          style: TextStyle(
              color: _groupIndex.contains(index)
                  ? kPrimaryColor
                  : BaseStyle.color333333,
              fontSize: BaseStyle.fontSize24),
        ),
      ),
    );
  }
}
