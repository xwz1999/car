import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/model/customer/customer_list_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/choose_customer_page.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/ui/user/success_failure_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:cloud_car/widget/picker/car_date_picker.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallOrderPage extends StatefulWidget {
  final CarListModel carListModel;

  const CallOrderPage({super.key, required this.carListModel});

  @override
  _CallOrderPageState createState() => _CallOrderPageState();
}

class _CallOrderPageState extends State<CallOrderPage> {
  late TextEditingController _editingController2;
  late TextEditingController _editingController3;
  late TextEditingController _editingController4;
  late TextEditingController _editingController5;
  late TextEditingController _editingController6;


  // FocusNode focusNode = FocusNode();

  CallOrderModel callOrderModel = CallOrderModel();

  @override
  void initState() {
    _editingController2 = TextEditingController();
    _editingController3 = TextEditingController();
    _editingController4 = TextEditingController();
    _editingController5 = TextEditingController();

    _editingController6 = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _editingController2.dispose();
    _editingController3.dispose();
    _editingController4.dispose();
    _editingController5.dispose();
    _editingController6.dispose();
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
          '叫车订单',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      backgroundColor: bodyColor,
      extendBody: true,
      bottomNavigationBar:
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30.w),
        height: 150.w,
        color: kForeGroundColor,
        child: GestureDetector(
          onTap: () async {
            if (
                callOrderModel.reserveTime == null ||
                callOrderModel.remark == null ||
                callOrderModel.address == null ||
                callOrderModel.customerId == null ||
                callOrderModel.phone == null) {
              CloudToast.show('请先完善订单信息');
            } else {
              Get.back();
              await OrderFunc.getCarAdd(
                      widget.carListModel.id,
                      callOrderModel.customerId!,
                      callOrderModel.phone!,
                      callOrderModel.reserveTime!,
                  callOrderModel.address!,
                  callOrderModel.remark!)
                  .then((value) {
                value
                    ? Get.to(() => SuccessFailure(
                        conditions: true,
                        headline: '叫车订单',
                        body: Text(
                          '发起成功，点击下方联系车务',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        bottom: CloudBottomButton(
                          onTap: () {
                            Alert.show(
                                context,
                                NormalContentDialog(
                                  type: NormalTextDialogType.delete,
                                  title: '',
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      30.hb,
                                      SizedBox(
                                        width: 238.w,
                                        height: 174.w,
                                        child: Image.asset(
                                          Assets.images.immediately.path,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      48.hb,
                                      Text(
                                        callOrderModel.phone!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            ?.copyWith(
                                                fontSize: BaseStyle.fontSize40),
                                      ),
                                      16.hb,
                                      Text(
                                        '使用虚拟号联系绑定销售',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                      30.hb,
                                    ],
                                  ),
                                  items: const ['取消'],
                                  deleteItem: '立即联系',
                                  //监听器
                                  listener: (index) {
                                    Alert.dismiss(context);
                                  },
                                  deleteListener: () {
                                    Alert.dismiss(context);
                                    launchUrl(Uri(scheme: 'tel', path: callOrderModel.phone!));


                                  },
                                ));
                          },
                          text: '立即联系',
                        )))
                    : CloudToast.show('叫车订单创建失败');
              });
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
              '发起订单',
              style: TextStyle(
                  color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          8.hb,
          Container(
            width: double.infinity,
            color: kForeGroundColor,
            padding: EdgeInsets.only(
                left: 24.w, right: 24.w, top: 32.w, bottom: 48.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '车辆信息',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: BaseStyle.color111111,
                      fontWeight: FontWeight.bold),
                ),
                24.hb,
                CarItemWidget(
                  widgetPadding:
                  EdgeInsets.zero,
                  name: widget.carListModel.modelName,
                  time: DateUtil.formatDateMs(widget.carListModel.licensingDate.toInt() * 1000,
                      format: 'yyyy年MM月'),
                  distance: '${widget.carListModel.mileage}万公里',
                  // standard: '国六',
                  url: widget.carListModel.mainPhoto,
                  price: NumUtil.divide(num.parse(widget.carListModel.price), 10000).toString(),
                ),
              ],
            ),
          ),
          10.hb,
          Container(
            width: double.infinity,
            color: kForeGroundColor,
            padding: EdgeInsets.only(
                left: 32.w, right: 32.w, top: 32.w, bottom: 48.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '上门地址信息',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: BaseStyle.color111111,
                      fontWeight: FontWeight.bold),
                ),
                24.hb,
                GestureDetector(
                  onTap: () {
                    Get.to(() => ChooseCustomerPage(
                          callback: (CustomerListModel model) {
                            _editingController2.text = model.nickname;
                            callOrderModel.customerId = model.id;
                            setState(() {});
                          },
                        ));
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 32.w),
                        width: 120.w,
                        child: Text('客户',
                            style:
                                Theme.of(context).textTheme.subtitle2?.copyWith(
                                      color: const Color(0xFF999999),
                                    )),
                      ),
                      50.wb,
                      Expanded(
                        child: TextField(
                          enabled: false,
                          keyboardType: TextInputType.text,
                          onEditingComplete: () {
                            setState(() {});
                            // _refreshController.callRefresh();
                          },
                          onChanged: (text) {
                            setState(() {});
                          },
                          style: TextStyle(
                            color: BaseStyle.color333333,
                            fontSize: BaseStyle.fontSize28,
                          ),
                          controller: _editingController2,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 0.w),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "请选择",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.w),
                        child: Icon(
                          CupertinoIcons.chevron_forward,
                          size: 40.w,
                          color: BaseStyle.color666666,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32.w),
                      width: 120.w,
                      child: Text('联系方式',
                          style: TextStyle(
                            color: BaseStyle.color999999,
                            fontSize: BaseStyle.fontSize28,
                          )),
                    ),
                    50.wb,
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        onEditingComplete: () {
                          setState(() {});
                          // _refreshController.callRefresh();
                        },
                        onChanged: (text) {
                          callOrderModel.phone = text;
                          setState(() {});
                        },
                        style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28,
                        ),
                        controller: _editingController4,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 0.w),
                          filled: true,
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
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    DateTime? firstDate;
                    firstDate =
                        await CarDatePicker.allTimePicker(DateTime.now());
                    _editingController3.text = DateUtil.formatDate(firstDate,
                        format: 'yyyy-MM-dd HH:mm:ss');
                    callOrderModel.reserveTime = DateUtil.formatDate(firstDate,
                        format: 'yyyy-MM-dd HH:mm:ss');


                    FocusManager.instance.primaryFocus?.unfocus();///隐藏所有焦点

                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 32.w),
                        width: 120.w,
                        child: Text('上门时间',
                            style: TextStyle(
                              color: BaseStyle.color999999,
                              fontSize: BaseStyle.fontSize28,
                            )),
                      ),
                      50.wb,
                      Expanded(
                        child: TextField(
                          enabled: false,
                          keyboardType: TextInputType.text,
                          onEditingComplete: () {
                            setState(() {});
                            // _refreshController.callRefresh();
                          },
                          onChanged: (text) {
                            setState(() {});
                          },
                          style: TextStyle(
                            color: BaseStyle.color333333,
                            fontSize: BaseStyle.fontSize28,
                          ),
                          controller: _editingController3,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 0.w),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "请选择",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.w),
                        child: Icon(
                          CupertinoIcons.chevron_forward,
                          size: 40.w,
                          color: BaseStyle.color666666,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32.w),
                      width: 120.w,
                      child: Text('上门地址',
                          style: TextStyle(
                            color: BaseStyle.color999999,
                            fontSize: BaseStyle.fontSize28,
                          )),
                    ),
                    50.wb,
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        onEditingComplete: () {
                          setState(() {});
                          // _refreshController.callRefresh();
                        },
                        onChanged: (text) {
                          callOrderModel.address = text;
                          setState(() {});
                        },
                        style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28,
                        ),
                        controller: _editingController5,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 0.w),
                          filled: true,
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
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 32.w),
                      width: 120.w,
                      child: Text('备注',
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
                        onEditingComplete: () {
                          setState(() {});
                          // _refreshController.callRefresh();
                        },
                        onChanged: (text) {
                          callOrderModel.remark = text;
                          setState(() {});
                        },
                        style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28,
                        ),
                        controller: _editingController6,
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
        ],
      ),
    );
  }
}

class CallOrderModel {

  int? customerId;
  String? phone;
  String? reserveTime;
  String? address;
  String? remark;

  CallOrderModel({

    this.customerId,
    this.phone,
    this.reserveTime,
    this.address,
    this.remark,
  });
}
