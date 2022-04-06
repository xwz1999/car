
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'edit_item_widget.dart';

class ShareCarDetailPage extends StatefulWidget {
  final bool isMore;

  const ShareCarDetailPage({
    Key? key, required this.isMore,
  }) : super(key: key);

  @override
  _ShareCarDetailPageState createState() => _ShareCarDetailPageState();
}

class _ShareCarDetailPageState extends State<ShareCarDetailPage>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;
  bool isKeyBord = false;///防止键盘遮挡输入框
  final GlobalKey<EditItemWidgetState> _key = GlobalKey();
  late String _selfText = '';

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isMore?
    Container(
      width:  double.infinity,
      height: 468.w,
      decoration: BoxDecoration(
          color: BaseStyle.colorf6f6f6,
          borderRadius: BorderRadius.all(Radius.circular(16.w))),
      child: Column(
        children: [
          32.hb,
          Row(
            children: [
              30.wb,
              const Spacer(),
              Text(
                '批量分享车辆',
                style: TextStyle(color:const Color(0xFF111111), fontSize: 32.sp,fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Icon(
                CupertinoIcons.clear,
                size: 30.w,
              ),
              30.wb,
            ],
          ),
          40.hb,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.icons.icShareLink.path,
                      width: 96.w,
                      height: 96.w,
                    ),
                    5.hb,
                    Text(
                      '复制链接',
                      style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: BaseStyle.fontSize24),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.icons.icShareWx.path,
                      width: 96.w,
                      height: 96.w,
                    ),
                    5.hb,
                    Text(
                      '微信',
                      style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: BaseStyle.fontSize24),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.icons.icShareWxCircle.path,
                      width: 96.w,
                      height: 96.w,
                    ),
                    5.hb,
                    Text(
                      '朋友圈',
                      style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: BaseStyle.fontSize24),
                    )
                  ],
                ),
              ),
            ],
          ),
          40.hb,
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 32.w),
            height: 72.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.w)),
            ),
            child: Text(
              '取  消',
              style: TextStyle(
                  fontSize: BaseStyle.fontSize28,
                  fontWeight: FontWeight.bold,
                  color: BaseStyle.color333333),
            ),
          ),
          50.hb,
        ],
      ),
    ):
      SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          26.hb,
          isKeyBord?50.hb:const SizedBox(),
          Row(
            children: [
              30.wb,
              const Spacer(),
              Text(
                '分享车辆',
                style: TextStyle(color:const Color(0xFF111111), fontSize: 32.sp),
              ),
              const Spacer(),
              Icon(
                CupertinoIcons.clear,
                size: 30.w,
              ),
              30.wb,
            ],
          ),
          30.hb,
          Container(
            width: double.infinity,
            height: 600.w,
            padding: EdgeInsets.symmetric(horizontal: 94.w, vertical: 40.w),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(16.w))),
            child: Container(
              width: 560.w,
              height: 528.w,
              decoration: BoxDecoration(
                  color: kForeGroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(16.w))),
              child: Column(
                children: const [],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 392.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16.w))),
            child: Column(
              children: [
                TabBar(
                    onTap: (index) {
                      if (index == 2) {
                        isKeyBord = true;
                        FocusScope.of(context).requestFocus(_key.currentState?.focusNode);
                      }else{
                        isKeyBord = false;
                        _key.currentState?.focusNode.unfocus();
                      }
                      setState(() {});
                    },
                    isScrollable: true,
                    labelPadding:
                        EdgeInsets.symmetric(vertical: 10.w, horizontal: 40.w),
                    controller: _tabController,
                    indicatorWeight: 3,
                    labelColor: BaseStyle.color111111,
                    unselectedLabelColor: BaseStyle.color999999,
                    indicatorPadding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 0.w),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                    ),
                    indicatorColor: kPrimaryColor,
                    tabs: [_tab(0, '标准版'), _tab(1, '简洁版'), _tab(2, '自定义版')]),
                Divider(color: BaseStyle.coloreeeeee,height: 1.w,),
                SizedBox(
                  height: 240.w,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      EditItemWidget(
                        canEdit: false,
                        text: '标准版',
                        callback: (String text) {},
                        boolCallback: (bool isFocusNode) {},
                      ),
                      EditItemWidget(
                        canEdit: false,
                        text: '简约版',
                        callback: (String text) {},
                        boolCallback: (bool isFocusNode) {},
                      ),
                      EditItemWidget(
                        key: _key,
                        canEdit: true,
                        text: _selfText,
                        callback: (String text) {
                          _selfText = text;
                          setState(() {});
                        },
                        boolCallback: (bool isFocusNode) {
                          isKeyBord = isFocusNode;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                
                Row(
                  children: [
                    32.wb,
                    GestureDetector(
                      child: Text(
                        '下载汽车详情图片',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: BaseStyle.fontSize24),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: Text(
                        '复制文案',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: BaseStyle.fontSize24),
                      ),
                    ),
                    32.wb,
                  ],
                ),
                32.hb,
              ],
            ),
          ),
          40.hb,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.icons.icShareLink.path,
                      width: 96.w,
                      height: 96.w,
                    ),
                    5.hb,
                    Text(
                      '复制链接',
                      style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: BaseStyle.fontSize24),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.icons.icShareDowload.path,
                      width: 96.w,
                      height: 96.w,
                    ),
                    5.hb,
                    Text(
                      '保存图片',
                      style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: BaseStyle.fontSize24),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.icons.icShareWx.path,
                      width: 96.w,
                      height: 96.w,
                    ),
                    5.hb,
                    Text(
                      '微信',
                      style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: BaseStyle.fontSize24),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.icons.icShareWxCircle.path,
                      width: 96.w,
                      height: 96.w,
                    ),
                    5.hb,
                    Text(
                      '朋友圈',
                      style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: BaseStyle.fontSize24),
                    )
                  ],
                ),
              ),
            ],
          ),
          40.hb,
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 32.w),
            height: 72.w,
            decoration: BoxDecoration(
              color: kForeGroundColor,
              borderRadius: BorderRadius.all(Radius.circular(8.w)),
            ),
            child: Text(
              '取  消',
              style: TextStyle(
                  fontSize: BaseStyle.fontSize28,
                  fontWeight: FontWeight.bold,
                  color: BaseStyle.color333333),
            ),
          ),
          60.hb,
          isKeyBord ? 500.hb : const SizedBox(),
        ],
      ),
    );
  }

  _tab(int index, String text) {
    return Text(text);
  }
}
