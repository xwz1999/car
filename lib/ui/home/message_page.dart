import 'package:cloud_car/ui/home/chat_screen_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_back_button.dart';
import 'package:cloud_car/widget/message_item_widget.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<dynamic>? data;

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
        title: Text('客户消息',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: GestureDetector(
        onTap: (() {
          Get.to(() => const ChartPage());
        }),
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                //padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 32.w),
                padding: EdgeInsets.only(top: 10.w),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: MessageItemWidget(
                      time: '01-09 12;22',
                      url: Assets.icons.customerCare.path,
                      tip:
                          '你好，多少钱你好，多少钱你好，多少钱你好，多少钱你好，多少钱你好，多少钱你好，多少钱你好，多少钱你好，多少钱你好，多少钱',
                      num: 101,
                      title: '李小里',
                      type: TaskType.message,
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
                itemCount: 6),
          ],
        ),
      ),
    );
  }
}
