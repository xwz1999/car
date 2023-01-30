import 'dart:io';

import 'package:cloud_car/model/car/bank_card_info_model.dart';
import 'package:cloud_car/model/customer/customer_list_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/choose_customer_page.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';

import 'package:cloud_car/model/contract/initiate_contract_model.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/colud_check_radio.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../model/car/car_sale_contract_model.dart';
import '../../../../model/car/id_card_info_model.dart';
import 'car_Intermediary_agent_page.dart';

typedef TextCallback = Function(String content);

class SellCarOrderSecondPage extends StatefulWidget {
  final ValueNotifier<InitiateContractModel> contractModel;
  final CarSaleContractModel carSaleContract;

  const SellCarOrderSecondPage(
      {super.key, required this.contractModel, required this.carSaleContract});

  @override
  _SellCarOrderSecondPageState createState() => _SellCarOrderSecondPageState();
}

class _SellCarOrderSecondPageState extends State<SellCarOrderSecondPage> {
  late TextEditingController _editingController;

  late TextEditingController _editingController2;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cardNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController personPaymentController = TextEditingController();
  final TextEditingController bankNumController = TextEditingController();

  final TextEditingController bankController = TextEditingController();

  CustomerListModel? customerListModel;

  final List _models1 = ['微信小程序',];///'其他'
  late int sourceCustomers = 0;
  final List<int> _selectIndex1 = [];

bool phone=false;
  // String phone = '';

  @override
  void initState() {
    _editingController = TextEditingController();
    _editingController2 = TextEditingController();
    Future.delayed(const Duration(seconds: 0), () {
      nameController.text = widget.carSaleContract.masterInfo.name;
      phoneController.text = widget.carSaleContract.masterInfo.phone;
      cardNoController.text = widget.carSaleContract.masterInfo.idCard;
      bankNumController.text = widget.carSaleContract.masterInfo.bankCard;
      bankController.text = widget.carSaleContract.masterInfo.bank;
      // _selectIndex1.add(widget.carSaleContract.customerChannel!-1);
      // _selectIndex1.first=  widget.carSaleContract.customerChannel!-1;
      // _selectIndex1.first=sourceCustomers;
      addressController.text = widget.carSaleContract.masterInfo.address;
      personPaymentController.text =
          widget.carSaleContract.masterInfo.bankAccount;
    });
    super.initState();
  }

  @override
  void dispose() {
    _editingController.dispose();
    _editingController2.dispose();
    nameController.dispose();
    phoneController.dispose();
    cardNoController.dispose();
    bankController.dispose();
    bankNumController.dispose();
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
        title: Text(
          '卖车合同',
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              padding: EdgeInsets.only(right: 32.w),
              child: Text(
                '上一步',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 28.sp,
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: bodyColor,
      extendBody: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          8.hb,
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Container(
              width: double.infinity,
              color: kForeGroundColor,
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 24.w, bottom: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarItemWidget(
                    widgetPadding: EdgeInsets.zero,
                    name: widget.contractModel.value.carModel!.modelName,
                    time: DateUtil.formatDateMs(
                        widget.contractModel.value.carModel!.licensingDate
                                .toInt() *
                            1000,
                        format: 'yyyy年MM月'),
                    distance:
                        '${widget.contractModel.value.carModel!.mileage}万公里',
                    //standard: '国六',
                    url: widget.contractModel.value.carModel!.mainPhoto,
                    price: NumUtil.divide(
                            num.parse(
                                widget.contractModel.value.carModel!.price),
                            10000)
                        .toString(),
                  )

                  // CarItemWidget(
                  //   widgetPadding: EdgeInsets.zero,
                  //   name: '奔驰CLE 插电混动 纯电动续航103km',
                  //   time: '2019年5月',
                  //   distance: '20.43万公里',
                  //   standard: '国六',
                  //   url:Assets.images.carBanner.path,
                  //   price: '27.43万',
                  // ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, top: 12.w),
            child: Text(
              '客户信息',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: BaseStyle.color111111, fontWeight: FontWeight.bold),
            ),
          ),
          20.hb,
          Container(
            width: double.infinity,
            color: kForeGroundColor,
            padding: EdgeInsets.only(left: 32.w, right: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //   EditItemWidget(
                //   title: '客户来源',
                //   topIcon: false,
                //   value: widget.contractModel.value.origin ?? '',
                //   callback: (String content) {
                //     widget.contractModel.value.origin = content;
                //   },
                // ),
                Container(
                  padding: EdgeInsets.only(top: 30.w, bottom: 30.w),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: const Color(0xFFF6F6F6), width: 2.w))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.w),
                        child: Text(
                          '*  ',
                          style: TextStyle(
                            fontSize: 28.sp,
                            color: const Color(0xFFE62222),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 170.w,
                        child: Text(
                          '客户来源',
                          style: TextStyle(
                            fontSize: 32.sp,
                            color: BaseStyle.color333333,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.w,
                        child: getChooseList((String choice) {
                          widget.contractModel.value.origin = choice;
                          if (choice == "微信小程序") {
                            widget.carSaleContract.customerChannel = 1;
                            sourceCustomers = 0;
                          } else if (choice == "其他") {
                            widget.carSaleContract.customerChannel = 2;
                            sourceCustomers = 1;
                          }
                        }, _models1, _selectIndex1),
                      ),
                    ],
                  ),
                ),

                widget.contractModel.value.origin == "微信小程序"
                    ? getContentItem('客户', '请选择',
                        path: Assets.icons.icGoto.path)
                    : const SizedBox(),

                // TextField(
                //   onChanged: (text) {
                //     setState(() {
                //       if (text != "hello") {
                //         phone = text;
                //       }
                //       ;
                //     });
                //   },
                //   decoration: InputDecoration(
                //     icon: Row(
                //       children: [
                //         Padding(
                //           padding: EdgeInsets.only(top: 10.w),
                //           child: Text(
                //             '*  ',
                //             style: TextStyle(
                //               fontSize: 28.sp,
                //               color: const Color(0xFFE62222),
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           width:  100.w,
                //           child: Text(
                //             '手机号',
                //             style: TextStyle(
                //               color:  BaseStyle.color333333,
                //               fontSize:  BaseStyle.fontSize32,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //     hintText: "请输入",
                //     errorText: phone.length==11?'':"手机号格式错误",
                //   ),
                // ),
                EditItemWidget(
                  paddingState: true,
                  errText: '手机号格式错误',
                  length: 11,
                  title: '手机号',
                  //value: widget.contractModel.value.phone ?? '',
                  controller: phoneController,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]")),LengthLimitingTextInputFormatter(11)],
                  callback: (String content) {
                    widget.carSaleContract.masterInfo.phone = content;
                    // widget.contractModel.value.phone = content;
                  },
                ),
                EditItemWidget(
                  title: '姓名',
                  //value: widget.contractModel.value.name ?? "",
                  controller: nameController,
                  callback: (String content) {
                    widget.carSaleContract.masterInfo.name = content;
                    // widget.contractModel.value.name = content;
                  },
                ),
                EditItemWidget(
                  title: '身份证号',
                  //value: widget.contractModel.value.cardNo ?? "",
                  controller: cardNoController,
                  paddingState: true,
                  errText: '身份证格式错误',
                  length: 18,
                  callback: (String content) {
                    // widget.contractModel.value.cardNo = content;
                    widget.carSaleContract.masterInfo.idCard = content;
                  },
                  endIcon: GestureDetector(
                    onTap: () async {
                      File? file =
                          await CloudImagePicker.pickSingleImage(title: '选择图片');
                      if (file != null) {
                        setState(() {});
                        var cancel = CloudToast.loading;
                        String urls = await apiClient.uploadImage(file);
                        IdCardInfoModel? idCardModel =
                            await CarFunc.idCardOCR(urls);
                        if (idCardModel != null) {
                          // widget.contractModel.value.bankCard =
                          //     bankCardInfoModel.bankCardNo;
                          // widget.contractModel.value.bank =
                          //     bankCardInfoModel.bankName;
                          widget.carSaleContract.masterInfo.idCard =
                              idCardModel.number;
                          cardNoController.text = idCardModel.number;
                          widget.carSaleContract.masterInfo.name=idCardModel.name;
                          nameController.text = idCardModel.name;

                        }
                        cancel();
                        setState(() {});
                      }
                    },
                    child: Image.asset(
                      Assets.icons.scan1.path,
                      width: 42.w,
                      height: 42.w,
                    ),
                  ),
                ),

                EditItemWidget(
                  title: '地址',
                  controller: addressController,
                  // value: addressController,
                  callback: (String content) {
                    // widget.contractModel.value.address = content;
                    widget.carSaleContract.masterInfo.address = content;
                  },
                ),
                EditItemWidget(
                  title: '所在地',
                  value: widget.contractModel.value.location ?? "",
                  callback: (String content) {
                    widget.contractModel.value.location = content;
                  },
                ),
                EditItemWidget(
                  title: '付款人',
                  controller: personPaymentController,
                  // value: widget.contractModel.value.payer ?? "",
                  callback: (String content) {
                    // widget.contractModel.value.payer = content;
                    widget.carSaleContract.masterInfo.bankAccount = content;
                  },
                ),
                EditItemWidget(
                  title: '银行账号',
                  //value: widget.contractModel.value.bankCard ?? "",
                  controller: bankNumController,

                  callback: (String content) {
                    // widget.contractModel.value.bankCard = content;
                    widget.carSaleContract.masterInfo.bankCard = content;
                  },
                  endIcon: GestureDetector(
                    onTap: () async {
                      File? file =
                          await CloudImagePicker.pickSingleImage(title: '选择图片');
                      if (file != null) {
                        setState(() {});
                        var cancel = CloudToast.loading;
                        String urls = await apiClient.uploadImage(file);
                        BankCardInfoModel? bankCardInfoModel =
                            await CarFunc.bankCardOCR(urls);
                        if (bankCardInfoModel != null) {
                          // widget.contractModel.value.bankCard =
                          //     bankCardInfoModel.bankCardNo;
                          // widget.contractModel.value.bank =
                          //     bankCardInfoModel.bankName;
                          widget.carSaleContract.masterInfo.bankCard =
                              bankCardInfoModel.bankCardNo;
                          widget.carSaleContract.masterInfo.bank =
                              bankCardInfoModel.bankName;
                          bankNumController.text = bankCardInfoModel.bankCardNo;
                          bankController.text = bankCardInfoModel.bankName;
                        }
                        cancel();
                        setState(() {});
                      }
                    },
                    child: Image.asset(
                      Assets.icons.scan1.path,
                      width: 42.w,
                      height: 42.w,
                    ),
                  ),
                ),

                EditItemWidget(
                  title: '开户行',
                  //value: widget.contractModel.value.bank ?? "",
                  controller: bankController,
                  callback: (String content) {
                    // widget.contractModel.value.bank = content;
                    widget.carSaleContract.masterInfo.bank = content;
                  },
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 32.w),
                      width: 150.w,
                      child: Text('备注描述',
                          style: TextStyle(
                            color: BaseStyle.color999999,
                            fontSize: BaseStyle.fontSize28,
                          )),
                    ),
                    24.hb,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.w),
                          border: Border.all(
                              color: BaseStyle.colordddddd, width: 2.w)),
                      padding: EdgeInsets.symmetric(
                          vertical: 16.w, horizontal: 20.w),
                      height: 200.w,
                      child: TextField(
                        maxLines: 50,
                        keyboardType: TextInputType.text,
                        onEditingComplete: () {},
                        onChanged: (text) {
                          widget.carSaleContract.remark = text;
                          // widget.contractModel.value.remarks = text;
                          setState(() {});
                        },
                        style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28,
                        ),
                        controller: _editingController2,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          filled: true,
                          isDense: true,
                          fillColor: Colors.white,
                          hintText: "请输入",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    32.hb,
                  ],
                ),
              ],
            ),
          ),
          30.hb,
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30.w),
            height: 150.w,
            child: GestureDetector(
              onTap: () {
                if (widget.contractModel.value.origin != "微信小程序") {
                  widget.carSaleContract.customerId = null;
                  if (widget.carSaleContract.masterInfo.name.isEmpty) {
                    CloudToast.show('请填写客户名字');
                  } else if (widget.carSaleContract.masterInfo.phone.isEmpty) {
                    CloudToast.show('请填写客户手机号');
                  } else if (widget.carSaleContract.masterInfo.idCard.isEmpty) {
                    CloudToast.show('请填写客户身份证');
                  } else if (widget
                      .carSaleContract.masterInfo.address.isEmpty) {
                    CloudToast.show('请填写客户地址');
                  } else if (widget.carSaleContract.masterInfo.bank.isEmpty) {
                    CloudToast.show('请填写开户行信息');
                  } else if (widget
                      .carSaleContract.masterInfo.bankCard.isEmpty) {
                    CloudToast.show('请填写银行卡卡号');
                  } else if (widget
                      .carSaleContract.masterInfo.bankAccount.isEmpty) {
                    CloudToast.show('请填写付款人信息');
                  }
                  // if (widget.carSaleContract.masterInfo.name.isEmpty ||
                  //     widget.carSaleContract.masterInfo.phone.isEmpty ||
                  //     widget.carSaleContract.masterInfo.idCard.isEmpty ||
                  //     widget.carSaleContract.masterInfo.address.isEmpty ||
                  //     widget.carSaleContract.masterInfo.bank.isEmpty ||
                  //     widget.carSaleContract.masterInfo.bankCard.isEmpty ||
                  //     widget.carSaleContract.masterInfo.bankAccount.isEmpty) {
                  // }
                  else {
                    Get.to(() => CarIntermediaryAgentPage(
                          contractModel: widget.contractModel,
                          carSaleContract: widget.carSaleContract,
                        ));
                  }
                } else {
                  // if (widget.carSaleContract.customerId == null ||
                  //     widget.carSaleContract.masterInfo.name.isEmpty ||
                  //     widget.carSaleContract.masterInfo.phone.isEmpty ||
                  //     widget.carSaleContract.masterInfo.idCard.isEmpty ||
                  //     widget.carSaleContract.masterInfo.address.isEmpty ||
                  //     widget.carSaleContract.masterInfo.bank.isEmpty ||
                  //     widget.carSaleContract.masterInfo.bankCard.isEmpty ||
                  //     widget.carSaleContract.masterInfo.bankAccount.isEmpty) {
                  //   CloudToast.show('请先完善客户信息');
                  // }
                  if (widget.carSaleContract.masterInfo.name.isEmpty) {
                    CloudToast.show('请填写客户名字');
                  } else if (widget.carSaleContract.masterInfo.phone.isEmpty) {
                    CloudToast.show('请填写客户手机号');
                  } else if (widget.carSaleContract.masterInfo.idCard.isEmpty) {
                    CloudToast.show('请填写客户身份证');
                  } else if (widget
                      .carSaleContract.masterInfo.address.isEmpty) {
                    CloudToast.show('请填写客户地址');
                  } else if (widget.carSaleContract.masterInfo.bank.isEmpty) {
                    CloudToast.show('请填写开户行信息');
                  } else if (widget
                      .carSaleContract.masterInfo.bankCard.isEmpty) {
                    CloudToast.show('请填写银行卡卡号');
                  } else if (widget
                      .carSaleContract.masterInfo.bankAccount.isEmpty) {
                    CloudToast.show('请填写转账人信息');
                  } else if (widget.carSaleContract.customerId == null) {
                    CloudToast.show('请填写门店信息');
                  } else {
                    // Get.to(() => SellCarOrderThirdPage(contractModel: widget.contractModel,));
                    Get.to(() => CarIntermediaryAgentPage(
                          contractModel: widget.contractModel,
                          carSaleContract: widget.carSaleContract,
                        ));
                  }
                }
              },
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
                  '下一步',
                  style: TextStyle(
                      color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
                ),
              ),
            ),
          ),
          30.hb,
        ],
      ),
    );
  }

  getContentItem(String title, String content,
      {isSpecial = false, path, topIcon = true}) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: const Color(0xFFF6F6F6), width: 2.w))),
      padding: EdgeInsets.only(top: 30.w, bottom: 30.w),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ChooseCustomerPage(
                callback: (CustomerListModel model) {
                  widget.contractModel.value.customerModel = model;
                  customerListModel = model;
                  _editingController.text = model.nickname;
                  widget.carSaleContract.customerId = model.id;
                  widget.carSaleContract.masterInfo.name = model.realName;
                  widget.carSaleContract.masterInfo.phone = model.mobile;
                  widget.carSaleContract.masterInfo.idCard = model.idCard;
                  if (model.realName.isNotEmpty) {
                    nameController.text = model.realName;
                    widget.carSaleContract.masterInfo.name = model.realName;
                    // widget.contractModel.value.name = model.realName;
                  }
                  if (model.mobile.isNotEmpty) {
                    phoneController.text = model.mobile;
                    widget.carSaleContract.masterInfo.phone = model.mobile;
                    // widget.contractModel.value.phone = model.mobile;
                  }
                  if (model.idCard.isNotEmpty) {
                    cardNoController.text = model.idCard;
                    widget.carSaleContract.masterInfo.idCard = model.idCard;
                    // widget.contractModel.value.cardNo = model.idCard;
                  }
                  setState(() {});
                },
              ));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            topIcon
                ? Padding(
                    padding: EdgeInsets.only(top: 10.w),
                    child: Text(
                      '*  ',
                      style: TextStyle(
                        fontSize: 32.sp,
                        color: const Color(0xFFE62222),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 10.w),
                    child: Text(
                      '*  ',
                      style: TextStyle(
                        fontSize: 32.sp,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
            SizedBox(
              width: 180.w,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 32.sp,
                  color: const Color(0xFF333333),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                enabled: false,
                keyboardType: TextInputType.text,
                onSubmitted: (text) {
                  setState(() {});
                  // _refreshController.callRefresh();
                },
                onChanged: (text) {},
                style: TextStyle(
                  color: BaseStyle.color333333,
                  fontSize: BaseStyle.fontSize28,
                ),
                maxLines: null,
                controller: _editingController,
                decoration: InputDecoration(
                  //contentPadding: EdgeInsets.only(top: 15.w,bottom: 15.w),
                  filled: true,
                  isCollapsed: true,
                  fillColor: Colors.white,
                  hintText: '请选择',
                  hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                  border: InputBorder.none,
                ),
              ),
            ),
            path != null
                ? Image.asset(
                    path,
                    width: 32.w,
                    height: 32.w,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  getChooseList(Function(String) callBack, List models, List<int> choices) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        ...models
            .mapIndexed((currentValue, index) => GestureDetector(
                  onTap: () {
                    if (choices.contains(index)) {
                      choices.remove(index);
                    } else {
                      choices.clear();
                      choices.add(index);
                    }
                    setState(() {});
                    callBack(models[choices.first]);
                  },
                  child: Container(
                    width: 200.w,
                    color: Colors.white,
                    child: Row(
                      children: [
                        BeeCheckRadio(
                          value: index,
                          groupValue: choices,
                        ),
                        16.wb,
                        Text(
                          currentValue,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ],
    );
  }
}
