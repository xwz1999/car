import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/ui/user/user_management/access_configuration_page.dart';
import 'package:cloud_car/ui/user/user_management/organizational_structure_page.dart';
import 'package:cloud_car/ui/user/user_management/text_editingcontroller_widget.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';
import '../interface/business_func.dart';

typedef TextCallback = Function(bool audit);

class EditorEmployeePage extends StatefulWidget {
  final String roleName;
  final String nameText;
  final Gender gender;
  final String phoneText;
  final String storeIdText;
  final String commissionText;
  final int storeId;
  final int staffId;
  final int roleId;

  @override
  State<EditorEmployeePage> createState() => _EditorEmployeePageState();

  const EditorEmployeePage({
    super.key,
    required this.roleName,
    required this.nameText,
    required this.gender,
    required this.phoneText,
    required this.storeIdText,
    required this.commissionText,
    required this.storeId,
    required this.staffId,
    required this.roleId,
  });
}

class _EditorEmployeePageState extends State<EditorEmployeePage> {
  ///权限描述
  late int roleId = widget.roleId;

  ///权限名称
  late String permissions1 = widget.roleName;

  ///
  late String nameText = widget.nameText;

  ///
  late Gender gender = widget.gender;

  ///
  late String phoneText = widget.phoneText;

  ///所属门店名称
  late String storeIdText = widget.storeIdText;

  ///销售提成
  late String commissionText = widget.commissionText;

  ///所属门店id
  late int storeId = widget.storeId;

  @override
  void initState() {
    super.initState();
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
        title: Text('编辑员工',
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
          getTitle('基本信息'),
          24.hb,
          _getInformation(),
          40.hb,
          getTitle('权限分配'),
          24.hb,
          _getPermissions(),
          88.hb,
          CloudBottomButton(
            onTap: () async {
              var res = await BusinessFunc.getStaffEdit(widget.staffId,
                  nameText, gender.typeNum, storeId, roleId, commissionText);
              if (res) {
                BotToast.showText(text: '提交成功');
                Get.back(result: true);
              }

              //print("输出返回值：$zhi");
            },
            text: '提交',
          ),
        ],
      ),
    );
  }

//文字样式
  getTitle(String title) {
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
            onTap: () {},
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
            tips: '请选择',
            editor: false,
            value: gender.typeStr,
            widget: Image(
              image: Assets.icons.icGoto,
              width: 32.w,
              height: 32.w,
            ),
            onTap: () {
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
                                235.wb,
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
                                        Navigator.pop(context);
                                        setState(() {});
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
                                    gender = Gender.male;
                                    dialogSetState(() {});
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 80.w,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Text('男',
                                        style: TextStyle(
                                            color: gender.typeNum == 1
                                                ? const Color(0xFF027AFF)
                                                : const Color(0xFF330000),
                                            fontSize: BaseStyle.fontSize28)),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    gender = Gender.female;
                                    dialogSetState(() {});
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 80.w,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Text('女',
                                        style: TextStyle(
                                            color: gender.typeNum == 2
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
            title: '手机号',
            editor: false,
            value: phoneText,
            onTap: () {},
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
            value: storeIdText,
            widget: Image(
              image: Assets.icons.icGoto,
              width: 32.w,
              height: 32.w,
            ),
            onTap: () async {
              await Get.to(() => StructurePage(
                    callback: (String city, int id) {
                      storeIdText = city;
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
          onTap: () async {
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
          value: roleId == 1 || roleId == 3 ? '' : commissionText,
          tips: roleId == 1 || roleId == 3 ? '' : '请输入',
          widget: Text(
            '%',
            style: TextStyle(
                color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
          ),
          onTap: () async {},
          callback: (String content) {
            commissionText = content;
          },
        ),
        16.hb,
      ]),
    );
  }
// _refresh() async {
//   res = await BusinessFunc.getStaffadd(nameText, genderText == '女' ? 1 : 2,
//       phoneText, storeid, roleId, commissionText);
// }
}
// class Editor {
//   int? staffId;
//   String? name;
//   int? gender;
//   int? storeId;
//   int? roleId;
//   String? commission;
// }
