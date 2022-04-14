// ignore_for_file: avoid_print, deprecated_member_use, duplicate_ignore

import 'dart:io';

import 'package:cloud_car/ui/user/user_basic_information/enterprise.dart';
import 'package:cloud_car/utils/headers.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widget/button/cloud_back_button.dart';

class BasicInformationPage extends StatefulWidget {
  const BasicInformationPage({Key? key}) : super(key: key);

  @override
  State<BasicInformationPage> createState() => _BasicInformationPageState();
}

class _BasicInformationPageState extends State<BasicInformationPage> {
  int sexId = 1;
  final picker = ImagePicker();
  late File imagePath = File('path');
  Future getImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    final File file = File(pickedFile!.path);
    setState(() {
      if (pickedFile != null) {
        imagePath = file;
      } else {
        print('no image selected');
      }
    });
  }

  void openGallery() async {
    // ignore: deprecated_member_use
    PickedFile? pickedFile = await picker.getImage(source: ImageSource.gallery);
    final File file = File(pickedFile!.path);
    setState(() {
      imagePath = file;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: const Color(0xFFF6F6F6),
      extendBody: true,
      body: Container(
        color: bodyColor,
        margin: EdgeInsets.only(top: 16.w),
        child: Container(
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            children: ListTile.divideTiles(context: context, tiles: [
              ListTile(
                title: SizedBox(
                  child: Row(
                    children: [
                      Text(
                        '头像',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const Spacer(),
                      ClipOval(
                        child: Image.file(
                          imagePath,
                          width: 70.w,
                          height: 70.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                    width: 40.w,
                    height: 40.w,
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
                          height: 468.w,
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
                                  const Spacer(),
                                  Text(
                                    '更换头像',
                                    style: TextStyle(
                                        color: const Color(0xFF111111),
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        //Get.to(() => getImage());
                                      },
                                      icon: Icon(
                                        CupertinoIcons.clear,
                                        color: BaseStyle.colorcccccc,
                                        size: 30.w,
                                      )),
                                  30.wb,
                                ],
                              ),
                              40.hb,
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      getImage();
                                    },
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            Assets.images.shooting.path,
                                            width: 96.w,
                                            height: 96.w,
                                          ),
                                          5.hb,
                                          Text(
                                            '拍摄',
                                            style: TextStyle(
                                                color: const Color(0xFF666666),
                                                fontSize: BaseStyle.fontSize24),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  74.wb,
                                  GestureDetector(
                                    onTap: openGallery,
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            Assets.images.photo.path,
                                            width: 96.w,
                                            height: 96.w,
                                          ),
                                          5.hb,
                                          Text(
                                            '照片',
                                            style: TextStyle(
                                                color: const Color(0xFF666666),
                                                fontSize: BaseStyle.fontSize24),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 50.w,
                                  // )
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
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
                          '张三',
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
                    height: 40.w,
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
                          height: 1000.w,
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
                                  GestureDetector(
                                    child: SizedBox(
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
                                  224.wb,
                                  Text(
                                    '修改名字',
                                    style: TextStyle(
                                        color: const Color(0xFF111111),
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  210.wb,
                                  GestureDetector(
                                    child: SizedBox(
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
                                  30.wb,
                                ],
                              ),
                              40.hb,
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    88.wb,
                                    Text(
                                      '姓名',
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
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
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(left: 16.w),
                                          filled: true,
                                          isDense: true,
                                          fillColor: Colors.white,
                                          hintText: "张三",
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
              ListTile(
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
                                    30.wb,
                                    SizedBox(
                                      child: GestureDetector(
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
                                    224.wb,
                                    Text(
                                      '选择性别',
                                      style: TextStyle(
                                          color: const Color(0xFF111111),
                                          fontSize: 32.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    210.wb,
                                    GestureDetector(
                                      child: SizedBox(
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
                                        child: Text(sexId == 1 ? '√ 男' : '男',
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
                                        dialogSetState(() {});
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 80..w,
                                        width: double.infinity,
                                        color: Colors.white,
                                        child: Text(sexId == 2 ? '√ 女' : '女',
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
                title: SizedBox(
                  child: Row(
                    children: [
                      Text(
                        '性别',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const Spacer(),
                      SizedBox(
                        child: Text(
                          '男',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: const Color(0xFF999999)),
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                    width: 40.w,
                    height: 40.w,
                    child: const Icon(
                      Icons.keyboard_arrow_right,
                    )),
              ),
              ListTile(
                title:
                    Text('手机号', style: Theme.of(context).textTheme.bodyText1),
                trailing: SizedBox(
                  child: Text(
                    '18912345432',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: const Color(0xFF999999)),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => const EnterprisePage());
                },
                title:
                    Text('企业信息', style: Theme.of(context).textTheme.bodyText1),
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
      ),
    );
  }
}
