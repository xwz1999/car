import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_car/utils/headers.dart';

import 'drop_down_head_widget.dart';


class DropDownWidget extends StatefulWidget {
  //标题集合
  final List<String> titles;

  //展开视图集合
  final List<Widget> listWidget;
  // 高度
  final double height;

 //子集
  final Widget child;

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

  final void onTap;

  const DropDownWidget(this.titles, this.listWidget,
      {required this.child,
        this.height = 42,
        required this.headFontSize,
        this.iconData,
        required this.bottomHeight,
        required this.screenControl,
        this.screen,
        Key? key, this.onTap})
      : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}
class ScreenControl {
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


class _DropDownWidgetState extends State<DropDownWidget>
    with SingleTickerProviderStateMixin {
  int tabIndex = 0;
  final ScreenControl _screenControl = ScreenControl();
  bool showBottom = false;




  @override
  void initState() {
    super.initState();
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
    if (kDebugMode) {
      print(widget.headFontSize);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: widget.height,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: const Color(0xffe4e7ed), width: 0.4.r))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getScreenTitle(),
          ),
        ),
        widget.child,
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
              iconData: widget.iconData??Icons.arrow_drop_down_outlined,
            )));
      }
    } else {
      widgets.add(Text(
        "数组为空",
        style: TextStyle(fontSize: 14.sp),
      ));
    }
    if(widget.screen!=null){
      widgets.add(Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: (){
              widget.onTap;
            },
            child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.only(left: 5.r, right: 5.r),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('筛选', style: TextStyle(
                      fontSize: widget.headFontSize, color: const Color(0xff333333))),
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
          _screenControl.screenHide();
        },
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
      height: MediaQuery.of(context).size.height - widget.height,
      width: double.infinity,
      child: Container(
        width: double.infinity,
        //constraints: const BoxConstraints(maxHeight: double.infinity),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom:Radius.circular(16.w)),
          color: Colors.white,
        ),

        child: widget.listWidget[tabIndex],
      ),
    );
  }
}

