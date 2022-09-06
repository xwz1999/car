import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/user/call_car_order_info_model.dart';
import 'package:cloud_car/ui/user/user_order/status.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/widget/cloud_box_tile.dart';
import 'package:cloud_car/widget/cloud_car_box.dart';
import 'package:cloud_car/widget/cloud_chip.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/cloud_status_tag.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';

class CallCarInfoPage extends StatefulWidget {
  final int orderId;

  const CallCarInfoPage({super.key, required this.orderId});

  @override
  _CallCarInfoPageState createState() => _CallCarInfoPageState();
}

class _CallCarInfoPageState extends State<CallCarInfoPage> {
  late CallCarOrderInfoModel _infoModel;
  bool _onLoad = true;
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  @override
  void dispose() {
    _easyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CloudScaffold.normal(
      title: '叫车订单',
      barHeight: 88.w,
      body: EasyRefresh(
        firstRefresh: true,
        header: MaterialHeader(),
        onRefresh: () async {
          var base = await apiClient.request(API.order.callCarInfo,
              data: {'orderId': widget.orderId});
          if (base.code == 0) {
            _infoModel = CallCarOrderInfoModel.fromJson(base.data);
            _onLoad = false;
            setState(() {});
          }
        },
        controller: _easyRefreshController,
        child: _onLoad
            ? const SizedBox()
            : ListView(
                children: [
                  16.hb,
                  Container(
                    padding: EdgeInsets.all(16.w),
                    margin: EdgeInsets.symmetric(
                      horizontal: 32.w,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.w),
                        color: kForeGroundColor),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '叫车车辆信息',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            CloudStatusTag(text: _infoModel.statusEm.typeStr)
                          ],
                        ),
                        24.hb,
                        Row(
                          children: [
                            Image.asset(
                              Assets.images.carBanner.path,
                              width: 196.w,
                              height: 150.w,
                              fit: BoxFit.fill,
                            ),
                            20.wb,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 406.w,
                                  child: Text(
                                    _infoModel.modelName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.copyWith(
                                            color: BaseStyle.color111111,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                36.hb,
                                Row(
                                  children: [
                                    CloudChip(
                                      text: '过户${_infoModel.transfer}次',
                                    ),
                                    16.wb,
                                    CloudChip(
                                      text: DateUtil.formatDateMs(
                                          _infoModel.licensingDate * 1000,
                                          format: DateFormats.zh_y_mo),
                                    ),
                                    16.wb,
                                    CloudChip(
                                      text:
                                          '${NumUtil.divide(num.parse(_infoModel.mileage), 10000)}万公里',
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        24.hb,
                        Row(
                          children: [
                            '订单总额'
                                .text
                                .size(28.sp)
                                .color(const Color(0xFF333333))
                                .bold
                                .make(),
                            const Spacer(),
                            '¥ ${double.parse(_infoModel.amount)}'
                                .text
                                .size(28.sp)
                                .color(const Color(0xFF333333))
                                .bold
                                .make(),
                          ],
                        )
                      ],
                    ),
                  ),
                  16.hb,
                  CloudCarBox(
                    title: '订单信息',
                    action: TextButton(
                        onPressed: () {
                          launchUrlString('tel:${_infoModel.brokerInfo.phone}');
                        },
                        child:
                            '联系车务'.text.color(const Color(0xFF027AFF)).make()),
                    items: [
                      CloudBoxTile(
                          title: '客户姓名', text: _infoModel.customerInfo.name),
                      CloudBoxTile(
                          title: '联系方式', text: _infoModel.customerInfo.phone),
                      CloudBoxTile(
                          title: '绑定销售', text: _infoModel.brokerInfo.name),
                      CloudBoxTile(title: '上门地址', text: _infoModel.address),
                      CloudBoxTile(
                          title: '上门时间',
                          text: DateUtil.formatDateMs(_infoModel.reserveAt,
                              format: DateFormats.y_mo_d_h_m)),
                    ],
                  ),
                  Offstage(
                    offstage:
                        _infoModel.status < CallCarStatus.unComplete.typeNum,
                    child: CloudCarBox(
                      title: '支付信息',
                      items: [
                        CloudBoxTile(
                            title: '支付方式',
                            text: _infoModel.payInfo.payTypeEM.typeStr),
                        CloudBoxTile(
                            title: '支付时间',
                            text: DateUtil.formatDateMs(
                                _infoModel.payInfo.payTime,
                                format: DateFormats.y_mo_d_h_m)),
                      ],
                    ),
                  ),
                  Offstage(
                    offstage:
                        _infoModel.status < CallCarStatus.refundAudit.typeNum,
                    child: CloudCarBox(
                      title: '退款信息',
                      items: [
                        CloudBoxTile(
                            title: '退回方式',
                            text: _infoModel.payInfo.payTypeEM.typeStr),
                        CloudBoxTile(
                            title: '退回时间',
                            text: DateUtil.formatDateMs(
                                _infoModel.refundInfo.auditAt,
                                format: DateFormats.y_mo_d_h_m)),
                        CloudBoxTile(
                            title: '申请时间',
                            text: DateUtil.formatDateMs(
                                _infoModel.refundInfo.createdAt,
                                format: DateFormats.y_mo_d_h_m)),
                        CloudBoxTile(
                            title: '退款理由',
                            text: _infoModel.refundInfo.rejectReason),
                        Row(
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(
                                '照片凭证',
                                style: TextStyle(
                                    color: BaseStyle.color333333,
                                    fontSize: BaseStyle.fontSize28),
                              ),
                            ),
                            32.wb,
                            CloudImageNetworkWidget(
                              urls: [_infoModel.refundInfo.proof],
                              width: 200.w,
                              height: 150.w,
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
