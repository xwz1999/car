import 'package:cloud_car/ui/home/car_manager/publish_contract/contact_condition_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';
import '../../../../widget/picker/car_picker_box.dart';

class ContractLicencePage extends StatefulWidget {
  const ContractLicencePage({Key? key}) : super(key: key);

  @override
  State<ContractLicencePage> createState() => _ContractLicencePageState();
}

class _ContractLicencePageState extends State<ContractLicencePage> {
  final TextEditingController _transferController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _businessController = TextEditingController();
  final String? _compulsory = '';
  final String? _business = '';
  final bool _businessCheck = false;
  final bool _compulsoryCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('寄卖合同',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0x99eeeeee),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(30.w),
              child: '牌证信息'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.h, right: 30.w, left: 30.w),
              color: Colors.white,
              child: showLicense(),
            ),
            30.heightBox,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const ContactCondition());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: '下一步'.text.size(30.sp).color(Colors.white).make(),
              ),
            ).paddingOnly(left: 30.w, right: 30.w),
          ],
        ),
      ),
    );
  }

  _showArrow(
    String head,
    String title,
    VoidCallback onTap,
    String content,
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
              width: 170.w,
              child: title.text
                  .size(30.sp)
                  .color(Colors.black.withOpacity(0.45))
                  .make(),
            ),
            (content.isEmpty ? '请选择日期' : content)
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
      ).paddingOnly(top: 15.h, bottom: 15.h),
    );
  }

  _showSelect(
    bool select,
    String title,
  ) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      color: Colors.transparent,
      child: Row(
        children: [
          25.wb,
          SizedBox(
            width: 170.w,
            child: title.text
                .size(30.sp)
                .color(Colors.black.withOpacity(0.45))
                .make(),
          ),
          Expanded(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    select = !select;
                    setState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 50.w,
                          height: 50.w,
                          padding: EdgeInsets.only(top: 6.w, right: 5.w),
                          child: !select
                              ? const Icon(CupertinoIcons.circle,
                                  size: 18, color: Color(0xFFdddddd))
                              : const Icon(
                                  CupertinoIcons.checkmark_alt_circle_fill,
                                  size: 18,
                                  color: Colors.blue)),
                      RichText(
                        text: TextSpan(
                          text: "有",
                          style:
                              TextStyle(color: Colors.black, fontSize: 30.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                30.widthBox,
                GestureDetector(
                  onTap: () {
                    select = !select;
                    setState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 50.w,
                          height: 50.w,
                          padding: EdgeInsets.only(top: 6.w, right: 5.w),
                          child: select
                              ? const Icon(CupertinoIcons.circle,
                                  size: 18, color: Color(0xFFdddddd))
                              : const Icon(
                                  CupertinoIcons.checkmark_alt_circle_fill,
                                  size: 18,
                                  color: Colors.blue)),
                      RichText(
                        text: TextSpan(
                          text: "无",
                          style:
                              TextStyle(color: Colors.black, fontSize: 30.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showUnit(
    String title,
    TextEditingController _contentController,
    String unit,
  ) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      color: Colors.transparent,
      child: Row(
        children: [
          25.wb,
          SizedBox(
            width: 170.w,
            child: title.text
                .size(28.sp)
                .normal
                .textStyle(const TextStyle(decoration: TextDecoration.none))
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
                  hintText: '请输入',
                  hintStyle: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.black.withOpacity(0.25),
                  )),
            ),
          ),
          24.wb,
          unit.text.size(30.sp).color(Colors.black.withOpacity(0.8)).make(),
        ],
      ),
    );
  }

  Column showLicense() {
    return Column(
      children: [
        _showUnit('过户次数', _transferController, '次'),
        _showUnit('钥匙数量', _keyController, '把'),
        _showSelect(_compulsoryCheck, '交强险'),
        _showArrow('交强险到期时间', '交强险到期', () {}, _compulsory!, Container()),
        _showSelect(_businessCheck, '商业险'),
        _showArrow('商业险到期时间', '商业险到期', () {}, _business!, Container()),
        _showUnit('商业险金额', _businessController, '元'),
      ],
    );
  }
}
