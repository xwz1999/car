import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/text_utils.dart';
import 'package:cloud_car/utils/title_drop_down_head_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef TextCallback = Function(String text);


///只包含筛选的头部 底部列表分开

class TitleDropHeadWidget extends StatefulWidget {
  final TextCallback? callback;
  final Widget? title;
  final String? tips;
  final bool isNotSearch; //有无搜索
  final bool? isSearch;

  //标题集合
  final List<String> titles;

  //展开视图集合
  final List<Widget> listWidget;
  // 高度
  final double height;
  final Widget? leftWidget;

//筛选文字大小
  final double headFontSize;

  // 筛选图标icons
  final IconData? iconData;

  //筛选高度 限制
  // BoxConstraints constraints;
  final double bottomHeight;

  final TitleHeadScreenControl screenControl;

  final VoidCallback? onTap;

  const TitleDropHeadWidget(
    this.titles,
    this.listWidget, {
    this.height = 42,
    required this.headFontSize,
    this.iconData,
    required this.bottomHeight,
    required this.screenControl,
    Key? key,
    this.onTap,

    this.callback,
    this.title,
    this.tips,    this.isSearch = true,
        this.isNotSearch = true, this.leftWidget,

  }) : super(key: key);

  @override
  _TitleDropHeadWidgetState createState() => _TitleDropHeadWidgetState();
}

class TitleHeadScreenControl {

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
}



class _TitleDropHeadWidgetState extends State<TitleDropHeadWidget>
    with SingleTickerProviderStateMixin {
  int tabIndex = 0;
  bool showBottom = false;
  late TextEditingController _editingController;
  String _searchText = "";
  late FocusNode _contentFocusNode;
  late bool _show = false;

  @override
  void initState() {
    super.initState();
    _contentFocusNode = FocusNode();
    _editingController = TextEditingController();
    widget.bottomHeight;
    //展开隐藏控制器，动画初始化
    widget.screenControl.animateController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    widget.screenControl.curve = CurvedAnimation(parent: widget.screenControl.animateController, curve: Curves.decelerate);
    widget.screenControl.curve = Tween(begin: 0.0, end: widget.bottomHeight).animate( widget.screenControl.curve)
      ..addListener(() {
        setState(() {
          if ( widget.screenControl.curve.value > 0) {
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
    widget.screenControl.animateController.dispose();
    _editingController.dispose();
    _contentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isSearch!
            ? Padding(
          padding: EdgeInsets.only(top: 10.w),
          child: Row(
            children: [
              widget.leftWidget != null
                  ? widget.leftWidget!
                  : const SizedBox(),
              _show
                  ? SizedBox(
                width: 500.w,
                height: 72.w,
                child: TextField(
                  keyboardType: TextInputType.text,
                  onEditingComplete: () {
                    setState(() {});
                    // _refreshController.callRefresh();
                  },
                  focusNode: _contentFocusNode,
                  onChanged: (text) {
                    _searchText = text;
                    setState(() {});
                  },
                  onTap: () {},
                  onSubmitted: (_submitted) async {
                    if (TextUtils.isEmpty(_searchText)) return;
                    _contentFocusNode.unfocus();
                    _searchText = _searchText.trimLeft();
                    _searchText = _searchText.trimRight();
                    widget.callback!(_searchText);

                    setState(() {});
                  },
                  style: TextStyle(
                    textBaseline: TextBaseline.ideographic,
                    fontSize: 32.sp,
                    color: Colors.black,
                  ),
                  controller: _editingController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.w),
                    filled: true,
                    fillColor: const Color(0xFFF6F6F6),
                    hintText: widget.tips,
                    hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                    prefixIcon: const Icon(
                      CupertinoIcons.search,
                      size: 16,
                    ),

                    suffixIcon: _searchText.isNotEmpty
                        ? GestureDetector(
                      onTap: () {
                        _searchText = '';
                        _editingController.text = '';
                        setState(() {});
                      },
                      child: Container(
                          width: 32.w,
                          height: 32.w,
                          alignment: Alignment.center,
                          child: Image.asset(
                            Assets.icons.icClose.path,
                            width: 32.w,
                            height: 32.w,
                          )),
                    )
                        : const SizedBox(),
                    enabledBorder: UnderlineInputBorder(
                      //
                      // 不是焦点的时候颜色
                      borderRadius: BorderRadius.circular(36.w),
                      borderSide: const BorderSide(
                        color: kForeGroundColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      // 焦点集中的时候颜色
                      borderRadius: BorderRadius.circular(36.w),
                      borderSide: const BorderSide(
                          color: kForeGroundColor),
                    ),
                    //border: InputBorder.none,
                  ),
                ),
              )
                  : Expanded(
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
              _show ? const Spacer() : const SizedBox(),
              widget.isNotSearch
                  ?48.wb
                  : _show
                  ? GestureDetector(
                onTap: () {
                  _show = false;
                  setState(() {});
                },
                child: Text('取消',
                    style: TextStyle(
                        color: BaseStyle.color111111,
                        fontWeight: FontWeight.bold,
                        fontSize: 32.sp)),
              )
                  : GestureDetector(
                onTap: () {
                  _show = true;

                  setState(() {});
                },
                child: Image.asset(
                    Assets.icons.mainSearch.path,
                    height: 48.w,
                    width: 48.w),
              ),
              32.wb,
            ],
          ),
        )
            : Padding(
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
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.chevron_back,
                  color: Colors.transparent,
                ),
              ),
            ],
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
            child: TitleDropDownHeadWidget(
              widget.titles[i],
              getRoState(i),
              () {
                if (kDebugMode) {
                  print("click${widget.screenControl.rotateState.length}");
                }
                setState(() {
                  tabIndex = i;
                  for (int j = 0; j < widget.screenControl.rotateState.length; j++) {
                    if (i == j) {
                      if (widget.screenControl.rotateState[j]) {
                        widget.screenControl.rotateState = widget.screenControl.rotateState.map((e) => false).toList();
                        widget.screenControl.animateController.reverse();
                      } else {
                        widget.screenControl.rotateState = widget.screenControl.rotateState.map((e) => false).toList();
                        widget.screenControl.rotateState[j] = !widget.screenControl.rotateState[j];
                        widget.screenControl.animateController.forward();
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
    return
      showBottom?
      Expanded(
      child: GestureDetector(
        onTap: () {
          widget.screenControl.screenHide();
        },
        child: getBottomIndex(),
      ),
    ):const SizedBox();
  }

  bool getRoState(int i) {
    if (widget.screenControl.rotateState.isEmpty || widget.screenControl.rotateState.length < i + 1) {
      return false;
    }
    return widget.screenControl.rotateState[i];
  }

  Widget getBottomIndex() {
    return Container(
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