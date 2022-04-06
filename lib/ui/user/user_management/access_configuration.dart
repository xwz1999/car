import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../../../model/ConfigurationModel.dart';
import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';
import '../../../widget/button/colud_check_radio.dart';

typedef CarCallback = Function(String city); //

class AccessConfiguration extends StatefulWidget {
  final CarCallback callback; //
  const AccessConfiguration({
    Key? key,
    required this.callback, //
  }) : super(key: key);

  @override
  State<AccessConfiguration> createState() => _AccessConfigurationState();
}

class _AccessConfigurationState extends State<AccessConfiguration> {
  //选中的item
  final List<int> _selectIndex = [];
  final List<ConfigurationModel> _chooseModels = []; //
  List<ConfigurationModel> moddels = [
    ConfigurationModel(title: '销售员', subtitle: '能够查看全店的车，并进行客户跟进、销售下单'),
    ConfigurationModel(title: '评估师/车务', subtitle: '负责录入车辆信息、编辑店里的车辆'),
    ConfigurationModel(title: '销售/车务', subtitle: '可以录入车辆信息、编辑车辆，并进行客户跟进、销售下单'),
    ConfigurationModel(title: '店长', subtitle: '能够管理店内的客户、车辆、订单'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text('新增门店',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),

          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        backgroundColor: kForeGroundColor,
        body: Column(
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
            GestureDetector(
              onTap: () {
                if (_selectIndex.isEmpty) {
                  BotToast.showText(text: '请先选择车辆');
                } else {
                  widget.callback(moddels[_selectIndex.first].title ?? '');
                  //widget.callback(moddels[_selectIndex.first].subtitle ?? '');
                  Get.back();
                }
              }, //是否选中选项否弹出提示框是返回数值
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 32.w),
                padding: EdgeInsets.symmetric(vertical: 16.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: <Color>[
                      Color(0xFF0593FF),
                      Color(0xFF027AFF),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.w)),
                ),
                child: Text(
                  '确定',
                  style: TextStyle(
                      color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
                ),
              ),
            ),
            32.hb
          ],
        ));
  }

  _getItem(int index, ConfigurationModel model) {
    return Container(
      padding: EdgeInsets.only(left: 32.w),
      color: Colors.white,
      height: 150.w,
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
          Expanded(
              child: Column(
            children: [
              ListTile(
                title: Text(
                  '销售员',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                subtitle: Text(
                  '负责录入车辆信息、编辑店里的车辆',
                  style: TextStyle(
                      fontSize: BaseStyle.fontSize24,
                      color: const Color(0xFF999999)),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
