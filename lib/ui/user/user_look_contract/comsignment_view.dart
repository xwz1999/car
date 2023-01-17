import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../constants/enums.dart';
import '../../../model/contract/consignment_model.dart';
import '../../../widget/choose_widget.dart';
import '../../notice/view_file_page.dart';

class ConsignmentView extends StatefulWidget {
  final EasyRefreshController refreshController;
  final List<ConsignmentModel> consignmentList;

  // final int id;
  const ConsignmentView({
    super.key,
    required this.refreshController,
    required this.consignmentList,
    //required this.id
  });

  @override
  State<ConsignmentView> createState() => _ConsignmentViewState();
}

class _ConsignmentViewState extends State<ConsignmentView>
    with AutomaticKeepAliveClientMixin {
  int _page = 1;
  final int _size = 10;
  // final ScreenshotController _screenshotController = ScreenshotController();
  TextEditingController rejectController = TextEditingController();
  late ContractStatus _releaseCarStatus;

  //bool _onload = true;
  @override
  void initState() {
    _releaseCarStatus = ContractStatus.all;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        SizedBox(
          height: kToolbarHeight + 50.w,
        ),
        ChooseWidget(
          carState: true,
          callBack: (index) {
            _releaseCarStatus = ContractStatus.values[index];
            widget.refreshController.callRefresh();
            setState(() {});
          },
          items: ContractStatus.values.map((e) => e.typeStr).toList(),
          item: _releaseCarStatus.typeStr,
        ),
        //
        Expanded(
            child: EasyRefresh.custom(
                firstRefresh: true,
                controller: widget.refreshController,
                header: MaterialHeader(),
                footer: MaterialFooter(),
                onRefresh: () async {
                  _page = 1;
                  var list = await CarFunc.getConsignmentList(
                      page: _page, size: _size);
                  widget.consignmentList.clear();
                  widget.consignmentList.addAll(list);
                  //_onload = false;
                  setState(() {});
                },
                onLoad: () async {
                  _page++;
                  var baseList = await apiClient.requestList(
                      API.contract.consignmentList,
                      data: {'size': _size, 'page': _page});
                  if (baseList.nullSafetyTotal >
                      widget.consignmentList.length) {
                    widget.consignmentList.addAll(baseList.nullSafetyList
                        .map((e) => ConsignmentModel.fromJson(e))
                        .toList());
                  } else {
                    widget.refreshController.finishLoad(noMore: true);
                  }
                  setState(() {});
                },
                slivers: [
              // SliverToBoxAdapter(
              //   child: 10.hb,
              // ),

              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                var model = widget.consignmentList[index];
                return GestureDetector(
                  onTap: () async {
                    Get.to(() => ViewFilePage(
                          title: '',
                          url: model.essFileUrl != ''
                              ? '${API.imageHost}/${model.essFileUrl}'
                              : '',
                        ));
                    // core.download(url, options);
                    // var docPath=await getApplicationDocumentsDirectory();
                    // String _localPath='${docPath.path}${Platform.pathSeparator}download';
                    // final savedDir=Directory(_localPath);
                    // var response=await Dio().download('
                    // contract/20221215/云云问车车辆寄卖服务协议yDRTvUUgyg308s36UyFlheyREaFYxjbJ.PDF', '');///下载pdf
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
                    child: _getCard(
                      model.id,
                      model.status,
                      '寄卖合同（${model.contractSn}）',
                      model.modelName,
                      model.customerName,
                      model.status < 2
                          ? '/'
                          : DateUtil.formatDateMs(model.signAt.toInt() * 1000,
                              format: 'yyyy-MM-dd'),
                    ),
                  ),
                );
              }, childCount: widget.consignmentList.length))
            ]))
      ],
    );
  }

  _getCard(
      int id, int int, String title, String car, String name, String time) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
      child: Stack(children: [
        Align(
          child: SizedBox(
              width: 686.w,
              height: 350.w,
              child: Image.asset(
                Assets.images.comsignmentBg.path,
                fit: BoxFit.fill,
              )),
        ),
        Positioned(
            top: 40.w,
            left: 32.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.hb,
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                30.hb,
                Row(
                  children: [
                    SizedBox(
                      width: 160.w,
                      child: Text(
                        '交易车辆',
                        style: TextStyle(
                            fontSize: BaseStyle.fontSize28,
                            color: BaseStyle.color666666),
                      ),
                    ),
                    SizedBox(
                      width: 450.w,
                      // child: Flexible(
                      child: Text(
                        car,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    )
                  ],
                ),
                30.hb,
                Row(
                  children: [
                    SizedBox(
                      width: 160.w,
                      child: Text(
                        '寄卖人',
                        style: TextStyle(
                            fontSize: BaseStyle.fontSize28,
                            color: BaseStyle.color666666),
                      ),
                    ),
                    Text(
                      name,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
                30.hb,
                Row(
                  children: [
                    SizedBox(
                      width: 160.w,
                      child: Text(
                        '签订日期',
                        style: TextStyle(
                            fontSize: BaseStyle.fontSize28,
                            color: BaseStyle.color666666),
                      ),
                    ),
                    Text(
                      time,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
                32.hb,
              ],
            )),
        Positioned(
            bottom: 32.w,
            right: 40.w,
            child: Image.asset(
              getUrl(int),
              fit: BoxFit.fill,
              width: 134.w,
              height: 134.w,
            )),
        // Positioned(
        //     bottom: 32.w,
        //     right: 80.w,
        //     child: GestureDetector(
        //       onTap: () {
        //         Alert.show(
        //             context,
        //             NormalContentDialog(
        //               type: NormalTextDialogType.delete,
        //               title: '取消理由',
        //               content: Container(
        //                 padding: EdgeInsets.symmetric(horizontal: 16.w),
        //                 decoration: BoxDecoration(
        //                     color: Colors.grey.withOpacity(0.2),
        //                     borderRadius: BorderRadius.circular(4.w)),
        //                 child: TextField(
        //                   controller: rejectController,
        //                   maxLines: null,
        //                   minLines: 1,
        //                   decoration: const InputDecoration(
        //                     hintText: '请输入',
        //                     border: InputBorder.none,
        //                   ),
        //                 ),
        //               ),
        //               items: const ['取消'],
        //               deleteItem: '确定',
        //               //监听器
        //               listener: (index) {
        //                 Get.back();
        //                 Alert.dismiss(context);
        //               },
        //               deleteListener: () async {
        //                 var res = await apiClient
        //                     .request(API.contract.saleCancel, data: {
        //                   'contractId': id,
        //                   'reason': rejectController.text
        //                 });
        //                 if (res.code == 0) {
        //                   CloudToast.show('取消成功');
        //                   Get.back();
        //                 } else {
        //                   CloudToast.show(res.msg);
        //                 }
        //                 Alert.dismiss(context);
        //               },
        //             ));
        //       },
        //       child: Container(
        //         width: 150.w,
        //         height: 72.w,
        //         padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
        //         alignment: Alignment.center,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(2.w),
        //           color: bgColor,
        //           border:
        //               Border.all(width: 2.w, color: const Color(0xFF027AFF)),
        //         ),
        //         child: Text(
        //           '取消',
        //           style: TextStyle(
        //               fontSize: 28.w,
        //               color: const Color(0xFF027AFF),
        //               fontWeight: FontWeight.w600),
        //         ),
        //       ),
        //     ))
      ]),
    );
  }

  getUrl(int status) {
    switch (ContractStatus.getValue(status).typeNum) {
      case 1:
        return Assets.images.signed.path;
      case 2:
        return Assets.images.sign.path;
      case 3:
        return Assets.images.failure.path;
      case 4:
        return Assets.images.failure.path;
      case 5:
        return Assets.images.failure.path;
      case 6:
        return Assets.images.failure.path;
      case 11:
        return Assets.images.wait.path;
      case 12:
        return Assets.images.signed.path;
      case 13:
        return Assets.images.wait.path;
      default:
        return Assets.images.signed.path;
    }
  }

  @override
  bool get wantKeepAlive => true;
}
