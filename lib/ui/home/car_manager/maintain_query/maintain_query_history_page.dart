

import 'package:cloud_car/ui/home/car_manager/maintain_query/maintain_query_history_detail_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:common_utils/common_utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';


///车辆维保查询
class MaintainQueryHistoryPage extends StatefulWidget {
  const MaintainQueryHistoryPage({super.key});

  @override
  _MaintainQueryHistoryPageState createState() => _MaintainQueryHistoryPageState();
}

class _MaintainQueryHistoryPageState extends State<MaintainQueryHistoryPage> {


  bool _onLoad = true;

  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  List<MaintainHistoryModel> _list = [
    MaintainHistoryModel(title: '奥迪A4L2020款时尚动感型', numb: 'JHRFG34Y8****473', time: '2021-12-01 12:33:43', id: 123),
    MaintainHistoryModel(title: '奥迪Q32018款时尚运动型', numb: 'JHRFG34Y8****473', time: '2021-12-01 12:33:43', id: 123),
    MaintainHistoryModel(title: '奥迪A4L2020款时尚动感型', numb: 'JHRFG34Y8****473', time: '2021-12-01 12:33:43', id: 123),
  ];

  @override
  void dispose() {
    _easyRefreshController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),

        backgroundColor: Colors.white,
        title: Text(
          '维保记录',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      backgroundColor: Colors.white,
      body: EasyRefresh(
      firstRefresh: true,
      header: MaterialHeader(),
      footer: MaterialFooter(),
      controller: _easyRefreshController,
      onRefresh: () async {

        _onLoad = false;
        setState(() {

        });

      },
      onLoad: () async {

      },
      child: _onLoad
          ? const SizedBox()
          : _list.isEmpty
          ? const NoDataWidget(
        text: '暂无客户轨迹信息',
        paddingTop: 300,
      )
          :

      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return _getListItem(index, index < 2,_list[index]);
        },
        itemCount: _list.length,
      ),

      )

    );
  }




  _getListItem(int index, bool ing , MaintainHistoryModel model ) {
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
                    height: 26.w,
                    decoration: const BoxDecoration(
                      color:  kPrimaryColor
                         ,
                    ),
                  )
                      : const SizedBox(),
                  Container(
                    margin: EdgeInsets.only(top: index != 0 ? 0.w : 26.w),
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      color:  kPrimaryColor ,
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                  ),
                  index != _list.length - 1
                      ? Expanded(
                    child: Container(
                      width: 2.w,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: kPrimaryColor ,
                      ),
                    ),
                  )
                      : const SizedBox(),

                ],
              ),
            ),
            30.wb,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.hb,
                Row(
                  children: [
                    Text(
                      '查询车辆维保记录',
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
                      model.time,
                      style: TextStyle(
                        color: const Color(0xFFAAAAAA),
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
                16.hb,

                Container(
                  width: 626.w,
                  height: 200.w,
                  decoration: BoxDecoration(
                    color: BaseStyle.colorf6f6f6,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w,top: 24.w),
                        child: Text(
                          model.title,
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 28.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.w,top: 24.w),
                        child: Text(
                          '车架号：${model.numb}',
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 28.sp,
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          Get.to(()=>const MaintainQueryHistoryDetailPage());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '查看详情',
                              style: TextStyle(
                                color: const Color(0xFF027AFF),
                                fontSize: 28.sp,
                              ),
                            ),
                            24.wb,
                          ],
                        ),
                      ),

                    ],
                  ),
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MaintainHistoryModel{
  int id;
  String time;
  String title;
  String numb;

  MaintainHistoryModel({
    required this.id,
    required this.time,
    required this.title,
    required this.numb,
  });
}

