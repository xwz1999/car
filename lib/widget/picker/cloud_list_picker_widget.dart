import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/picker/car_picker_box.dart';
import 'package:flutter/material.dart';

class CloudListPickerWidget extends StatefulWidget {
  final String title;
  final List<String> items;
  final Function(String, int) onConfirm;
  final int? initIndex;

  const CloudListPickerWidget(
      {Key? key,
      required this.title,
      required this.items,
      required this.onConfirm,
      this.initIndex})
      : super(key: key);

  @override
  _CloudListPickerWidgetState createState() => _CloudListPickerWidgetState();
}

class _CloudListPickerWidgetState extends State<CloudListPickerWidget> {
  late String _pickString='';
  late int _pickIndex=-1;

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
      height: widget.items.length*30.w+300.w,
        title: widget.title,
        onPressed: () => widget.onConfirm(_pickString, _pickIndex),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return _getListItem(widget.items[index], index);
          },
          itemCount: widget.items.length,
        ));
  }

  _getListItem(String item, int index) {
    return GestureDetector(
      onTap: () {
        _pickString = item;
        _pickIndex = index;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.w),
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _pickString == item
                ? Image.asset(
                    Assets.icons.sortChoose.path,
                    width: 30.w,
                    height: 30.w,
                    fit: BoxFit.fill,
                  )
                : const SizedBox(),
            10.wb,
            Text(
              item,
              style: TextStyle(
                  color: _pickString == item
                      ? kPrimaryColor
                      : BaseStyle.color333333,
                  fontWeight:
                      _pickString == item ? FontWeight.bold : FontWeight.normal,
                  fontSize: BaseStyle.fontSize30),
            ),
            10.wb,
            _pickString == item ? 30.wb : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
