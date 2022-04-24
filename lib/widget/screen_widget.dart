
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef ItemCallback = Function(String item);

class ScreenWidget extends StatefulWidget {
  final List<ChooseItem> itemList;
  final ItemCallback callback;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final bool haveButton;
  final bool isGrid;

  const ScreenWidget(
      {Key? key,
      required this.itemList,
      required this.callback,
      required this.crossAxisCount,
      required this.mainAxisSpacing,
      required this.crossAxisSpacing,
      required this.childAspectRatio,
      this.haveButton = false, this.isGrid = true})
      : super(key: key);

  @override
  _ScreenWidgetState createState() => _ScreenWidgetState();
}

class _ScreenWidgetState extends State<ScreenWidget> {
  // late final String _chooseItem = '';

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
    return     Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 24.w,bottom: 40.w,left: 32.w,right: 32.w),
        child: SortWidget(
          isGrid: widget.isGrid,
          crossAxisSpacing: widget.crossAxisSpacing,
          itemList: widget.itemList,
          childAspectRatio: widget.childAspectRatio,
          crossAxisCount: widget.crossAxisCount,
          mainAxisSpacing: widget.mainAxisSpacing,
          callback: (ChooseItem item, int index) {
            for (int i = 0; i < widget.itemList.length; i++) {
              if (i != index) {
                widget.itemList[i].isChoose = false;
              } else {
                widget.itemList[i].isChoose = !widget.itemList[i].isChoose;
              }
            }
            if (kDebugMode) {
              print(item.name);
            }
            widget.callback(item.name);
          },
        ),
      ),
    );

    //   ListView(
    //   padding: EdgeInsets.zero,
    //   shrinkWrap: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   children: [
    //     Padding(
    //       padding: EdgeInsets.only(left: 32.w, right: 32.w,top: 24.w),
    //       child: SortWidget(
    //         isGrid: widget.isGrid,
    //         crossAxisSpacing: widget.crossAxisSpacing,
    //         itemList: widget.itemList,
    //         childAspectRatio: widget.childAspectRatio,
    //         crossAxisCount: widget.crossAxisCount,
    //         mainAxisSpacing: widget.mainAxisSpacing,
    //         callback: (ChooseItem item, int index) {
    //           for (int i = 0; i < widget.itemList.length; i++) {
    //             if (i != index) {
    //               widget.itemList[i].isChoose = false;
    //             } else {
    //               widget.itemList[i].isChoose = !widget.itemList[i].isChoose;
    //             }
    //           }
    //           if (kDebugMode) {
    //             print(item.name);
    //           }
    //           widget.callback(item.name);
    //           setState(() {});
    //         },
    //       ),
    //     ),
    //     // widget.haveButton ? 48.hb: const SizedBox(),
    //     // widget.haveButton ? _confirmBtn() : const SizedBox(),
    //     40.hb,
    //   ],
    // );
  }

  // _confirmBtn() {
  //   return GestureDetector(
  //     onTap: () {
  //       if (_chooseItem.isNotEmpty) {
  //         widget.callback(_chooseItem);
  //       } else {
  //         BotToast.showText(text: '请先选择一个区间分类');
  //       }
  //     },
  //     child: Container(
  //       width: double.infinity,
  //       padding: EdgeInsets.symmetric(vertical: 16.w),
  //       alignment: Alignment.center,
  //       margin: EdgeInsets.only(left: 32.w, right: 32.w),
  //       decoration: BoxDecoration(
  //         gradient: const LinearGradient(
  //           colors: <Color>[
  //             Color(0xFF0593FF),
  //             Color(0xFF027AFF),
  //           ],
  //         ),
  //         borderRadius: BorderRadius.all(Radius.circular(8.w)),
  //       ),
  //       child: Text(
  //         '确  定',
  //         style: TextStyle(
  //             color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
  //       ),
  //     ),
  //   );
  // }
}
