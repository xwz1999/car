import 'package:cloud_car/model/user/lists_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class PushCarDraftPage extends StatefulWidget {
  const PushCarDraftPage({super.key});

  @override
  _PushCarDraftPageState createState() => _PushCarDraftPageState();
}

class _PushCarDraftPageState extends State<PushCarDraftPage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  bool _onLoad = true;
  late List<ListsModel> _consignmentList;
  @override
  void initState() {
    super.initState();
    _consignmentList = [];
  }

  @override
  void dispose() {
    super.dispose();
    _easyRefreshController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('草稿箱',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body:Expanded(
        child: EasyRefresh(
          firstRefresh: true,
          header: MaterialHeader(),
          footer: MaterialFooter(),
          controller: _easyRefreshController,
          onRefresh: () async {

            _onLoad = false;
            setState(() {});
          },
          child: _onLoad
              ? const SizedBox()
              : _consignmentList.isEmpty
              ? const NoDataWidget(
            text: '暂无相关车辆信息',
            paddingTop: 300,
          )
              : ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return _getCar(_consignmentList[index]);
              },
              itemCount: _consignmentList.length),
        ),
      ),
    );
  }


  _getCar(ListsModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      child: GestureDetector(
        onTap: () {

        },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
            decoration: BoxDecoration(
                color: kForeGroundColor,
                borderRadius: BorderRadius.circular(16.w)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: Text(
                    model.status == 3 && model.auditStatus == 3
                        ? '已驳回'
                        : model.statusEnum.str,
                    style: TextStyle(
                        color: getColor(
                          model,
                        ),
                        fontSize: BaseStyle.fontSize28),
                  ),
                ),
                12.hb,
                Row(
                  children: [
                    SizedBox(
                      width: 196.w,
                      height: 150.w,
                      child: CloudImageNetworkWidget.car(
                        urls: [model.carPhoto],
                      ),
                    ),
                    20.wb,
                    SizedBox(
                      width: 406.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(model.modeName,
                              style: TextStyle(
                                  fontSize: BaseStyle.fontSize28,
                                  color: BaseStyle.color111111)),
                          32.hb,
                          Padding(
                            padding: EdgeInsets.only(right: 16.w),
                            child: getText(
                                DateUtil.formatDateMs(
                                    model.licensingDate.toInt() * 1000,
                                    format: 'yyyy年MM月'),
                                '${model.mileage}万公里'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                32.hb,
                Padding(
                  padding: EdgeInsets.only(left: 452.w),
                  child: GestureDetector(
                    onTap: () async{

                    },
                    child: Container(
                        width: 168.w,
                        height: 68.w,
                        padding:
                        EdgeInsets.only(left: 28.w, top: 14.w),
                        decoration: BoxDecoration(
                            color: const Color(0xFF027AFF),
                            borderRadius: BorderRadius.circular(8.w)),
                        child: Text(
                          '发布车辆',
                          style: TextStyle(
                              color: kForeGroundColor,
                              fontSize: BaseStyle.fontSize28),
                        )),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Color getColor(ListsModel model) {
    if (model.status == 0) {
      return const Color(0xFF666666);
    } else if (model.status == 3) {
      if (model.auditStatus == 3) {
        return Colors.red;
      } else {
        return const Color(0xFFFE8029);
      }
    } else {
      return const Color(0xFF027AFF);
    }
  }

  getText(String time, String distance) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            time,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        ),
        16.wb,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            distance,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        )
      ],
    );
  }

}
