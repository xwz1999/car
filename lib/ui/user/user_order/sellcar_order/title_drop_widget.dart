import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/text_utils.dart';
import 'package:cloud_car/utils/title_drop_down_head_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef TextCallback = Function(String text);

class TitleDropDownWidget extends StatefulWidget {
  final TextCallback? callback;
  final Widget? title;
  final String? tips;

  //标题集合
  final List<String> titles;

  //展开视图集合
  final List<Widget> listWidget;
  // 高度
  final double height;
  final Widget? leftWidget;
  final Widget? rightWidget;
  //子集
  final Widget? child;

//筛选文字大小
  final double headFontSize;

  // 筛选图标icons
  final IconData? iconData;

  //筛选高度 限制
  // BoxConstraints constraints;
  final double bottomHeight;

  final VoidCallback? onTap;

  final TitleScreenControl screenControl;

  const TitleDropDownWidget(
    this.titles,
    this.listWidget, {
    this.height = 42,
    required this.headFontSize,
    this.iconData,
    required this.bottomHeight,
    required this.screenControl,
    Key? key,
    this.onTap,
    this.leftWidget,
    this.rightWidget,
    this.child,
    this.callback,
    this.title,
    this.tips,
  }) : super(key: key);

  @override
  _TitleDropDownWidgetState createState() => _TitleDropDownWidgetState();
}

class TitleScreenControl {
  //自动
  void autoDisplay() {
    if (_controller.isDismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
      rotateState = rotateState.map((e) => false).toList();
    }
  }

  //显示
  void screenShow() {
    _controller.forward();
  }

  //隐藏
  void screenHide() {
    _controller.reverse();
    rotateState = rotateState.map((e) => false).toList();
  }
}

late AnimationController _controller;
late Animation<double> curve;
//按钮旋转状态
List<bool> rotateState = [];

class _TitleDropDownWidgetState extends State<TitleDropDownWidget>
    with SingleTickerProviderStateMixin {
  int tabIndex = 0;

  bool showBottom = false;

  late TextEditingController _editingController;

  late FocusNode _contentFocusNode;

  @override
  void initState() {
    super.initState();
    _contentFocusNode = FocusNode();
    _editingController = TextEditingController();
    widget.bottomHeight;
    //展开隐藏控制器，动画初始化
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    curve = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    curve = Tween(begin: 0.0, end: widget.bottomHeight).animate(curve)
      ..addListener(() {
        setState(() {
          if (curve.value > 0) {
            showBottom = true;
          } else {
            showBottom = false;
          }
        });
      });
    rotateState = [];
    widget.titles.toList().forEach((element) {
      rotateState.add(false);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _editingController.dispose();
    _contentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          height: 188.w,
          child: Padding(
            padding: EdgeInsets.only(top: 10.w),
            child: Row(
              children: [
                widget.leftWidget != null
                    ? widget.leftWidget!
                    : const SizedBox(),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 72.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(16.w)),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: getScreenTitle(),
                    ),
                  ),
                ),
                32.wb,
              ],
            ),
          ),
        ),
        widget.child != null ? widget.child! : const SizedBox(),
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
            child: TitleDropDownHeadWidget(
              widget.titles[i],
              getRoState(i),
              () {
                if (kDebugMode) {
                  print("click${rotateState.length}");
                }
                setState(() {
                  tabIndex = i;
                  for (int j = 0; j < rotateState.length; j++) {
                    if (i == j) {
                      if (rotateState[j]) {
                        rotateState = rotateState.map((e) => false).toList();
                        _controller.reverse();
                      } else {
                        rotateState = rotateState.map((e) => false).toList();
                        rotateState[j] = !rotateState[j];
                        _controller.forward();
                      }
                    }
                  }
                });
              },
              headFontSize: widget.headFontSize,
              iconData: widget.iconData ?? Icons.arrow_drop_down_outlined,
            )));
      }
    } else {
      widgets.add(Text(
        "数组为空",
        style: TextStyle(fontSize: 14.sp),
      ));
    }

    return widgets;
  }

  Widget getBottomScreen() {
    return SizedBox(
      height: showBottom ? double.infinity : 0.0,
      child: GestureDetector(
        onTap: () {},
        child: getBottomIndex(),
      ),
    );
  }

  bool getRoState(int i) {
    if (rotateState.isEmpty || rotateState.length < i + 1) {
      return false;
    }
    return rotateState[i];
  }

  Widget getBottomIndex() {
    widget.bottomHeight;

    return Container(
      margin: EdgeInsets.only(top: widget.height),
      alignment: Alignment.topCenter,
      color: Colors.black26,
      // height: MediaQuery.of(context).size.height - widget.height,
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
}