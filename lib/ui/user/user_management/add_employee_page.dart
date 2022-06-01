// ignore_for_file: unused_local_variable

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/ui/user/user_management/access_configuration_page.dart';
import 'package:cloud_car/ui/user/user_management/organizational_structure_page.dart';
import 'package:cloud_car/ui/user/user_management/text_editingcontroller_widget.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';
import '../interface/business_func.dart';

class AddEmployeePage extends StatefulWidget {
  final String permissions1;
  final String nameText;
  final String genderText;
  final String phoneText;
  final String storeidText;
  final String commissionText;

  const AddEmployeePage(
      {super.key,
      this.permissions1 = '',
      this.nameText = '',
      this.genderText = '',
      this.phoneText = '',
      this.storeidText = '',
      this.commissionText = ''});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  late int storeId = 0;
  late int roleId = 0;
  late String permissions1 = widget.permissions1;
  late String nameText = widget.permissions1;
  late String genderText = widget.permissions1;
  late String phoneText = widget.permissions1;
  late String storeidText = widget.permissions1;
  late String commissionText = widget.permissions1;

  int sexId = 1;
  List blText = [];

  late bool res = false;

  @override
  void initState() {
    super.initState();
    //添加listener监听
    // 获取textfie
  }

  @override
  void dispose() {
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
        title: Text('新增员工',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),

        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: bodyColor,
      body: Column(
        children: [
          40.hb,
          _getTitle('基本信息'),
          24.hb,
          _getInformation(),
          40.hb,
          _getTitle('权限分配'),
          24.hb,
          _getPermissions(),
          88.hb,
          CloudBottomButton(
            onTap: () async {
              // if (zhi) {
              //   BotToast.showText(text: '提交成功');
              //   Get.back();
              //   Future.delayed(const Duration(milliseconds: 0), () async {
              //     await _refresh();
              //     setState(() {});
              //   });
              //   //print("输出返回值：$zhi");
              // } else {
              //   BotToast.showText(text: '请输入内容');
              // }
              var res = await BusinessFunc.getStaffadd(
                  nameText,
                  genderText == '女' ? 2 : 1,
                  phoneText,
                  storeId,
                  roleId,
                  commissionText);
              if (res) {
                BotToast.showText(text: '提交成功');
                Get.back();
              }

              // Future.delayed(const Duration(milliseconds: 0),
              //     () async {
              //   await _refresh();
              //   setState(() {});
              // });
              //print("输出返回值：$zhi");
            },
            text: '提交',
          ),
        ],
      ),
    );
  }

//文字样式
  _getTitle(String title) {
    return Container(
      padding: EdgeInsets.only(right: 590.w),
      child: Text(
        title,
        style: TextStyle(
            fontSize: BaseStyle.fontSize32,
            color: const Color(0xFF110000),
            fontWeight: FontWeight.bold),
      ),
    );
  }

//基本信息  ///姓名性别手机号组织架构
  _getInformation() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      color: kForeGroundColor,
      child: Column(
        children: [
          TextEditItemWidget(
            title: '姓名',
            ontap: () {},
            value: nameText,
            callback: (String content) {
              nameText = content;
            },
          ),
          // Row(
          //   children: [
          //     SizedBox(
          //       width: 150.w,
          //       child: Text(
          //         '姓名',
          //         style: TextStyle(
          //             fontSize: BaseStyle.fontSize28,
          //             color: const Color(0xFF999999)),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 300.w,
          //       height: 35.w,
          //       child: TextField(
          //         //controller: nameText,
          //         decoration: InputDecoration(
          //           contentPadding: EdgeInsets.only(bottom: 23.w), //文字与边框的距离
          //           border: InputBorder.none, //去掉下划线
          //           hintText: '请输入',
          //           hintStyle: TextStyle(
          //             fontSize: BaseStyle.fontSize28,
          //             color: BaseStyle.colorcccccc,
          //           ),
          //         ),
          //         onChanged: (value) {
          //           nameText = value as TextEditingController;
          //           blText.add(value);
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          32.hb,

          TextEditItemWidget(
            title: '性别 ',
            endIcon: true,
            editor: false,
            tips: '请选择',
            value: genderText,
            widget: Image(
              image: Assets.icons.icGoto,
              width: 32.w,
              height: 32.w,
            ),
            ontap: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
                  builder: (BuildContext context) {
                    return StatefulBuilder(builder: (context, dialogSetState) {
                      return Container(
                        width: double.infinity,
                        height: 600.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.w))),
                        child: Column(
                          children: [
                            32.hb,
                            Row(
                              children: [
                                30.wb,
                                SizedBox(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      '取消',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          ?.copyWith(
                                              color: BaseStyle.color999999),
                                    ),
                                  ),
                                ),
                                200.wb,
                                Text(
                                  '选择性别',
                                  style: TextStyle(
                                      color: const Color(0xFF111111),
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  child: SizedBox(
                                    child: GestureDetector(
                                      onTap: () async {
                                        genderText = sexId == 1 ? '男' : "女";
                                        Navigator.pop(context);
                                        setState(() {});
                                        //dialogSetState(() {});
                                      },
                                      child: Text(
                                        '确认',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            ?.copyWith(
                                                color: const Color(0xFF027AFF)),
                                      ),
                                    ),
                                  ),
                                ),
                                30.wb,
                              ],
                            ),
                            40.hb,
                            Column(
                              children: [
                                50.hb,
                                GestureDetector(
                                  onTap: () {
                                    sexId = 1;
                                    dialogSetState(() {});
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 80.w,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Text('男',
                                        style: TextStyle(
                                            color: sexId == 1
                                                ? const Color(0xFF027AFF)
                                                : const Color(0xFF330000),
                                            fontSize: BaseStyle.fontSize28)),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    sexId = 2;
                                    dialogSetState(() {});
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 80.w,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Text('女',
                                        style: TextStyle(
                                            color: sexId == 2
                                                ? const Color(0xFF027AFF)
                                                : const Color(0xFF330000),
                                            fontSize: BaseStyle.fontSize28)),
                                  ),
                                )
                              ],
                            ),
                            40.hb,
                          ],
                        ),
                      );
                    });
                  });
            },
            callback: (String content) {},
          ),
          32.hb,
          TextEditItemWidget(
            //editor: false,
            title: '手机号',
            value: phoneText,
            ontap: () {},
            callback: (String content) {
              phoneText = content;
            },
          ),
          32.hb,

          TextEditItemWidget(
            title: '组织架构',
            endIcon: true,
            editor: false,
            tips: '请选择',
            value: storeidText,
            widget: Image(
              image: Assets.icons.icGoto,
              width: 32.w,
              height: 32.w,
            ),
            ontap: () async {
              await Get.to(() => StructurePage(
                    callback: (String city, int id) {
                      storeidText = city;
                      storeId = id;
                    },
                  ));
              setState(() {});
            },
            callback: (String content) {},
          ),
          16.hb,
        ],
      ),
    );
  }

//权限分配   ///权限配置 销售提成
  _getPermissions() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      color: kForeGroundColor,
      child: Column(children: [
        TextEditItemWidget(
          title: '权限配置',
          endIcon: true,
          editor: false,
          tips: '请选择',
          value: permissions1,
          widget: Image(
            image: Assets.icons.icGoto,
            width: 32.w,
            height: 32.w,
          ),
          ontap: () async {
            await Get.to(() => AccessConfigurationPage(
                  callback: (String city, int id) {
                    permissions1 = city;
                    roleId = id;
                  },
                ));
            setState(() {});
          },
          callback: (String content) {},
        ),
        32.hb,
        TextEditItemWidget(
          title: '销售提成',
          endIcon: false,
          editor: !(roleId == 1 || roleId == 3),
          value: commissionText,
          widget: Text(
            '%',
            style: TextStyle(
                color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
          ),
          ontap: () async {},
          callback: (String content) {
            commissionText = roleId == 1 || roleId == 3 ? '0' : content;
          },
        ),
        16.hb,
      ]),
    );
  }

// _refresh() async {
//   res = await BusinessFunc.getStaffadd(nameText, genderText == '女' ? 1 : 2,
//       phoneText, storeId, roleId, commissionText);
// }
}
