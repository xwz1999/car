import 'package:cloud_car/ui/user/interface/user_interface.dart';
import 'package:cloud_car/ui/user/user_management/access_configuration.dart';
import 'package:cloud_car/ui/user/user_management/organizational_structure.dart';
import 'package:cloud_car/ui/user/user_management/text_editingcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/headers.dart';
import '../../../widget/cloud_back_button.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final _permissions1 = TextEditingController();
  late String nameText = '';
  String sex = '';
  late String genderText = '';
  late String phoneText = '';
  late String storeidText = '';
  late String commissionText = '';

  int sexId = 1;
  List blText = [];

  late String zhi = '';
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
    late bool bl;
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
          getTitle('基本信息'),
          24.hb,
          getInformation(),
          40.hb,
          getTitle('权限分配'),
          24.hb,
          getpermissions(),
          88.hb,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32.w),
            height: 72.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(8.w)),
            child: SizedBox(
                child: GestureDetector(
              onTap: () {
                print("asdad$storeidText");
                Future.delayed(const Duration(milliseconds: 0), () async {
                  await _refresh();
                  setState(() {});
                });
              },
              child: Text(
                '新增',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: kForeGroundColor),
              ),
            )),
          )
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
  getInformation() {
    return StatefulBuilder(builder: (context, dialogSetState) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
        color: kForeGroundColor,
        child: Column(
          children: [
            TextEditItemWidget(
              title: '姓名',
              ontap: () {},
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
              title: '性别',
              endIcon: true,
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
                      return StatefulBuilder(
                          builder: (context, dialogSetState) {
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
                                        onTap: () {
                                          genderText = sexId == 1 ? '男' : "女";
                                          Navigator.pop(context);
                                          dialogSetState(() {});
                                        },
                                        child: Text(
                                          '确认',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.copyWith(
                                                  color:
                                                      const Color(0xFF027AFF)),
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
              title: '手机号',
              ontap: () {},
              callback: (String content) {
                phoneText = content;
              },
            ),
            32.hb,

            TextEditItemWidget(
              title: '组织架构',
              endIcon: true,
              tips: '请选择',
              value: storeidText,
              widget: Image(
                image: Assets.icons.icGoto,
                width: 32.w,
                height: 32.w,
              ),
              ontap: () {
                Get.to(() => StructurePage(
                      callback: (String city) {
                        storeidText = city;
                      },
                    ));
              },
              callback: (String content) {},
            ),
            16.hb,
          ],
        ),
      );
    });
  }

//权限分配   ///权限配置 销售提成
  getpermissions() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      color: kForeGroundColor,
      child: Column(children: [
        GestureDetector(
          onTap: () {
            Get.to(() => AccessConfiguration(callback: (String city) {
                  _permissions1.text = city;
                }));
          },
          child: Row(children: [
            SizedBox(
              width: 150.w,
              child: Text(
                '权限配置',
                style: TextStyle(
                    fontSize: BaseStyle.fontSize28,
                    color: const Color(0xFF999999)),
              ),
            ),
            SizedBox(
                width: 300.w,
                height: 35.w,
                child: TextField(
                  controller: _permissions1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 23.w), //文字与边框的距离
                    border: InputBorder.none, //去掉下划线
                    hintText: '请选择',
                    hintStyle: TextStyle(
                      fontSize: BaseStyle.fontSize28,
                      color: BaseStyle.colorcccccc,
                      // onChanged: ,
                    ),
                  ),
                  onChanged: (value) {
                    blText.add(value);
                  },
                )),
            Padding(
              padding: EdgeInsets.only(top: 5.w, left: 191.w),
              child: Icon(
                CupertinoIcons.chevron_forward,
                size: 40.w,
                color: BaseStyle.color666666,
              ),
            )
          ]),
        ),
        32.hb,
        Row(
          children: [
            SizedBox(
              width: 150.w,
              child: Text(
                '销售提成',
                style: TextStyle(
                    fontSize: BaseStyle.fontSize28,
                    color: const Color(0xFF999999)),
              ),
            ),
            SizedBox(
                width: 300.w,
                height: 35.w,
                child: TextField(
                    //controller: commissionText,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 23.w), //文字与边框的距离
                      border: InputBorder.none, //去掉下划线
                      hintText: '请输入',
                      hintStyle: TextStyle(
                        fontSize: BaseStyle.fontSize28,
                        color: BaseStyle.colorcccccc,
                        // onChanged: ,
                      ),
                    ),
                    onChanged: (value) {
                      commissionText = value;
                      blText.add(value);
                    })),
            Padding(
              padding: EdgeInsets.only(top: 5.w, left: 191.w),
              child: Text(
                '%',
                style: TextStyle(
                    color: BaseStyle.color333333,
                    fontSize: BaseStyle.fontSize28),
              ),
            )
          ],
        ),
        16.hb,
      ]),
    );
  }

  _refresh() async {
    zhi = await User.getStaffadd(nameText, int.parse(genderText), phoneText,
        int.parse(storeidText), int.parse(_permissions1.text), commissionText);
  }

  getEmpty() {
    for (var i = 0; i < blText.length; i++) {
      if (blText[i]) {}
    }
  }
}
