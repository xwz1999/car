import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/extensions/string_extension.dart';
import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/share_util.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

import 'edit_item_widget.dart';

class ShareCarDialog extends StatefulWidget {
  final bool isMore;
  final List<CarListModel> model;

  const ShareCarDialog({
    super.key,
    required this.isMore,
    required this.model,
  });

  @override
  _ShareCarDialogState createState() => _ShareCarDialogState();
}

class _ShareCarDialogState extends State<ShareCarDialog>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isKeyBord = false;

  ///防止键盘遮挡输入框
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
    return widget.isMore
        ? Container(
            width: double.infinity,
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
                      style: TextStyle(
                          color: const Color(0xFF111111),
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        CupertinoIcons.clear,
                        size: 30.w,
                      ),
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
                      child: GestureDetector(
                        onTap: () async {
                          ShareUtil.copyToClipboard(
                              widget.model.first.mainPhoto.imageWithHost);
                        },
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
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          ShareUtil.shareMiniProgram(
                            title:
                                '${UserTool.userProvider.userInfo.nickname}分享了${widget.model.length}辆好车',
                            imgUrl: widget.model.first.mainPhoto,
                            carIds: widget.model.map((e) => e.id).toList(),
                          );
                        },
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
                    ),
                    // Expanded(
                    //   child: GestureDetector(
                    //     onTap: () async {
                    //       ShareUtil.shareNetWorkImage(
                    //           title: widget.model.first.modelName,
                    //           imgUrl: widget.model.first.mainPhoto,
                    //           scene: fluwx.WeChatScene.TIMELINE);
                    //     },
                    //     child: Column(
                    //       children: [
                    //         Image.asset(
                    //           Assets.icons.icShareWxCircle.path,
                    //           width: 96.w,
                    //           height: 96.w,
                    //         ),
                    //         5.hb,
                    //         Text(
                    //           '朋友圈',
                    //           style: TextStyle(
                    //               color: const Color(0xFF666666),
                    //               fontSize: BaseStyle.fontSize24),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                40.hb,
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
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
                ),
                50.hb,
              ],
            ),
          )
        : SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                26.hb,
                isKeyBord ? 50.hb : const SizedBox(),
                Row(
                  children: [
                    30.wb,
                    const Spacer(),
                    Text(
                      '分享车辆',
                      style: TextStyle(
                          color: const Color(0xFF111111), fontSize: 32.sp),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        CupertinoIcons.clear,
                        size: 30.w,
                      ),
                    ),
                    30.wb,
                  ],
                ),
                30.hb,
                Container(
                  width: double.infinity,
                  height: 600.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 94.w, vertical: 40.w),
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
                    child: CloudImageNetworkWidget.car(
                      urls: [widget.model.first.mainPhoto],
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
                              FocusScope.of(context)
                                  .requestFocus(_key.currentState?.focusNode);
                            } else {
                              isKeyBord = false;
                              _key.currentState?.focusNode.unfocus();
                            }
                            setState(() {});
                          },
                          isScrollable: true,
                          labelPadding: EdgeInsets.symmetric(
                              vertical: 10.w, horizontal: 40.w),
                          controller: _tabController,
                          labelColor: kPrimaryColor,
                          unselectedLabelColor: BaseStyle.color999999,
                          indicatorPadding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 0.w),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorWeight: 4.w,
                          // indicator: BoxDecoration(borderRadius: BorderRadius.circular(2.w),color: kPrimaryColor,),
                          labelStyle: TextStyle(
                              color: Colors.white.withOpacity(0.85),
                              fontWeight: FontWeight.bold),
                          tabs: [
                            _tab(0, '标准版'),
                            _tab(1, '简洁版'),
                            _tab(2, '自定义版')
                          ]),
                      Divider(
                        color: BaseStyle.coloreeeeee,
                        height: 1.w,
                      ),
                      SizedBox(
                        height: 240.w,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            EditItemWidget(
                              canEdit: false,
                              text: _copyWriting(0),
                              callback: (String text) {},
                              boolCallback: (bool isFocusNode) {},
                            ),
                            EditItemWidget(
                              canEdit: false,
                              text: _copyWriting(1),
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
                            onTap: () async {
                              var cancel = BotToast.showLoading();
                              ShareUtil.saveNetImageToGallery(
                                  widget.model.first.mainPhoto);
                              cancel();
                            },
                            child: Text(
                              '下载汽车详情图片',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: BaseStyle.fontSize24),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              ShareUtil.copyToClipboard(
                                  _copyWriting(_tabController.index));
                            },
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
                      child: GestureDetector(
                        onTap: () {
                          ShareUtil.copyToClipboard(
                              widget.model.first.mainPhoto.imageWithHost);
                        },
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
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ShareUtil.saveNetImageToGallery(
                              widget.model.first.mainPhoto);
                        },
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
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ShareUtil.shareMiniProgram(
                            title: widget.model.first.modelName,
                            imgUrl: widget.model.first.mainPhoto,
                            carIds: [widget.model.first.id],
                          );
                        },
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
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ShareUtil.shareNetWorkImage(
                              title: widget.model.first.modelName,
                              imgUrl: widget.model.first.mainPhoto,
                              scene: fluwx.WeChatScene.TIMELINE);
                        },
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
                    ),
                  ],
                ),
                40.hb,
                Padding(
                  padding: EdgeInsets.all(32.w),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                    color: kForeGroundColor,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(8.w)),
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 72.w,
                        decoration: BoxDecoration(
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
                    ),
                  ),
                ),
                60.hb,
                isKeyBord ? 500.hb : const SizedBox(),
              ],
            ),
          );
  }

  String _copyWriting(int index) {
    switch (index) {
      case 0:
        return '【车辆名称】${widget.model.first.modelName}\n'
            '【上牌时间】${DateUtil.formatDate(widget.model.first.licensingDateDT, format: DateFormats.zh_y_mo)}\n'
            '【行驶里程】${widget.model.first.mileage}万公里\n'
            '【车辆排量】${widget.model.first.downPayment}T\n'
            '【车辆价格】${widget.model.first.unitPrice}万\n'
            '【联系方式】${UserTool.userProvider.userInfo.phone}\n'
            '【诚信车商】云云问车\n'
            '【车辆详情】${widget.model.first.mainPhoto.imageWithHost}';
      case 1:
        return '💥好车推荐💥\n${widget.model.first.modelName}， '
            '仅售${NumUtil.divide(num.parse(widget.model.first.price), 10000)}，'
            '${UserTool.userProvider.userInfo.nickname}24小时在线，等你来撩${UserTool.userProvider.userInfo.phone}';
      case 2:
        return _selfText;
      default:
        return '';
    }
  }

  _tab(int index, String text) {
    return Text(text);
  }
}
