import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/ui/home/car_manager/fill_evainfo_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/button/cloud_back_button.dart';
import '../../../widget/picker/car_date_picker.dart';
import '../../../widget/picker/car_picker_box.dart';

class PushCarPage extends StatefulWidget {
  const PushCarPage({Key? key}) : super(key: key);

  @override
  State<PushCarPage> createState() => _PushCarPageState();
}

class _PushCarPageState extends State<PushCarPage> {
  final TextEditingController _vinumController = TextEditingController();
  final String? _brand = '';
  DateTime? _firstdate;
  final TextEditingController _carnummController = TextEditingController();
  final TextEditingController _versionController = TextEditingController();
  final TextEditingController _mileController = TextEditingController();
  final String? _color = '';
  final String? _source = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _vinumController.dispose();
    _carnummController.dispose();
    _versionController.dispose();
    _mileController.dispose();
    BotToast.closeAllLoading();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('车辆发布',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      24.hb,
                      Container(
                        width: double.infinity,
                        height: 200.w,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 24.w, right: 24.w),
                        padding: EdgeInsets.only(left: 55.w, top: 35.w),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/assessment_bg.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: [
                                    const Text(
                                      '剩余评估次数',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ).paddingOnly(top: 10.w),
                                    20.wb,
                                    const Text(
                                      '49',
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ).paddingZero,
                                  ],
                                ),
                                20.wb,
                                Wrap(
                                  children: [
                                    const Text(
                                      '精准估值',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0x99eeeeee)),
                                    ),
                                    20.wb,
                                    const Text(
                                      '守护您的车辆交易',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0x99eeeeee)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            150.wb,
                            GestureDetector(
                              child: Container(
                                width: 120.w,
                                height: 58.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(6.w)),
                                child: const Text(
                                  '去充值',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ).paddingOnly(top: 20.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 200.w),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, -20.0), //阴影xy轴偏移量
                                blurRadius: 15.0, //阴影模糊程度
                                spreadRadius: 1.0 //阴影扩散程度
                                )
                          ]),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Stack(
                              children: [
                                Image.asset(
                                    'assets/images/driving_license2.png'),
                                // Center(
                                //     child: Column(
                                //   children: [
                                //     Container(
                                //       width: 80.w,
                                //       height: 80.w,
                                //       color: Colors.white30,
                                //       child: ClipOval(
                                //         child: Image.asset(
                                //           'assets/images/shooting.png',
                                //           height: 100,
                                //           width: 100,
                                //           fit: BoxFit.cover,
                                //           color: Colors.white54,
                                //           colorBlendMode: BlendMode.difference,
                                //         ),
                                //       ),
                                //     ),
                                //     10.hb,
                                //     const Text(
                                //       '扫描驾驶证',
                                //       style: TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: 13,
                                //         color: Colors.black45,
                                //       ),
                                //     ),
                                //   ],
                                // )).paddingOnly(top: 150.h),
                              ],
                            ),
                          ),
                          _rewardWidget(),
                          100.w.heightBox,
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => const EvainfoPage());
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ),
                              child: '下一步'
                                  .text
                                  .size(30.sp)
                                  .color(Colors.white)
                                  .make(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _rewardWidget() {
    var vinum = _textarea('车架号', '请输入车架号', _carnummController);
    var carnum = _textarea('车牌号', '请输入车牌号', _carnummController);
    var version = _textarea('发动机号', '请输入发动机号', _versionController);
    var mile = Container(
      color: Colors.transparent,
      child: Row(
        children: [
          '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
          10.wb,
          SizedBox(
            width: 160.w,
            child: '表显里程'
                .text
                .size(30.sp)
                .color(Colors.black.withOpacity(0.45))
                .make(),
          ),
          Expanded(
            child: TextField(
              textAlign: TextAlign.start,
              onChanged: (text) => setState(() {}),
              autofocus: false,
              controller: _mileController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  border: InputBorder.none,
                  hintText: '请输入行驶里程',
                  hintStyle: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.black.withOpacity(0.25),
                  )),
            ),
          ),
          24.wb,
          '万公里'.text.size(30.sp).color(Colors.black.withOpacity(0.8)).make(),
        ],
      ),
    );
    var firstdate = Row(
      children: [
        '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
        10.wb,
        SizedBox(
          width: 160.w,
          child: '预计时间'
              .text
              .size(30.sp)
              .color(Colors.black.withOpacity(0.45))
              .make(),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              _firstdate = await CarDatePicker.timePicker(DateTime.now());
              setState(() {});
            },
            child: Material(
              color: Colors.transparent,
              child: (_firstdate == null
                      ? '请选择首次上牌时间'
                      : DateUtil.formatDate(_firstdate,
                          format: DateFormats.zh_mo_d_h_m))
                  .text
                  .size(30.sp)
                  .align(TextAlign.start)
                  .color(Colors.black
                      .withOpacity(_firstdate == null ? 0.25 : 0.85))
                  .make(),
            ),
          ),
        ),
        24.wb,
        Icon(
          CupertinoIcons.chevron_right,
          color: Colors.black.withOpacity(0.45),
          size: 30.w,
        ),
      ],
    );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        children: [
          40.w.heightBox,
          vinum,
          40.w.heightBox,
          _function(
            '选择品牌车型',
            '品牌车型',
            () {},
            _brand!,
            '请输入具体车型',
            Container(),
          ),
          40.w.heightBox,
          firstdate,
          40.w.heightBox,
          carnum,
          40.w.heightBox,
          version,
          40.w.heightBox,
          _function(
            '选择车身颜色',
            '车身颜色',
            () {},
            _color!,
            '请输入车身颜色',
            Wrap(
              children: [
                Container(),
              ],
            ),
          ),
          40.w.heightBox,
          mile,
          40.w.heightBox,
          _function('选择车辆来源', '车辆来源', () {}, _source!, '请选择车辆来源', Container()),
        ],
      ),
    );
  }

  _textarea(
    String title,
    String hint,
    TextEditingController _contentController,
  ) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
          10.wb,
          SizedBox(
            width: 160.w,
            child: title.text
                .size(30.sp)
                .color(Colors.black.withOpacity(0.45))
                .make(),
          ),
          Expanded(
            child: TextField(
              textAlign: TextAlign.start,
              onChanged: (text) => setState(() {}),
              autofocus: false,
              controller: _contentController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.black.withOpacity(0.25),
                  )),
            ),
          ),
          24.wb,
        ],
      ),
    );
  }

  _function(
    String head,
    String title,
    VoidCallback onTap,
    String content,
    String msg,
    Widget child,
  ) {
    return GestureDetector(
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          builder: (context) {
            return CarPickerBox(
              title: head,
              onPressed: () {
                Get.back();
                setState(() {});
              },
              child: child,
            );
          },
        );
      },
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
            10.wb,
            SizedBox(
              width: 160.w,
              child: title.text
                  .size(30.sp)
                  .color(Colors.black.withOpacity(0.45))
                  .make(),
            ),
            (content.isEmpty ? msg : content)
                .text
                .size(30.sp)
                .color(Colors.black.withOpacity(content.isEmpty ? 0.25 : 0.85))
                .make(),
            const Spacer(),
            Icon(
              CupertinoIcons.chevron_right,
              color: Colors.black.withOpacity(0.45),
              size: 28.w,
            ),
          ],
        ),
      ),
    );
  }
}

class RadioModel {
  bool? isSelected;
  String? buttonText;

  RadioModel(
    this.isSelected,
    this.buttonText,
  );
}
