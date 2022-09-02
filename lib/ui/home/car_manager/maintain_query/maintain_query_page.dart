import 'package:cloud_car/model/car/car_distinguish_model.dart';
import 'package:cloud_car/ui/home/car_manager/maintain_query/maintain_query_history_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/scan_license_widget.dart';
import 'package:flutter/material.dart';

///车辆维保查询
class MaintainQueryPage extends StatefulWidget {
  const MaintainQueryPage({super.key});

  @override
  _MaintainQueryPageState createState() => _MaintainQueryPageState();
}

class _MaintainQueryPageState extends State<MaintainQueryPage> {
  CarDistinguishModel? _carInfoModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const MaintainQueryHistoryPage());
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Text(
                      '查询记录',
                      style: TextStyle(
                          color: const Color(0xFF111111),
                          fontSize: BaseStyle.fontSize28),
                    ),
                  ),
                ),
              ],
            ),
          ],
          backgroundColor: const Color(0xFFF6F6F6),
          title: Text(
            '维保查询',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Container(
                width: double.infinity,
                height: 147.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.images.assessmentBg.path),
                      fit: BoxFit.fill),
                ),
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    48.wb,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '车辆维修保养记录查询',
                          style:
                              TextStyle(color: Colors.white, fontSize: 32.sp),
                        ),
                        16.hb,
                        Text(
                          '快速反馈    守护您的车辆交易',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 20.sp),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '¥',
                          style:
                              TextStyle(color: Colors.white, fontSize: 28.sp),
                        ),
                        Text(
                          '1.00',
                          style:
                              TextStyle(color: Colors.white, fontSize: 42.sp),
                        ),
                        Text(
                          '/次',
                          style:
                              TextStyle(color: Colors.white, fontSize: 28.sp),
                        ),
                      ],
                    ),
                    28.wb,
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.w)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -20.w),
                      blurRadius: 10.w,
                      color: const Color(0xFF061D36).withOpacity(0.2),
                    )
                  ]),
              margin: EdgeInsets.only(top: 140.w),
              child: Column(
                children: [
                  ScanLicenseWidget(onLoadComplete: (carInfoModel) {
                    _carInfoModel = carInfoModel;
                    setState(() {});
                  }),
                  32.hb,
                  Container(
                    width: double.infinity,
                    height: 84.w,
                    color: kForeGroundColor,
                    child: GestureDetector(
                      onTap: () async {},
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
                          '开始查询',
                          style: TextStyle(
                              color: kForeGroundColor,
                              fontSize: BaseStyle.fontSize28),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
