import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:flutter/material.dart';

///车辆维保查询详情
class MaintainQueryHistoryDetailPage extends StatefulWidget {
  const MaintainQueryHistoryDetailPage({super.key});

  @override
  _MaintainQueryHistoryDetailPageState createState() =>
      _MaintainQueryHistoryDetailPageState();
}

class _MaintainQueryHistoryDetailPageState extends State<MaintainQueryHistoryDetailPage> {


  final List<MaintainHistoryDetailModel> _list = [
    MaintainHistoryDetailModel(
        id: 123,
        project: '保养',
        material: '润滑油，滤芯，机油，精洗油',
        describe: '定期保养-1.8T/2.0T,检查开热风有异味，无异常',
        time: '2017-12-13'),
    MaintainHistoryDetailModel(
        id: 123,
        project: '保养',
        material: '润滑油，滤芯，机油，精洗油',
        describe: '定期保养-1.8T/2.0T,检查开热风有异味，无异常',
        time: '2017-12-13'),
    MaintainHistoryDetailModel(
        id: 123,
        project: '保养',
        material: '润滑油，滤芯，机油，精洗油',
        describe: '定期保养-1.8T/2.0T,检查开热风有异味，无异常',
        time: '2017-12-13'),
    MaintainHistoryDetailModel(
        id: 123,
        project: '保养',
        material: '润滑油，滤芯，机油，精洗油',
        describe: '定期保养-1.8T/2.0T,检查开热风有异味，无异常',
        time: '2017-12-13'),
    MaintainHistoryDetailModel(
        id: 123,
        project: '保养',
        material: '润滑油，滤芯，机油，精洗油',
        describe: '定期保养-1.8T/2.0T,检查开热风有异味，无异常',
        time: '2017-12-13'),
    MaintainHistoryDetailModel(
        id: 123,
        project: '保养',
        material: '润滑油，滤芯，机油，精洗油',
        describe: '定期保养-1.8T/2.0T,检查开热风有异味，无异常',
        time: '2017-12-13'),
    MaintainHistoryDetailModel(
        id: 123,
        project: '保养',
        material: '润滑油，滤芯，机油，精洗油',
        describe: '定期保养-1.8T/2.0T,检查开热风有异味，无异常',
        time: '2017-12-13'),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: const Color(0xFFF6F6F6),
          title: Text(
            '维保记录',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        backgroundColor: const Color(0xFFF6F6F6),
        body:  ListView(

          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 32.w),
              child: Container(
                width: double.infinity,
                height: 172.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF134069),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    32.wb,
                    Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.w)
                      ),
                       width: 80.w,
                       height: 80.w,
                       clipBehavior:Clip.antiAlias,
                      child:Image.asset(Assets.images.carPlaceholder.path,fit: BoxFit.fill,)
                    ),
                    32.wb,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '奥迪A4L2020款时尚动感型',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        32.hb,
                        Text(
                          'VIN：JHRFG34Y8****4736',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.sp,
                          ),
                        ),
                      ],
                    )
                    
                  ],
                ),
              ),
            ),


            Padding(
              padding:  EdgeInsets.symmetric(vertical: 28.w,horizontal: 32.w),
              child: Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.w)

                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical:26.w,horizontal: 32.w ),
                          child: Text(
                            '车辆维保记录',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF333333),
                              fontSize: 32.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: const Color(0xFFF6F6F6),height: 2.w,thickness: 2.w, ),
                    _list.isEmpty
                            ? const NoDataWidget(
                                text: '暂无客户轨迹信息',
                                paddingTop: 300,
                              )
                            : ListView.builder(
                      shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemBuilder: (BuildContext context, int index) {
                                  return _getListItem(index, index < 2, _list[index]);
                                },
                                itemCount: _list.length,
                              ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  _getListItem(int index, bool ing, MaintainHistoryDetailModel model) {
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
                          height: 20.w,
                          decoration: const BoxDecoration(
                            color: kPrimaryColor,
                          ),
                        )
                      : const SizedBox(),
                  Container(
                    margin: EdgeInsets.only(top: index != 0 ? 0.w : 20.w),
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                  ),
                  index != _list.length - 1
                      ? Expanded(
                          child: Container(
                            width: 2.w,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              color: kPrimaryColor,
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
                Text(
                  model.time,
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
                16.hb,
                Container(
                  width: 576.w,
                 padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: BaseStyle.colorf6f6f6,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "项目：",
                          style: TextStyle(color: const Color(0xFF333333), fontSize: 28.sp, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan( text: model.project,
                              style:TextStyle(color: const Color(0xFF333333), fontSize: 28.sp,fontWeight:FontWeight.normal))
                          ]
                        ),
                      ),
                      8.hb,
                      RichText(
                        text: TextSpan(
                            text: "描述：",
                            style: TextStyle(color: const Color(0xFF333333), fontSize: 28.sp, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan( text: model.describe,
                                style:TextStyle(color: const Color(0xFF333333), fontSize: 28.sp, fontWeight:FontWeight.normal),)
                            ]
                        ),
                      ),
                      8.hb,
                      RichText(
                        text: TextSpan(
                            text: "材料：",
                            style: TextStyle(color: const Color(0xFF333333), fontSize: 28.sp, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan( text: model.material,
                                style: TextStyle(color: const Color(0xFF333333), fontSize: 28.sp,fontWeight:FontWeight.normal),)
                            ]
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

class MaintainHistoryDetailModel {
  int id;
  String time;
  String project;
  String describe;
  String material;

  MaintainHistoryDetailModel({
    required this.id,
    required this.time,
    required this.project,
    required this.describe,
    required this.material,
  });
}
