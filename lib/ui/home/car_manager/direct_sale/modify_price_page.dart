import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/user/success_failure_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/material.dart';

///调价页面
class ModifyPricePage extends StatefulWidget {
  const ModifyPricePage({super.key});

  @override
  _ModifyPricePageState createState() => _ModifyPricePageState();
}

class _ModifyPricePageState extends State<ModifyPricePage>
    with SingleTickerProviderStateMixin {
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
            '调价',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        backgroundColor: kForeGroundColor,
        extendBody: true,
        body: Padding(
          padding: EdgeInsets.only(right: 32.w),
          child: Column(
            children: [
              EditItemWidget(
                title: '展示价格',
                value: '27.65',
                callback: (String content) {},
                endText: '万元',
                topIcon: false,
              ),
              EditItemWidget(
                title: '系统估价',
                value: '26.12',
                callback: (String content) {},
                endText: '把',
                topIcon: false,
                canChange: false,
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
                              '是否确认提交调价申请？',
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
                        deleteListener: () {
                          Alert.dismiss(context);
                          Get.off(() => SuccessFailurePage(
                              conditions: true,
                              headline: '调价',
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
}
