import 'dart:io';

import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/user/success_failure_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/picker/image_pick_widget/multi_image_pick_widget.dart';
import 'package:flutter/material.dart';

///下架退库页面
class OffCarPage extends StatefulWidget {
  final int carId;

  const OffCarPage({super.key, required this.carId});

  @override
  _OffCarPageState createState() => _OffCarPageState();
}

class _OffCarPageState extends State<OffCarPage>
    with SingleTickerProviderStateMixin {
  List<File> _images = [];

  @override
  void initState() {
    super.initState();
  }

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
          backgroundColor: kForeGroundColor,
          title: Text(
            '下架/退库',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        backgroundColor: kForeGroundColor,
        extendBody: true,
        body: Padding(
          padding: EdgeInsets.only(right: 32.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 32.w),
                child: EditItemWidget(
                  title: '退库理由',
                  value: '',
                  callback: (String content) {},
                  tips: '请输入退库理由',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.hb,
                  Row(
                    children: [
                      32.wb,
                      Padding(
                        padding: EdgeInsets.only(top: 15.w),
                        child: Text(
                          '*  ',
                          style: TextStyle(
                            fontSize: 28.sp,
                            color: const Color(0xFFE62222),
                          ),
                        ),
                      ),
                      Text(
                        '凭证截图',
                        style: TextStyle(
                          fontSize: 28.sp,
                          color: const Color(0xFF999999),
                        ),
                      ),
                      Text(
                        ' (请上传JPG或PDF格式)',
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: const Color(0xFF999999),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: MultiImagePickWidget(onChanged: (files) {
                      _images = files.cast<File>().toList();
                    }),
                  ),
                ],
              ),
              200.hb,
              GestureDetector(
                onTap: () {
                  Alert.show(
                      context,
                      NormalContentDialog(
                        type: NormalTextDialogType.delete,
                        title: '提交确认',
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            16.hb,
                            Text(
                              '是否确认提交下架申请？',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                        items: const ['取消'],
                        deleteItem: '发起',
                        //监听器
                        listener: (index) {
                          Alert.dismiss(context);
                        },
                        deleteListener: () async {
                          Alert.dismiss(context);
                          var cancel = CloudToast.loading;
                          //var imgUrls = <String>[];
                          if (_images.isNotEmpty) {
                            await apiClient.uploadImages(_images);
                          }
                          var res = await apiClient.request(API.car.offShelf,
                              data: {"carId": widget.carId});
                          if (res.code == 0) {
                            cancel();
                            Get.off(() => SuccessFailurePage(
                                conditions: true,
                                headline: '下架/退库',
                                body: Text(
                                  '提交成功，等待平台审核',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                bottom: CloudBottomButton(
                                  onTap: () {
                                    Get.back();
                                  },
                                  text: '返回汽车详情',
                                )));
                          }
                          cancel();
                        },
                      ));
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
                    '提交',
                    style: TextStyle(
                        color: kForeGroundColor,
                        fontSize: BaseStyle.fontSize28),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  getItem(
    String path,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              path,
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
