
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/material.dart';

typedef TextCallback = Function(String content);

///对list或者grid形式的列表进行选择操作
class CarListPicker extends StatefulWidget {
  final TextCallback onPressed;
  final String confirmString;
  final String? title;
  final bool isGrid;///是否是grid列表
  final List<ChooseItem> items;

  const CarListPicker(
      {Key? key,
      required this.onPressed,
      this.confirmString = '确认',
      this.title, this.isGrid = true,
      required this.items})
      : super(key: key);

  @override
  _CarListPickerState createState() => _CarListPickerState();
}

class _CarListPickerState extends State<CarListPicker> {
  late String _chooseItem = '';


  @override
  Widget build(BuildContext context) {
    return Material(
      color: kForeGroundColor,
      child: SizedBox(
        height: 650.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 88.w,
              child: NavigationToolbar(
                leading: _buildButton(
                  title: '取消',
                  onPressed: () => Navigator.pop(context),
                  color:Colors.black26,
                ),
                middle: Text(
                  widget.title ?? '',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
                trailing: _buildButton(
                  title: widget.confirmString,
                  onPressed: widget.onPressed(_chooseItem),
                  color: Colors.blue,
                ),
              ),
            ),
            Expanded(child:
            widget.isGrid?
            ScreenWidget(
              childAspectRatio: 72 / 28,
              callback: (String item) {
                _chooseItem = item;
                setState(() {

                });
              },
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 24.w,
              crossAxisCount: 4,
              haveButton: true,
              itemList: widget.items,
            ):ListView(

            )

            ),
          ],
        ),
      ),
    );
  }


  _buildButton({
    required String title,
    required VoidCallback? onPressed,
    required Color color,
  }) {
    return SizedBox(
      // height: 48.w,
      child: TextButton(
        onPressed: onPressed,
        child: Text(title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
