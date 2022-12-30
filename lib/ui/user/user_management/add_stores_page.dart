import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/user/interface/business_func.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/picker/cloud_list_picker_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';

class AddStoresPage extends StatefulWidget {
  const AddStoresPage({super.key});

  @override
  State<AddStoresPage> createState() => _AddStoresPageState();
}

class _AddStoresPageState extends State<AddStoresPage> {
  // String storesName = '';
  // String storesAddress = '';
  bool res = false;

  final TextEditingController storesNameController = TextEditingController();
  final TextEditingController storesAddressController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController commissionController = TextEditingController();
  final TextEditingController codeCreditController = TextEditingController();
  final TextEditingController storesPhotoController = TextEditingController();
  final TextEditingController idCardController = TextEditingController();
  final TextEditingController bankCardController = TextEditingController();
  final TextEditingController bankController = TextEditingController();
  final TextEditingController bankAccountController = TextEditingController();

  List<ChooseItem> colorList = [
    ChooseItem(name: '男'),
    ChooseItem(name: '女'),
  ];

  Gender? _gender;

  @override
  void dispose() {
    super.dispose();
    codeCreditController.dispose();
    storesPhotoController.dispose();
    idCardController.dispose();
    storesNameController.dispose();
    storesAddressController.dispose();
    nameController.dispose();
    genderController.dispose();
    phoneController.dispose();
    commissionController.dispose();
    bankCardController.dispose();
    bankController.dispose();
    bankAccountController.dispose();
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
      backgroundColor: bodyColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.hb,
            Container(
              padding: EdgeInsets.only(left: 32.w),
              child: Text(
                '基本信息',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: BaseStyle.fontSize32,
                    color: const Color(0xFF110000)),
              ),
            ),
            32.hb,
            _real(),
            40.hb,
            Container(
              padding: EdgeInsets.only(left: 32.w),
              child: Text(
                '店长信息',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: BaseStyle.fontSize32,
                    color: const Color(0xFF110000)),
              ),
            ),
            32.hb,
            _info(),
            72.hb,
            CloudBottomButton(
              onTap: () async {
                if (!canTap) {
                  return;
                }
                res = await BusinessFunc.getStoreadd(
                    storesNameController.text,
                    storesAddressController.text,
                    nameController.text,
                    _gender!.typeNum,
                    phoneController.text,
                    commissionController.text,
                    idCardController.text,
                    codeCreditController.text,
                    bankCardController.text,
                  bankController.text,
                  bankAccountController.text,
                );
                if (res) {
                  BotToast.showText(text: '新增成功');
                  Get.back();
                }
              },
              text: '新 建',
            )
          ],
        ),
      ),
    );
  }

  _real() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditItemWidget(
            topIcon: false,
            paddingStart: 0,
            titleColor: const Color(0xFF999999),
            titleSize: 28.sp,
            controller: storesNameController,
            title: '门店名称',
            tips: '请输入门店名称',
          ),
          EditItemWidget(
            topIcon: false,
            paddingStart: 0,
            titleColor: const Color(0xFF999999),
            titleSize: 28.sp,
            controller: storesAddressController,
            title: '门店地址',
            tips: '请输入门店地址',
          ),
          EditItemWidget(
            topIcon: false,
            paddingStart: 0,
            titleColor: const Color(0xFF999999),
            titleSize: 28.sp,
            controller: codeCreditController,
            title: '信用代码',
            tips: '请输入社会信用代码',
          ),
          EditItemWidget(
            topIcon: false,
            paddingStart: 0,
            titleColor: const Color(0xFF999999),
            titleSize: 28.sp,
            controller: storesPhotoController,
            title: '联系电话',
            tips: '请输入联系电话',
          ),
        ],
      ),
    );
  }

  _info() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditItemWidget(
            topIcon: false,
            paddingStart: 0,
            titleColor: const Color(0xFF999999),
            titleSize: 28.sp,
            controller: nameController,
            title: '姓名',
            tips: '请输入',
          ),
          GestureDetector(
            onTap: () async {
              await showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16.w))),
                builder: (context) {
                  return CloudListPickerWidget(
                      title: '性别',
                      items: colorList.map((e) => e.name).toList(),
                      onConfirm: (strList, indexList) {
                        genderController.text = strList;
                        _gender = Gender.getValue(indexList + 1);
                        Get.back();
                        FocusManager.instance.primaryFocus?.unfocus();
                        setState(() {});
                      });
                },
              );
            },
            child: EditItemWidget(
              topIcon: false,
              paddingStart: 0,
              titleColor: const Color(0xFF999999),
              titleSize: 28.sp,
              controller: genderController,
              title: '性别',
              tips: '请选择',
              endIcon: Image(
                image: AssetImage(Assets.icons.icGoto.path),
                width: 32.w,
                height: 32.w,
              ),
              canChange: false,
            ),
          ),
          EditItemWidget(
            paddingState: true,
            errText: '手机号格式错误',
            length: 11,
            topIcon: false,
            paddingStart: 0,
            titleColor: const Color(0xFF999999),
            titleSize: 28.sp,
            controller: phoneController,
            title: '手机号',
            tips: '请输入',
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(11) //限制长度
            ],
          ),
          EditItemWidget(
            topIcon: false,
            paddingStart: 0,
            titleColor: const Color(0xFF999999),
            titleSize: 28.sp,
            controller: bankCardController,
            title: '银行账号',
            tips: '请输入银行账号',
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(18) //限制长度
            ],
          ),
          EditItemWidget(
            topIcon: false,
            paddingStart: 0,
            titleColor: const Color(0xFF999999),
            titleSize: 28.sp,
            controller:bankAccountController,
            title: '开户行',
            tips: '请输入开户行',
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(18) //限制长度
            ],
          ),
          EditItemWidget(
            topIcon: false,
            paddingStart: 0,
            titleColor: const Color(0xFF999999),
            titleSize: 28.sp,
            controller: bankAccountController,
            title: '账户名',
            tips: '请输入账户名',
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(18) //限制长度
            ],
          ),
          EditItemWidget(
            topIcon: false,
            paddingStart: 0,
            titleColor: const Color(0xFF999999),
            titleSize: 28.sp,
            controller: idCardController,
            title: '身份证',
            tips: '请输入身份证号',
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(18) //限制长度
            ],
          ),
          EditItemWidget(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
            ],
            topIcon: false,
            paddingStart: 0,
            titleColor: const Color(0xFF999999),
            titleSize: 28.sp,
            controller: commissionController,
            title: '销售提成',
            tips: '请输入',
            endText: '%',
          ),
        ],
      ),
    );
  }

  bool get canTap {
    if (storesNameController.text.trim().isEmpty) {
      BotToast.showText(text: '请先输入门店名称');
      return false;
    }
    if (storesAddressController.text.trim().isEmpty) {
      BotToast.showText(text: '请先输入门店地址');
      return false;
    }
    if (nameController.text.trim().isEmpty) {
      BotToast.showText(text: '请先输入姓名');
      return false;
    }
    if (phoneController.text.trim().isEmpty) {
      BotToast.showText(text: '请先输入手机号');
      return false;
    }
    if (genderController.text.trim().isEmpty) {
      BotToast.showText(text: '请先选择性别');
      return false;
    }
    if (commissionController.text.trim().isEmpty) {
      BotToast.showText(text: '请先输入销售提成');
      return false;
    }

    return true;
  }
}
