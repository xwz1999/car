import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/car/customer_browse_list_model.dart';
import 'package:cloud_car/ui/home/func/customer_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/net_work/inner_model/base_list_model.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

///浏览车辆
class CustomersBrowsePage extends StatefulWidget {
  final int customerId;

  const CustomersBrowsePage({
    super.key,
    required this.customerId,
  });

  @override
  _CustomersBrowsePageState createState() => _CustomersBrowsePageState();
}

class _CustomersBrowsePageState extends State<CustomersBrowsePage> {
  List<CustomerBrowseListModel> _list = [];
  bool _onLoad = true;
  int _page = 1;

  final ScrollController _scrollController = ScrollController();

  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  @override
  void dispose() {
    _easyRefreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      firstRefresh: true,
      header: MaterialHeader(),
      footer: MaterialFooter(),
      scrollController: _scrollController,
      controller: _easyRefreshController,
      onRefresh: () async {
        _page = 1;

        _list =
            await CustomerFunc.getCustomerBrowseList(widget.customerId, _page);
        _onLoad = false;

        setState(() {});
      },
      onLoad: () async {
        _page++;
        BaseListModel baseList = await apiClient.requestList(
            API.customer.browseLists,
            data: {'customerId': widget.customerId, 'page': _page, 'size': 10});
        if (baseList.nullSafetyTotal > _list.length) {
          _list.addAll(baseList.nullSafetyList
              .map((e) => CustomerBrowseListModel.fromJson(e))
              .toList());
        } else {
          _easyRefreshController.finishLoad(noMore: true);
        }
        setState(() {});
      },
      child: _onLoad
          ? const SizedBox()
          : _list.isEmpty
              ? const NoDataWidget(
                  text: '暂无客户轨迹信息',
                  paddingTop: 300,
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return _getListItem(index, index < 1, _list[index]);
                  },
                  itemCount: _list.length,
                ),
    );
  }

  _getListItem(int index, bool ing, CustomerBrowseListModel model) {
    return Container(
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
                          height: 10.w,
                          decoration: BoxDecoration(
                            color: index == 1
                                ? kPrimaryColor
                                : BaseStyle.colorcccccc,
                          ),
                        )
                      : const SizedBox(),
                  Container(
                    margin: EdgeInsets.only(top: index != 0 ? 0 : 30.w),
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
                      '浏览车辆',
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
                      '云云问车-微信小程序-点击浏览',
                      style: TextStyle(
                        color: const Color(0xFFAAAAAA),
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
                16.hb,
                Text(
                  DateUtil.formatDate(
                      DateUtil.getDateTimeByMs(model.createdAt.toInt() * 1000),
                      format: 'yyyy-MM-dd HH:mm:ss'),
                  style: TextStyle(
                    color: const Color(0xFFAAAAAA),
                    fontSize: 24.sp,
                  ),
                ),
                16.hb,
                Container(
                  width: 560.w,
                  height: 200.w,
                  child: _getCarItem(
                    model.mainPhoto,
                    model.modelName,
                    DateUtil.formatDate(
                        DateUtil.getDateTimeByMs(
                            model.createdAt.toInt() * 1000),
                        format: 'yyyy年MM月'),
                    '${model.mileage}万公里',
                    '${NumUtil.divide(num.parse(model.price), 10000)} ',
                  ),
                  decoration: BoxDecoration(
                    color: BaseStyle.colorf6f6f6,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                ),
                50.hb,
              ],
            ),
          ],
        ),
      ),
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
                RichText(
                  text: TextSpan(
                      text: price,
                      style: TextStyle(
                          color: const Color(0xFFFF3E02), fontSize: 32.sp),
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
