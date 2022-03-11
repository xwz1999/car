
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef ItemCallback = Function(ChooseItem item);

class SortListWidget extends StatefulWidget {
  final List<ChooseItem>? itemList;
  final ItemCallback callback;
  final int crossAxisCount;
  final String title;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final Widget? rightWidget;

  const SortListWidget({
    Key? key,
    this.itemList,
    required this.callback,
    required this.crossAxisCount,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
    required this.childAspectRatio,
    required this.title,
    this.rightWidget,
  }) : super(key: key);

  @override
  _SortListWidgetState createState() => _SortListWidgetState();
}

class _SortListWidgetState extends State<SortListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  color: BaseStyle.color333333,
                  fontSize: BaseStyle.fontSize28,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            widget.rightWidget ?? const SizedBox()
          ],
        ),
        widget.itemList != null
            ? Padding(
          padding:  EdgeInsets.only(top: 24.w),
              child: SortWidget(
                  crossAxisSpacing: widget.mainAxisSpacing,
                  itemList: widget.itemList ?? [],
                  childAspectRatio: widget.childAspectRatio,
                  crossAxisCount: widget.crossAxisCount,
                  mainAxisSpacing: widget.mainAxisSpacing,
                  callback: (ChooseItem item, int index) {
                    if (widget.itemList != null) {
                      for (int i = 0; i < widget.itemList!.length; i++) {
                        if (i != index) {
                          widget.itemList![i].isChoose = false;
                        } else {
                          widget.itemList![i].isChoose =
                              !widget.itemList![i].isChoose;
                        }
                      }
                    }
                    if (kDebugMode) {
                      print(item.name);
                    }
                    widget.callback(item);
                    setState(() {});
                  },
                ),
            )
            : const SizedBox(),
        16.hb,

      ],
    );
  }
}
