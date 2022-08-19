import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/split_account/split_account_info_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/cloud_avatar_widget.dart';
import 'package:cloud_car/widget/cloud_bordered_text_field_widget.dart';
import 'package:cloud_car/widget/cloud_dialog_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

class SplitInfoPage extends StatefulWidget {
  final String title;
  final int accountId;

  const SplitInfoPage(
      {super.key, this.title = '分账明细', required this.accountId});

  @override
  _SplitInfoPageState createState() => _SplitInfoPageState();
}

class _SplitInfoPageState extends State<SplitInfoPage> {
  late SplitAccountInfoModel _infoModel;
  bool _onLoad = true;
  int _currentDateIndex = 0;

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  @override
  void dispose() {
    _amountController.dispose();
    _nameController.dispose();
    _easyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bottom = Container(
      width: double.infinity,
      height: 160.w + MediaQuery.of(context).padding.bottom,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _bottomButton(
              backColor: Colors.white,
              textColor: const Color(0xFF027AFF),
              borderColor: const Color(0xFF027AFF),
              text: '分账完结',
              onTap: () async {
                var confirm =
                    await Get.dialog(_getDialog(1), barrierDismissible: false);
                if (!confirm) return;
                var res = await apiClient.request(API.split.finish, data: {
                  'accountId': widget.accountId,
                  'amount': double.parse(_amountController.text)
                });
                if (res.code == 0) {
                  _easyRefreshController.callRefresh();
                }
                CloudToast.show(res.msg);
              }),
          30.wb,
          _bottomButton(
              backColor: const Color(0xFF027AFF),
              textColor: Colors.white,
              text: '添加账目',
              onTap: () async {
                var confirm =
                    await Get.dialog(_getDialog(2), barrierDismissible: false);
                if (!confirm) return;
                var res = await apiClient.request(API.split.addBill, data: {
                  'accountId': widget.accountId,
                  'name': _nameController.text,
                  'amount': double.parse(_amountController.text)
                });
                if (res.code == 0) {
                  _easyRefreshController.callRefresh();
                  _nameController.clear();
                  _amountController.clear();
                }
                CloudToast.show(res.msg);
              })
        ],
      ),
    );
    return CloudScaffold.normal(
      title: widget.title,
      barHeight: 88.w,
      extendBody: true,
      body: Stack(
        children: [
          Assets.images.splitBarBotttom.image(),
          EasyRefresh(
              firstRefresh: true,
              controller: _easyRefreshController,
              onRefresh: () async {
                var res = await apiClient.request(API.split.info,
                    data: {'accountId': widget.accountId});
                if (res.code == 0) {
                  _infoModel = SplitAccountInfoModel.fromJson(res.data);
                  _onLoad = false;
                  setState(() {});
                }
              },
              header: MaterialHeader(),
              child: _onLoad
                  ? const SizedBox.shrink()
                  : ListView(
                      children: [
                        214.hb,
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 686.w,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    ..._infoModel.brokers
                                        .map((e) => _listTile(e))
                                        .toList(),
                                  ],
                                ),
                              ),
                              if (_infoModel.finish)
                                Positioned(
                                  top: -46.w,
                                  right: -30.w,
                                  child: Assets.images.splitFinishTag
                                      .image(width: 160.w, height: 160.w),
                                )
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 686.w,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: _totalStatistics(),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 686.w,
                            height: 40.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    alignment: Alignment.bottomCenter,
                                    image: AssetImage(
                                        Assets.images.sawtooth.path))),
                          ),
                        ),
                        56.hb,
                        _billTile(_infoModel.dateBills[_currentDateIndex])
                      ],
                    )),
          Assets.images.splitBarAbove.image(),
        ],
      ),
      bottomNavi:  (_onLoad || _infoModel.finish) ? const SizedBox.shrink() : bottom,
    );
  }

  // 1 = 分账完结 2 = 添加账目
  Widget _getDialog(int type) {
    return CloudDialogWidget(
      onCancel: () {
        _nameController.clear();
        _amountController.clear();
        Get.back(result: false);
      },
      onConfirm: () {
        Get.back(result: true);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          40.hb,
          (type == 1 ? '分账完结' : '添加账目')
              .text
              .size(36.sp)
              .color(Colors.black)
              .bold
              .isIntrinsic
              .make(),
          24.hb,
          if (type == 2)
            CloudBorderedTextFieldWidget(
              width: 400.w,
              height: 60.w,
              controller: _nameController,
              hintText: '请输入名称',
            ),
          if (type == 2) 24.hb,
          CloudBorderedTextFieldWidget(
            width: 400.w,
            height: 60.w,
            inputType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: _amountController,
            hintText: '请输入金额',
          )
        ],
      ),
    );
  }

  Widget _billTile(DateBillItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            32.wb,
            item.date.text.size(32.sp).color(Colors.black).bold.make(),
            PopupMenuButton(
                icon: const Icon(
                  CupertinoIcons.chevron_down,
                  color: Colors.black12,
                ),
                iconSize: 36.w,
                position: PopupMenuPosition.under,
                itemBuilder: (context) {
                  return _infoModel.dateBills
                      .mapIndexed((e, index) => PopupMenuItem(
                          onTap: () {
                            _currentDateIndex = index;
                            setState(() {});
                          },
                          child: e.date.text.isIntrinsic.make()))
                      .toList();
                })
          ],
        ),
        28.hb,
        Container(
          width: 686.w,
          color: Colors.white,
          child: Column(
            children: ListTile.divideTiles(
                    context: context,
                    tiles: item.bills
                        .map((e) => ListTile(
                              title: e.name.text.make(),
                              subtitle:
                                  '${e.brokerName} | ${DateUtil.formatDateMs(e.createAt * 1000)}'
                                      .text
                                      .make(),
                            ))
                        .toList())
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _totalStatistics() {
    return _infoModel.finish
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              '总计利润额 '
                  .richText
                  .withTextSpanChildren([
                    '￥'.textSpan.size(28.sp).color(Colors.red).make(),
                    (_infoModel.saleAmountDec -
                            (_infoModel.amountDec + _infoModel.billAmountDec))
                        .toStringAsFixed(2)
                        .textSpan
                        .size(36.sp)
                        .color(Colors.red)
                        .make(),
                  ])
                  .size(28.sp)
                  .bold
                  .color(const Color(0xFF333333))
                  .make(),
              16.hb,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      '合计购车成本  '
                          .text
                          .size(28.sp)
                          .color(const Color(0xFF666666))
                          .make(),
                      16.hb,
                      '其他成本  '
                          .text
                          .size(28.sp)
                          .color(const Color(0xFF666666))
                          .make(),
                      16.hb,
                      '收车价格  '
                          .text
                          .size(28.sp)
                          .color(const Color(0xFF666666))
                          .make(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      '${_infoModel.amountDec.toStringAsFixed(2)}元'
                          .text
                          .size(28.sp)
                          .color(const Color(0xFF666666))
                          .make(),
                      16.hb,
                      '${_infoModel.billAmountDec.toStringAsFixed(2)}元'
                          .text
                          .size(28.sp)
                          .color(const Color(0xFF666666))
                          .make(),
                      16.hb,
                      '${_infoModel.saleAmountDec.toStringAsFixed(2)}元'
                          .text
                          .size(28.sp)
                          .color(const Color(0xFF666666))
                          .make(),
                    ],
                  )
                ],
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              '合计购车成本'
                  .richText
                  .withTextSpanChildren([
                    '￥'.textSpan.size(28.sp).color(Colors.red).make(),
                    _infoModel.amount.textSpan
                        .size(36.sp)
                        .color(Colors.red)
                        .make(),
                  ])
                  .size(28.sp)
                  .color(const Color(0xFF333333))
                  .make(),
              32.wb,
            ],
          );
  }

  Widget _bottomButton({
    required Color backColor,
    required Color textColor,
    required String text,
    required VoidCallback onTap,
    Color? borderColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 328.w,
        height: 72.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backColor,
          border: borderColor == null ? null : Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 28.sp),
        ),
      ),
    );
  }

  Widget _listTile(BrokerItem item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      width: 686.w,
      height: 136.w,
      child: Row(
        children: [
          CloudAvatarWidget(
            width: 72.w,
            height: 72.w,
            urls: [item.avatar],
          ),
          10.wb,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              item.roleEM.typeStr.text
                  .size(24.w)
                  .color(const Color(0xFF999999))
                  .make(),
              item.name.text.size(28.sp).color(Colors.black).make(),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              '出资占比：${(double.parse(item.proportion) * 100).toStringAsFixed(2)}%'
                  .text
                  .size(24.w)
                  .color(const Color(0xFF999999))
                  .make(),
              '总计出资额：￥${NumUtil.add(double.parse(item.amount), double.parse(item.billAmount))}'
                  .text
                  .size(24.w)
                  .color(Colors.black)
                  .make(),
            ],
          )
        ],
      ),
    );
  }
}
