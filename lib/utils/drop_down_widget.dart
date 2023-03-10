// ignore_for_file: body_might_complete_normally_nullable

import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'drop_down_head_widget.dart';

class DropDownWidget extends StatefulWidget {
  //标题集合
  final List<String> titles;

  //展开视图集合
  final List<Widget> listWidget;

  // 高度
  final double height;

  //子集
  final Widget? child;

  ///筛选
  final String? screen;

//筛选文字大小
  final double headFontSize;

  // 筛选图标icons
  final IconData? iconData;

  //筛选高度 限制
  // BoxConstraints constraints;
  final double bottomHeight;

  final ScreenControl screenControl;

  final VoidCallback? onTap;

  const DropDownWidget(this.titles, this.listWidget,
      {this.child,
      this.height = 42,
      required this.headFontSize,
      this.iconData,
      required this.bottomHeight,
      required this.screenControl,
      this.screen,
      super.key,
      this.onTap});

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class ScreenControl {
  
  late AnimationController animateController;
  late Animation<double> curve;
//按钮旋转状态
  List<bool> rotateState = [];
  //自动
  void autoDisplay() {
    if (animateController.isDismissed) {
      animateController.forward();
    } else {
      animateController.reverse();
      rotateState = rotateState.map((e) => false).toList();
    }
  }

  //显示
  void screenShow() {
    animateController.forward();
  }

  //隐藏
  void screenHide() {
    animateController.reverse();
    rotateState = rotateState.map((e) => false).toList();
  }

  void disPose(){
    animateController.dispose();
  }
}


class _DropDownWidgetState extends State<DropDownWidget>
    with SingleTickerProviderStateMixin {
  int tabIndex = 0;
  bool showBottom = false;

  @override
  void initState() {
    super.initState();
    //widget.bottomHeight;
    //展开隐藏控制器，动画初始化
    widget.screenControl.animateController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    widget.screenControl.curve = CurvedAnimation(parent: widget.screenControl.animateController, curve: Curves.decelerate);
    widget.screenControl.curve = Tween(begin: 0.0, end: widget.bottomHeight).animate(widget.screenControl.curve)
      ..addListener(() {
        setState(() {
          if (widget.screenControl.curve.value > 0) {
            showBottom = true;
          } else {
            showBottom = false;
          }
        });
      });
    widget.screenControl.rotateState = [];
    widget.titles.toList().forEach((element) {
      widget.screenControl.rotateState.add(false);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child != null ? widget.child! : const SizedBox(),
        Container(
          alignment: Alignment.center,
          height: widget.height,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1.w),
                blurRadius: 0.5.w,
                color: BaseStyle.colordddddd,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getScreenTitle(),
          ),
        ),
        getBottomScreen()
      ],
    );
  }

  List<Widget> getScreenTitle() {
    List<Widget> widgets = [];

    if (widget.titles.isNotEmpty) {
      for (int i = 0; i < widget.titles.length; i++) {
        widgets.add(Expanded(
            flex: 1,
            child: DropDownHeadWidget(
              title: widget.titles[i],
              isForward: getRoState(i),
              onClick: () {
                if (kDebugMode) {
                  print("click${widget.screenControl.rotateState.length}");
                }
                setState(() {
                  tabIndex = i;
                  for (int j = 0;
                      j < widget.screenControl.rotateState.length;
                      j++) {
                    if (i == j) {
                      if (widget.screenControl.rotateState[j]) {
                        widget.screenControl.rotateState = widget
                            .screenControl.rotateState
                            .map((e) => false)
                            .toList();

                        widget.screenControl.animateController.reverse();
                      } else {
                        widget.screenControl.rotateState = widget
                            .screenControl.rotateState
                            .map((e) => false)
                            .toList();
                        widget.screenControl.rotateState[j] =
                            !widget.screenControl.rotateState[j];

                        widget.screenControl.animateController.forward();
                      }
                    }
                  }
                });
              },
              headFontSize: widget.headFontSize,
              iconData: widget.iconData ?? Icons.arrow_drop_down_outlined,

              // decoration: get(),
            )));
      }
    } else {
      widgets.add(Text(
        "数组为空",
        style: TextStyle(fontSize: 14.sp),
      ));
    }

    if (widget.screen != null) {
      widgets.add(Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: widget.onTap!,
            child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white),
                padding: EdgeInsets.only(left: 5.r, right: 5.r),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('筛选',
                      style: TextStyle(
                          fontSize: widget.headFontSize,
                          color: const Color(0xff333333))),
                ])),
          )));
    }
    return widgets;
  }

  Widget getBottomScreen() {
    return SizedBox(
      height: showBottom ? double.infinity : 0.0,
      child: GestureDetector(
        onTap: () {
          widget.screenControl.screenHide();
        },
        child: getBottomIndex(),
      ),
    );
  }

  bool getRoState(int i) {
    if (widget.screenControl.rotateState.isEmpty || widget.screenControl.rotateState.length < i + 1) {
      return false;
    }
    return widget.screenControl.rotateState[i];
  }

  Widget getBottomIndex() {
    //widget.bottomHeight;
    return Container(
      margin: EdgeInsets.only(top: widget.height),
      alignment: Alignment.topCenter,
      color: Colors.black26,
      height: MediaQuery.of(context).size.height - widget.height,
      width: double.infinity,
      child: Container(
        width: double.infinity,
        //constraints: const BoxConstraints(maxHeight: double.infinity),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.w)),
          color: Colors.white,
        ),

        child: widget.listWidget[tabIndex],
      ),
    );
  }

  Decoration? get() {
    for (int i = 0; i < widget.titles.length; i++) {
      //const int index = widget.titles.length - 1;
      switch (i) {
        case 0:
          return BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.w),
              ),
              color: Colors.white);
          // ignore: dead_code
          break;
        // case index:
        //   return BoxDecoration(
        //       borderRadius: BorderRadius.only(
        //     bottomRight: Radius.circular(16.w),
        //   ));
        //   // ignore: dead_code
        //   break;
        default:
          return BoxDecoration(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.w),
          ));
          // ignore: dead_code
          break;
      }
    }
  }
}
