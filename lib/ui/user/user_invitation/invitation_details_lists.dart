import 'package:cloud_car/model/car/customer_trail_model.dart';
import 'package:cloud_car/ui/home/func/customer_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

///客户轨迹
class InvitationDetailsList extends StatefulWidget {
  final int customerId;
  final int type;
  const InvitationDetailsList(
      {Key? key, required this.customerId, required this.type})
      : super(key: key);

  @override
  _InvitationDetailsListState createState() => _InvitationDetailsListState();
}

class _InvitationDetailsListState extends State<InvitationDetailsList> {
  List<CustomerTrailModel> _list = [];

  bool _onLoad = true;
  final ScrollController _scrollController = ScrollController();

  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  @override
  void dispose() {
    _easyRefreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    print(widget.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      firstRefresh: true,
      header: MaterialHeader(),
      footer: MaterialFooter(),
      controller: _easyRefreshController,
      scrollController: _scrollController,
      onRefresh: () async {
        _list = await CustomerFunc.getCustomerTrail(
          widget.customerId,
        );
        _onLoad = false;
        setState(() {});
      },
      //emptyWidget: const NoDataWidget(text: '暂无客户轨迹信息',),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return widget.type == 2
              ? _getInvitationListItem(index, index < 1, _list[index])
              : _getSubscribeListItem(index, index < 1, _list[index]);
        },
        itemCount: _list.length,
      ),
    );
  }

  ///邀约
  _getInvitationListItem(int index, bool ing, CustomerTrailModel model) {
    return Offstage(
      offstage: widget.type != model.contentType,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 32.w),
                height: double.infinity,
                child: Column(
                  children: [
                    index != 0
                        ? Container(
                            width: 2.w,
                            height: 25.w,
                            decoration: BoxDecoration(
                              color: index == 1
                                  ? kPrimaryColor
                                  : BaseStyle.colorcccccc,
                            ),
                          )
                        : const SizedBox(),
                    Container(
                      margin: EdgeInsets.only(top: index != 0 ? 00.w : 30.w),
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                        color: ing ? kPrimaryColor : BaseStyle.colorcccccc,
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                    ),
                    index != _list.length - 1
                        ? Expanded(
                            child: Container(
                              width: 2.w,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color:
                                    ing ? kPrimaryColor : BaseStyle.colorcccccc,
                              ),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
              30.wb,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.hb,
                  Row(
                    children: [
                      Text(
                        model.type,
                        style: TextStyle(
                          color: const Color(0xFFAAAAAA),
                          fontSize: 24.sp,
                        ),
                      ),
                      Text(
                        ' ｜ ',
                        style: TextStyle(
                          color: const Color(0xFFAAAAAA),
                          fontSize: 24.sp,
                        ),
                      ),
                      Text(
                        model.initiatorName,
                        style: TextStyle(
                          color: const Color(0xFFAAAAAA),
                          fontSize: 24.sp,
                        ),
                      ),
                      Text(
                        ' ｜ ',
                        style: TextStyle(
                          color: const Color(0xFFAAAAAA),
                          fontSize: 24.sp,
                        ),
                      ),
                      Text(
                        DateUtil.formatDate(
                            DateUtil.getDateTimeByMs(
                                model.createdAt.toInt() * 1000),
                            format: 'yyyy-MM-dd HH:mm:ss'),
                        style: TextStyle(
                          color: const Color(0xFFAAAAAA),
                          fontSize: 24.sp,
                        ),
                      ),
                    ],
                  ),
                  16.hb,
                  Text(
                    model.content,
                    style: TextStyle(
                      color: widget.type == 2
                          ? const Color(0xFF999999)
                          : const Color(0xFF027AFF),
                      fontSize: 28.sp,
                    ),
                  ),
                  //model.contentType == 1 ? const SizedBox() : 16.hb,
                  _getContent(model),
                  50.hb,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///预约
  _getSubscribeListItem(int index, bool ing, CustomerTrailModel model) {
    return Offstage(
        offstage: widget.type != model.contentType,
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 32.w),
                  height: double.infinity,
                  child: Column(
                    children: [
                      index != 0
                          ? Container(
                              width: 2.w,
                              height: 25.w,
                              decoration: BoxDecoration(
                                color: index == 1
                                    ? kPrimaryColor
                                    : BaseStyle.colorcccccc,
                              ),
                            )
                          : const SizedBox(),
                      Container(
                        margin: EdgeInsets.only(top: index != 0 ? 00.w : 30.w),
                        width: 20.w,
                        height: 20.w,
                        decoration: BoxDecoration(
                          color: ing ? kPrimaryColor : BaseStyle.colorcccccc,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                      ),
                      index != _list.length - 1
                          ? Expanded(
                              child: Container(
                                width: 2.w,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: ing
                                      ? kPrimaryColor
                                      : BaseStyle.colorcccccc,
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
                30.wb,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.hb,
                    Row(
                      children: [
                        Text(
                          model.type,
                          style: TextStyle(
                            color: const Color(0xFFAAAAAA),
                            fontSize: 24.sp,
                          ),
                        ),
                        Text(
                          ' ｜ ',
                          style: TextStyle(
                            color: const Color(0xFFAAAAAA),
                            fontSize: 24.sp,
                          ),
                        ),
                        Text(
                          model.initiatorName,
                          style: TextStyle(
                            color: const Color(0xFFAAAAAA),
                            fontSize: 24.sp,
                          ),
                        ),
                        Text(
                          ' ｜ ',
                          style: TextStyle(
                            color: const Color(0xFFAAAAAA),
                            fontSize: 24.sp,
                          ),
                        ),
                        Text(
                          DateUtil.formatDate(
                              DateUtil.getDateTimeByMs(
                                  model.createdAt.toInt() * 1000),
                              format: 'yyyy-MM-dd HH:mm:ss'),
                          style: TextStyle(
                            color: const Color(0xFFAAAAAA),
                            fontSize: 24.sp,
                          ),
                        ),
                      ],
                    ),
                    16.hb,
                    Text(
                      model.content,
                      style: TextStyle(
                        color: const Color(0xFF027AFF),
                        fontSize: 28.sp,
                      ),
                    ),
                    //model.contentType == 1 ? const SizedBox() : 16.hb,
                    _getContent(model),
                    50.hb,
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  _getContent(CustomerTrailModel model) {
    return model.contentType == 1
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.type == 3
                    ? '邀约时间：${DateUtil.formatDate(DateUtil.getDateTimeByMs(model.invite.inviteAt.toInt() * 1000), format: 'yyyy-MM-dd HH:mm:ss')}'
                    : '邀约到店时间：${DateUtil.formatDate(DateUtil.getDateTimeByMs(model.invite.inviteAt.toInt() * 1000), format: 'yyyy-MM-dd HH:mm:ss')}',
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 28.sp,
                ),
              ),
              Container(
                width: 500.w,
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.type == 3
                      ? '邀约地址：${model.reserve.address}'
                      : '邀约到店地址：${model.invite.address}',
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 28.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              widget.type == 2
                  ? Container(
                      width: 500.w,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            '邀约备注: ',
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 28.sp,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            model.invite.remark == ''
                                ? '-'
                                : model.invite.remark,
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 28.sp,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ))
                  : const SizedBox(),
              widget.type == 3
                  ? GestureDetector(
                      onTap: () {
                        print('立即导航');
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 32.w,
                            height: 32.w,
                            child: Image.asset(Assets.icons.map.path),
                          ),
                          8.wb,
                          Text(
                            '立即导航',
                            style: TextStyle(
                                color: const Color(0xFF027AFF),
                                fontSize: BaseStyle.fontSize24),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
              //16.hb,
              widget.type == 2
                  ? SizedBox(
                      width: 500.w,
                      child: Text(
                        model.invite.remark,
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 28.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  : const SizedBox(),
              16.hb,
              model.contentType == 2
                  ? Container(
                      width: 560.w,
                      height: 200.w,
                      child: _getCarItem(
                        model.invite.mainPhoto,
                        model.invite.modelName,
                        DateUtil.formatDate(
                            DateUtil.getDateTimeByMs(
                                model.invite.inviteAt.toInt() * 1000),
                            format: 'yyyy年MM月'),

                        '${model.invite.mileage}万公里',
                        model.invite.price,
                      ),
                      decoration: BoxDecoration(
                        color: BaseStyle.colorf6f6f6,
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                    )
                  : Container(
                      width: 560.w,
                      height: 200.w,
                      child: _getCarItem(
                        '',
                        model.reserve.modelName,
                        DateUtil.formatDate(
                            DateUtil.getDateTimeByMs(
                                model.reserve.licensingDate.toInt() * 1000),
                            format: 'yyyy年MM月'),

                        '${model.reserve.mileage}万公里',
                        '',
                      ),
                      decoration: BoxDecoration(
                        color: BaseStyle.colorf6f6f6,
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                    ),
            ],
          );
  }

  _getCarItem(
      String url, String name, String time, String distance, String price) {
    return Container(
      padding: EdgeInsets.only(left: 24.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            //头像
            width: 200.w, height: 150.w,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.w)),
                child: CloudImageNetworkWidget.car(
                  urls: [url],
                ),
              ),
            ),
          ),
          24.wb,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: BaseStyle.color111111,
                      fontSize: BaseStyle.fontSize28,
                      fontWeight: FontWeight.bold),
                ),
                16.hb,
                Row(
                  children: [
                    _getTextView(time),
                    16.wb,
                    _getTextView(distance),
                  ],
                ),
                16.hb,
                price.isEmpty
                    ? const SizedBox()
                    : RichText(
                        text: TextSpan(
                            text: price,
                            style: TextStyle(
                                color: const Color(0xFFFF3E02),
                                fontSize: 32.sp),
                            children: [
                              TextSpan(
                                  text: '万',
                                  style: TextStyle(
                                      color: const Color(0xFFFF3E02),
                                      fontSize: 26.sp))
                            ]),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getTextView(String text) {
    return text.isNotEmpty
        ? Container(
            decoration: BoxDecoration(
                color: const Color(0xFFF1F2F4),
                borderRadius: BorderRadius.all(Radius.circular(2.w))),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
            child: Text(
              text,
              maxLines: 2,
              style: TextStyle(
                color: const Color(0xFF4F5A74),
                fontSize: 20.sp,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        : const SizedBox();
  }
}
