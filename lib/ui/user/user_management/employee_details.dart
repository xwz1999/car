import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/ui/user/user_management/editor_employee.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

class EmployeeDetails extends StatefulWidget {
  final String name;
  final String sex;
  final String phone;
  final String permissions;
  final String stores;
  final String business;
  final String proportion;
  const EmployeeDetails({
    Key? key,
    required this.name,
    required this.sex,
    required this.phone,
    required this.permissions,
    required this.stores,
    required this.business,
    required this.proportion,
  }) : super(key: key);

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

bool _getSure = false;
bool audit = true;

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('员工详情',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: bodyColor,
      body: ListView(children: [_getUserinfo(), _getPermissions()]),
    );
  }

//权限描述

  _getPermissions() {
    return Container(
      color: Colors.white,
      height: 1045.w,
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: SizedBox(
                height: 36.w,
                child: Text(
                  '权限描述',
                  style: TextStyle(
                    fontSize: BaseStyle.fontSize28,
                    fontWeight: FontWeight.bold,
                    color: BaseStyle.color333333,
                  ),
                )),
          ),
          const Divider(),
          Container(
            margin: EdgeInsets.only(left: 16.w),
            decoration: BoxDecoration(
                color: const Color(0xFF027AFF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(4.w)),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
            child: Text(
              widget.permissions,
              style: TextStyle(
                  color: const Color(0xFF027AFF),
                  fontSize: BaseStyle.fontSize28),
            ),
          ),
          24.hb,
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: describe(),
          ),
          const Spacer(),
          const Divider(),
          Row(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 100.w)),
              _getBotton(Assets.icons.delete.path, '删除', () {
                setState(() {
                  Alert.show(
                      context,
                      NormalContentDialog(
                        type: NormalTextDialogType.delete,
                        title: '确认提示',
                        content: const Text('确认删除该员工吗？'),
                        items: const ['取消'],
                        deleteItem: '确定',
                        //监听器
                        listener: (index) {
                          Alert.dismiss(context);
                          _getSure = false;
                          setState(() {
                            _getSure;
                          });
                          //Value = false;
                          //(Value);
                        },
                        deleteListener: () {
                          Alert.dismiss(context);
                          _getSure = true;
                          Navigator.pop(context);
                          BotToast.showText(text: '删除成功');
                          setState(() {
                            _getSure;
                          });
                          //print(_getSure);
                          //Value = true;
                          //(Value);
                        },
                      ));
                });
              }),
              200.wb,
              _getBotton(Assets.icons.editor1.path, '编辑', () {
                Get.to(() => EditorEmployee(
                      nameText: widget.name,
                      genderText: widget.sex,
                      phoneText: widget.phone,
                      storeidText: widget.business,
                      permissions1: widget.permissions,
                      commissionText: widget.proportion,
                      callback: (bool audit) {
                        audit = audit;
                      },
                    ));
                //print(audit);
              })
            ],
          )
        ],
      ),
    );
  }

  getAudit() {
    return Offstage(
      offstage: audit,
      child: Image.asset(
        Assets.icons.inreview.path,
        width: 140.w,
        height: 140.w,
      ),
    );
  }

//按钮
  _getBotton(String url, String text, Function() ontap) {
    return Offstage(
      offstage: !audit,
      child: GestureDetector(
        onTap: () {
          ontap();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 56.w,
              height: 56.w,
              child: Image.asset(url),
            ),
            4.hb,
            Text(
              text,
              style: TextStyle(
                  color: BaseStyle.color333333, fontSize: BaseStyle.fontSize24),
            )
          ],
        ),
      ),
    );
  }

//
  describe() {
    switch (widget.permissions) {
      case '销售员':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '能够查看全店的车，并进行客户跟进、销售下单',
              style: TextStyle(
                  color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
            ),
            32.hb,
            Row(
              children: [
                SizedBox(
                    width: 170.w,
                    child: Text(
                      '销售提成比例',
                      style: TextStyle(
                          color: BaseStyle.color666666,
                          fontSize: BaseStyle.fontSize28),
                    )),
                Text(
                  widget.proportion,
                  style: TextStyle(
                      color: BaseStyle.color333333,
                      fontSize: BaseStyle.fontSize28),
                )
              ],
            ),
          ],
        );
      case '评估师/车务':
        return Text(
          '负责录入车辆信息、编辑店里的车辆',
          style: TextStyle(
              color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
        );

      case '销售/车务':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '可以录入车辆信息、编辑车辆，并进行客户跟踪、销售下单',
              style: TextStyle(
                  color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
            ),
            32.hb,
            Row(
              children: [
                SizedBox(
                    width: 170.w,
                    child: Text(
                      '销售提成比例',
                      style: TextStyle(
                          color: BaseStyle.color666666,
                          fontSize: BaseStyle.fontSize28),
                    )),
                Text(
                  widget.proportion,
                  style: TextStyle(
                      color: BaseStyle.color333333,
                      fontSize: BaseStyle.fontSize28),
                )
              ],
            ),
          ],
        );

      case '店长':
        return Text(
          '能够管理店内的客户、车辆、订单',
          style: TextStyle(
              color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
        );

    }
  }

//员工信息
  _getUserinfo() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Text(
                widget.name,
                style: TextStyle(
                    color: BaseStyle.color333333,
                    fontWeight: FontWeight.bold,
                    fontSize: BaseStyle.fontSize36),
              ),
            ),
            _getText('性别', widget.sex),
            _getText('手机号', widget.phone),
            _getText('权限配置', widget.permissions),
            _getText('所属门店', widget.stores),
            _getText('所属入驻商', widget.business),
          ]),
        ),
        Positioned(left: 534.w, top: 12.w, child: getAudit())
      ],
    );
  }

//文字样式
  _getText(String title, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      child: Row(
        children: [
          SizedBox(
              width: 170.w,
              child: Text(
                title,
                style: TextStyle(
                    color: BaseStyle.color666666,
                    fontSize: BaseStyle.fontSize28),
              )),
          Text(
            text,
            style: TextStyle(
                color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
          )
        ],
      ),
    );
  }
}
