// ignore_for_file: unnecessary_null_comparison, duplicate_ignore

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/model/user/roleall_model.dart';
import 'package:cloud_car/ui/user/interface/business_func.dart';
import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';
import '../../../widget/button/colud_check_radio.dart';

typedef CarCallback = Function(String city, int id); //

class AccessConfigurationPage extends StatefulWidget {
  final CarCallback callback; //
  const AccessConfigurationPage({
    super.key,
    required this.callback, //
  });

  @override
  State<AccessConfigurationPage> createState() =>
      _AccessConfigurationPageState();
}

class _AccessConfigurationPageState extends State<AccessConfigurationPage> {
  //选中的item
  final List<int> _selectIndex = [];
  final List<RoleallModel> _chooseModels = []; //
  List<RoleallModel> permissions = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () {
      _refresh();
    });
  }

  _refresh() async {
    permissions = await BusinessFunc.getRoleall();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text('权限配置',
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
                      return _getItem(index, permissions[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                          //   color: const Color(0xFFF6F6F6),
                          //   height: 16.w,
                          ); //背景色高度
                    },
                    itemCount: permissions.length)),
            GestureDetector(
              onTap: () {
                // print(permissions);
                if (_selectIndex.isEmpty) {
                  BotToast.showText(text: '请先选择车辆');
                } else {
                  widget.callback(permissions[_selectIndex.first].name,
                      permissions[_selectIndex.first].id);
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

  _getItem(int index, RoleallModel model) {
    // ignore: unnecessary_null_comparison
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
                  model.name,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                subtitle: Text(
                  model.describe,
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
