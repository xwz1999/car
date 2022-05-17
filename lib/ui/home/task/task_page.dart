import 'package:cloud_car/ui/home/task/customer_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/message_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../widget/button/cloud_back_button.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<dynamic>? data;
  bool _isShow = true;

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
    return CloudScaffold(
      systemStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      bodyColor: kForeGroundColor,
      appbar: _getAppbar(),
      extendBody: true,
      body: Expanded(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _isShow
                ? Container(
                    height: 72.w,
                    width: double.infinity,
                    color: const Color(0xFFFFEAE4),
                    child: Row(
                      children: [
                        32.wb,
                        GestureDetector(
                          onTap: () {
                            _isShow = !_isShow;
                            setState(() {});
                          },
                          child: Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.symmetric(
                                vertical: 15.w, horizontal: 20.w),
                            child: Icon(
                              CupertinoIcons.clear,
                              size: 30.w,
                              color: const Color(0xFFFF3B02),
                            ),
                          ),
                        ),
                        Image.asset(
                          Assets.icons.warning.path,
                          width: 35.w,
                          height: 35.w,
                        ),
                        5.wb,
                        Text('点击开启消息通知，不再错过重要消息',
                            style: TextStyle(
                              color: const Color(0xFFFF3B02),
                              fontSize: BaseStyle.fontSize24,
                            )),
                        const Spacer(),
                        Icon(
                          CupertinoIcons.chevron_forward,
                          size: 40.w,
                          color: const Color(0xFFFF3B02),
                        ),
                        32.wb,
                      ],
                    ))
                : const SizedBox(),
            ListView.separated(
                shrinkWrap: true,
                //padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 32.w),
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 10.w),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //Get.to(() => const MessagePage());
                      Get.to(() => const CustomerPage());
                    },
                    child: GestureDetector(
                      child:  MessageItemWidget(
                        time: '01-09 12;22',
                        url: Assets.icons.care.path,
                        tip: '您的购车客户保险将于7天后到期',
                        num: 11,
                        title: '客户关怀提醒',
                        type: TaskType.message,
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) {
                  return Divider(
                    indent: 32.w,
                    endIndent: 32.w,
                    height: 1.w,
                    color: BaseStyle.coloreeeeee,
                  );
                },
                itemCount: 5),
          ],
        ),
      ),
    );
  }

  _getAppbar() {
    return Container(
      color: Colors.white,
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CloudBackButton(
            isSpecial: true,
          ),
          Text('任务中心',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            width: 110.w,
          ),
        ],
      ),
    );
  }
}
