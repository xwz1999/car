import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/material.dart';

typedef TextCallback = Function(String content);

///对list或者grid形式的列表进行选择操作
class CarListPicker extends StatefulWidget {
  final TextCallback callback;
  final String confirmString;
  final String? title;
  final bool isGrid;
  ///是否是grid列表
  final List<ChooseItem> items;
  final String carString;

  const CarListPicker(
      {Key? key,
      required this.callback,
      this.confirmString = '确认',
      this.title,
      this.isGrid = true,
      required this.items, this.carString=''})
      : super(key: key);

  @override
  _CarListPickerState createState() => _CarListPickerState();
}

class _CarListPickerState extends State<CarListPicker> {
  late String _chooseItem = widget.carString;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.w)),
      ),
      padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 24.w),
      clipBehavior: Clip.antiAlias,
      height: 500.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildButton(
                title: '取消',
                onPressed: () => Navigator.pop(context),
                color: Colors.black26,
              ),
              Expanded(
                child: Text(
                  widget.title ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF111111),
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp,
                  ),
                ),
              ),
              _buildButton(
                title: widget.confirmString,
                onPressed: () => widget.callback(_chooseItem),
                color: Colors.blue,
              ),
            ],
          ),
          ScreenWidget(
            pickString: _chooseItem,
            isGrid: widget.isGrid,
            childAspectRatio: 72 / 28,
            callback: (String item) async{
              _chooseItem = item;
              setState(() {});
            },
            mainAxisSpacing: 24.w,
            crossAxisSpacing: 24.w,
            crossAxisCount: 4,
            haveButton: true,
            itemList: widget.items,
          ),
        ],
      ),
    );
  }

  _buildButton({
    required String title,
    required VoidCallback? onPressed,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onPressed,
      // height: 48.w,
      child: Text(title,
          style: TextStyle(
            color: color,
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
