// ignore_for_file: file_names

import 'package:cloud_car/model/configuration_model.dart';
import 'package:cloud_car/ui/user/user_feedback/vehicles_release.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';
import '../../../widget/button/colud_check_radio.dart';

class Recommendations extends StatefulWidget {
  const Recommendations({Key? key}) : super(key: key);

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  final List<int> _selectIndex = [];
  final List<ConfigurationModel> _chooseModels = []; //
  List<ConfigurationModel> moddels = [
    ConfigurationModel(title: '销售员', subtitle: '能够查看全店的车，并进行客户跟进、销售下单'),
    ConfigurationModel(title: '评估师/车务', subtitle: '负责录入车辆信息、编辑店里的车辆'),
    ConfigurationModel(title: '销售/车务', subtitle: '可以录入车辆信息、编辑车辆，并进行客户跟进、销售下单'),
    ConfigurationModel(title: '店长', subtitle: '能够管理店内的客户、车辆、订单'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        title: Text('产品建议',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        backgroundColor: kForeGroundColor,

        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: bodyColor,
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          32.hb,
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: Text(
              '请选择建议类型',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          24.hb,
          Container(
              height: 400.w,
              color: kForeGroundColor,
              padding: EdgeInsets.symmetric(
                horizontal: 32.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return _getItem(index, moddels[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                              //   color: const Color(0xFFF6F6F6),
                              //   height: 16.w,
                              ); //背景色高度
                        },
                        itemCount: moddels.length),
                  ),
                ],
              )),
          32.hb,
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: Text(
              '问题和意见',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          24.hb,
          Container(
              height: 435.w,
              color: kForeGroundColor,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    // padding:
                    //     EdgeInsets.symmetric(vertical: 16.w, horizontal: 20.w),
                    height: 120.w,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      onEditingComplete: () {
                        setState(() {});
                        // _refreshController.callRefresh();
                      },
                      onChanged: (text) {
                        setState(() {});
                      },

                      style: TextStyle(
                        color: BaseStyle.color333333,
                        fontSize: BaseStyle.fontSize28,
                      ),
                      // controller: _editingController5,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        isDense: true,
                        fillColor: Colors.white,
                        hintText: "请输入您的问题并上传页面截屏可帮助技术人员更快地解决问题",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 10,
                            fontWeight: FontWeight.w300),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  //108.hb,
                  SizedBox(
                    width: 200.w,
                    height: 120,
                    child: Image.asset(Assets.images.addcar.path),
                  ),
                ],
              )),
          32.hb,
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: Text(
              '联系方式',
              style: TextStyle(
                  color: const Color(0xFF111111),
                  fontSize: BaseStyle.fontSize28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          24.hb,
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              onEditingComplete: () {
                setState(() {});
                // _refreshController.callRefresh();
              },
              onChanged: (text) {
                setState(() {});
              },
              style: TextStyle(
                color: BaseStyle.color333333,
                fontSize: BaseStyle.fontSize28,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 32.w),
                filled: true,
                fillColor: Colors.white,
                hintText: "请输入您的手机号码方便联系",
                hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
                border: InputBorder.none,
              ),
            ),
          ),
          96.hb,
          GestureDetector(
            onTap: () {
              //BotToast.showText(text: '验证码输入错误');
              Get.to(() => const VehiclesRelease());
            },
            child: Container(
              width: 686.w,
              height: 72.w,
              margin: EdgeInsets.only(left: 32.w),
              padding: EdgeInsets.only(left: 318.w, top: 22.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF0593FF), Color(0xFF027AFF)])),
              child: SizedBox(
                width: 252.w,
                height: 28.w,
                child: Text(
                  '提交',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: const Color(0xffffffff)),
                ),
              ),
            ),
          ),
          32.hb,
        ],
      ),
    );
  }

  _getItem(
    int index,
    ConfigurationModel model,
  ) {
    return SizedBox(
      height: 92.w,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (_selectIndex.contains(index)) {
                _selectIndex.remove(index);
                _chooseModels.remove(model);
              } else {
                _selectIndex.clear();
                _selectIndex.add(index);
                _chooseModels.add(model);
              }
              setState(() {});
            }, //点击获取点击选项的下标
            child: SizedBox(
                child: BeeCheckRadio(
              value: index,
              groupValue: _selectIndex,
            )),
          ),
          24.wb,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 138.w,
                child: Text(
                  '性能体验',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.w),
                child: Text(
                  '白屏、卡顿、闪退、图片不显示',
                  style: TextStyle(
                      color: BaseStyle.color999999,
                      fontSize: BaseStyle.fontSize24),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
