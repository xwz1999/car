import 'package:cloud_car/ui/home/car_mortgage/car_mortgage_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/picker/car_picker_box.dart';
import 'package:flutter/material.dart';

///选择还款方式


class CloudListPickerItemWidget extends StatefulWidget {
  final String title;
  final List<PayWay> items;
  final Function(PayWay, int) onConfirm;
  final int? initIndex;

  const CloudListPickerItemWidget(
      {super.key,
      required this.title,
      required this.items,
      required this.onConfirm,
      this.initIndex,});

  @override
  _CloudListPickerItemWidgetState createState() => _CloudListPickerItemWidgetState();
}

class _CloudListPickerItemWidgetState extends State<CloudListPickerItemWidget> {
  PayWay? _pickString;
  int? _pickIndex;

  @override
  void initState() {
    if (widget.initIndex != null) {
      _pickString = widget.items[widget.initIndex!];
      _pickIndex = widget.initIndex!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarPickerBox(
        height: widget.items.length * 74.w + 400.w,
        title: widget.title,
        onPressed: () {
          if (_pickIndex == null) {
            return;
          } else {
            widget.onConfirm(_pickString!, _pickIndex!);
          }
        },
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return _getListItem(widget.items[index], index);
          },
          itemCount: widget.items.length,
        ));
  }

  _getListItem(PayWay item, int index) {
    return GestureDetector(
      onTap: () {
        _pickString = item;
        _pickIndex = index;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.w,horizontal: 20.w),
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _pickString  != item ? 30.wb : const SizedBox(),

            _pickString == item
                ? Image.asset(
                    Assets.icons.sortChoose.path,
                    width: 30.w,
                    height: 30.w,
                    fit: BoxFit.fill,
                  )
                : const SizedBox(),
            10.wb,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                      color: _pickString == item
                          ? kPrimaryColor
                          : BaseStyle.color333333,
                      fontWeight:
                          _pickString == item ? FontWeight.bold : FontWeight.normal,
                      fontSize: BaseStyle.fontSize28),
                ),
                16.hb,
                Text(
                  item.describe,
                  style: TextStyle(
                      color: _pickString == item
                          ? kPrimaryColor
                          : BaseStyle.color333333,
                      fontWeight:
                      _pickString == item ? FontWeight.bold : FontWeight.normal,
                      fontSize: BaseStyle.fontSize24),
                ),
              ],
            ),
            10.wb,

          ],
        ),
      ),
    );
  }
}
