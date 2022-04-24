import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';

import 'contract_license_page.dart';

class ContractOwnerPage extends StatefulWidget {
  const ContractOwnerPage({Key? key}) : super(key: key);

  @override
  State<ContractOwnerPage> createState() => _ContractOwnerPageState();
}

class _ContractOwnerPageState extends State<ContractOwnerPage> {
  bool _chooseOwner = false;
  final TextEditingController _carOwnerNameController = TextEditingController();
  final TextEditingController _idCardController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _bankNumController = TextEditingController();
  final TextEditingController _depositBankController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _creditCodeController = TextEditingController();

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
              child: '车主信息'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 20.h, bottom: 20.h, left: 30.w, right: 30.w),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        '*'
                            .text
                            .size(30.sp)
                            .color(Colors.red)
                            .normal
                            .textStyle(
                                const TextStyle(decoration: TextDecoration.none))
                            .make()
                            .paddingOnly(top: 5),
                        10.wb,
                        SizedBox(
                          width: 160.w,
                          child: '车主类别'
                              .text
                              .size(30.sp)
                              .normal
                              .textStyle(
                                  const TextStyle(decoration: TextDecoration.none))
                              .color(Colors.black.withOpacity(0.45))
                              .make(),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _chooseOwner = !_chooseOwner;
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 50.w,
                                        height: 50.w,
                                        padding: EdgeInsets.only(
                                            top: 6.w, right: 5.w),
                                        child: !_chooseOwner
                                            ? const Icon(CupertinoIcons.circle,
                                                size: 18,
                                                color: Color(0xFFdddddd))
                                            : const Icon(
                                                CupertinoIcons
                                                    .checkmark_alt_circle_fill,
                                                size: 18,
                                                color: Colors.blue)),
                                    RichText(
                                      text: TextSpan(
                                        text: "个人寄卖",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12 * 2.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _chooseOwner = !_chooseOwner;
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 50.w,
                                        height: 50.w,
                                        padding: EdgeInsets.only(
                                            top: 6.w, right: 5.w),
                                        child: _chooseOwner
                                            ? const Icon(CupertinoIcons.circle,
                                                size: 18,
                                                color: Color(0xFFdddddd))
                                            : const Icon(
                                                CupertinoIcons
                                                    .checkmark_alt_circle_fill,
                                                size: 18,
                                                color: Colors.blue)),
                                    RichText(
                                      text: TextSpan(
                                        text: "公司车辆",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12 * 2.sp),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const ContractLicencePage());
          },
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(Colors.blue),
          ),
          child: '下一步'
              .text
              .size(30.sp)
              .color(Colors.white)
              .make(),
        ),
      ),
    );
  }

  Widget personInfo() {
    return Column(
      children: [
        _noIcon('车主姓名', _carOwnerNameController),
        _haveIcon('身份证号', _idCardController, () {}),
        _noIcon('手机号码', _phoneController),
        _haveIcon('银行卡号', _bankNumController, () {}),
        _noIcon('开户行', _depositBankController),
        _takePhoto(
          '身份证照',
          Row(
            children: [
              GestureDetector(
                child: Stack(
                  children: [
                    Image.asset('assets/images/car_person_head.png'),
                  ],
                ),
              ),
              GestureDetector(
                child: Stack(
                  children: [
                    Image.asset('assets/images/car_person_back.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
        _takePhoto(
          '半身照',
          GestureDetector(
            child: Stack(
              children: [
                Image.asset('assets/images/car_person_photo.png'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget companyInfo() {
    return Column(
      children: [
        _noIcon('公司名称', _companyController),
        _noIcon('信用代码', _creditCodeController),
        _noIcon('联系方式', _phoneController),
        _noIcon('开户行', _depositBankController),
        _haveIcon('银行卡号', _bankNumController, () {}),
        _takePhoto(
          '营业执照',
          GestureDetector(
            child: Stack(
              children: [
                Image.asset('assets/images/car_company.png'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _haveIcon(
    String title,
    TextEditingController _contentController,
    VoidCallback _onTap,
  ) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
          10.wb,
          SizedBox(
            width: 160.w,
            child: title.text
                .size(30.sp)
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
          IconButton(
            onPressed: _onTap,
            icon: const ImageIcon(
              AssetImage('assets/icon/scan.png'),
            ),
          ),
        ],
      ),
    );
  }

  _noIcon(
    String title,
    TextEditingController _contentController,
  ) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
          10.wb,
          SizedBox(
            width: 160.w,
            child: title.text
                .size(30.sp)
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
        ],
      ),
    );
  }

  _takePhoto(
    String title,
    Widget content,
  ) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            children: [
              '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
              10.wb,
              SizedBox(
                width: 160.w,
                child: title.text
                    .size(30.sp)
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
            ],
          ),
          content,
        ],
      ),
    );
  }
}
