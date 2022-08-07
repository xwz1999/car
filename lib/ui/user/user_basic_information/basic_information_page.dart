import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/providers/user_provider.dart';
import 'package:cloud_car/ui/user/interface/user_func.dart';
import 'package:cloud_car/ui/user/user_basic_information/enterprise_page.dart';
import 'package:cloud_car/ui/user/user_management/text_editingcontroller_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/widget/cloud_avatar_widget.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../utils/user_tool.dart';
import '../../../widget/button/cloud_back_button.dart';

class BasicInformationPage extends StatefulWidget {
  const BasicInformationPage({super.key});

  @override
  State<BasicInformationPage> createState() => _BasicInformationPageState();
}

class _BasicInformationPageState extends State<BasicInformationPage> {
  int sexId = 1;

  // late String genderText =
  //     UserTool.userProvider.userInfo.gender == 0 ? '女' : '男';
  String name = '';
  late int gender;
  final picker = ImagePicker();
  late File imagePath = File(UserTool.userProvider.userInfo.headImg);

  @override
  Widget build(BuildContext context) {
    var infoProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text('基本信息',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: const Color(0xFFF6F6F6),
        extendBody: true,
        body: Container(
          color: bodyColor,
          margin: EdgeInsets.only(top: 16.w),
          child: ColoredBox(
            color: Colors.white,
            child: ListView(
              shrinkWrap: true,
              children: ListTile.divideTiles(context: context, tiles: [
                //头像
                ListTile(
                  title: SizedBox(
                    child: Row(
                      children: [
                        Text(
                          '头像',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 72.w,
                          height: 72.w,
                          child: CloudAvatarWidget(
                            urls: [UserTool.userProvider.userInfo.headImg],
                          ),
                        )
                      ],
                    ),
                  ),
                  trailing: SizedBox(
                      width: 40.w,
                      height: 40.h,
                      child: const Icon(
                        Icons.keyboard_arrow_right,
                      )),
                  onTap: () async {
                    var value =
                        await CloudImagePicker.pickSingleImage(title: '选择图片');
                    if (value != null) {
                      String urls = await apiClient.uploadImage(value);
                      var res = await User.getUserUpdateImg(
                        urls,
                      );
                      if (res) {
                        BotToast.showText(text: '修改头像成功');
                      }
                    }
                    await UserTool.userProvider.updateUserInfo();
                    setState(() {});
                  },
                ),
                //姓名
                ListTile(
                  title: SizedBox(
                    child: Row(
                      children: [
                        Text(
                          '姓名',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const Spacer(),
                        SizedBox(
                          child: Text(
                            infoProvider.userInfo.nickname,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: const Color(0xFF999999)),
                          ),
                        )
                      ],
                    ),
                  ),
                  trailing: SizedBox(
                      width: 40.w,
                      height: 40.h,
                      child: const Icon(
                        Icons.keyboard_arrow_right,
                      )),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
                        builder: (BuildContext context) {
                          return Container(
                            width: double.infinity,
                            height: 1000.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.w))),
                            child: Column(
                              children: [
                                32.hb,
                                Row(
                                  children: [
                                    32.wb,
                                    _buildButton(
                                      title: '取消',
                                      onPressed: () => Navigator.pop(context),
                                      color: Colors.black26,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '修改姓名',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: const Color(0xFF111111),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 32.sp,
                                        ),
                                      ),
                                    ),
                                    _buildButton(
                                      title: '确定',
                                      onPressed: () async {
                                        //print(gender);
                                        var res = await User.getUserUpdateName(
                                          name,
                                        );
                                        var info = infoProvider.userInfo;
                                        UserTool.userProvider.setUserInfo(
                                            info.copyWith(nickname: name));
                                        if (res) {
                                          BotToast.showText(text: '修改名字成功');
                                          Get.back();
                                        }
                                        await UserTool.userProvider
                                            .updateUserInfo();
                                        setState(() {});
                                      },
                                      color: Colors.blue,
                                    ),
                                    32.wb,
                                  ],
                                ),
                                40.hb,
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      88.wb,
                                      Text(
                                        '姓名',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                      16.wb,
                                      Container(
                                        width: 502.w,
                                        height: 56.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.w,
                                                color: const Color(0xFFE7E7E7)),
                                            borderRadius:
                                                BorderRadius.circular(2.w)),
                                        child: TextField(
                                          onChanged: (text) {
                                            name = text;
                                            //print(name);
                                          },
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(left: 16.w),
                                            filled: true,
                                            isDense: true,
                                            fillColor: Colors.white,
                                            hintText: UserTool
                                                .userProvider.userInfo.nickname,
                                            hintStyle: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            ),
                          );
                        });
                  },
                ),
                //性别
                TextEditItemWidget(
                  isBold: true,
                  title: '性别 ',
                  editor: false,
                  endIcon: true,
                  tips: '请选择',
                  value: UserTool.userProvider.userInfo.genderEM.typeStr,
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
                                      32.wb,
                                      _buildButton(
                                        title: '取消',
                                        onPressed: () => Navigator.pop(context),
                                        color: Colors.black26,
                                      ),
                                      Expanded(
                                        child: Text(
                                          '选择性别',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(0xFF111111),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 32.sp,
                                          ),
                                        ),
                                      ),
                                      _buildButton(
                                        title: '确定',
                                        onPressed: () async {
                                          //print(gender);
                                          var res =
                                              await User.getUserUpdateGender(
                                                  gender);
                                          if (res) {
                                            BotToast.showText(text: '修改性别成功');
                                            Get.back();
                                            // Navigator.pop(context);
                                          }
                                          await UserTool.userProvider
                                              .updateUserInfo();
                                          setState(() {});
                                        },
                                        color: Colors.blue,
                                      ),
                                      32.wb,
                                    ],
                                  ),
                                  40.hb,
                                  Column(
                                    children: [
                                      50.hb,
                                      GestureDetector(
                                        onTap: () {
                                          sexId = 1;
                                          gender = sexId;
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
                                                  fontSize:
                                                      BaseStyle.fontSize28)),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          sexId = 2;
                                          gender = sexId;
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
                                                  fontSize:
                                                      BaseStyle.fontSize28)),
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
                //手机号
                ListTile(
                  title:
                      Text('手机号', style: Theme.of(context).textTheme.bodyText1),
                  trailing: SizedBox(
                    child: Text(
                      UserTool.userProvider.userInfo.phone,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: const Color(0xFF999999)),
                    ),
                  ),
                ),
                //企业信息
                ListTile(
                  onTap: () {
                    Get.to(() => const EnterprisePage());
                  },
                  title: Text('企业信息',
                      style: Theme.of(context).textTheme.bodyText1),
                  trailing: SizedBox(
                      width: 40.w,
                      height: 40.w,
                      child: const Icon(
                        Icons.keyboard_arrow_right,
                      )),
                ),
              ]).toList(),
            ),
          ),
        ));
  }

  //
  // getGender(int gender) {
  //   switch (gender) {
  //     case 2:
  //       return '女';
  //     case 1:
  //       return '男';
  //   }
  // }

  _buildButton({
    required String title,
    required VoidCallback? onPressed,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onPressed,
      // height: 48.w,
      child: Text(title,
          style: TextStyle(
            color: color,
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
