import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  late final bool _isVoice = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text('李晓丽',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: bodyColor,
        body: Stack(
          children: [
            ListView(
              children: [Row()],
            ),
            Container(
                color: kForeGroundColor,
                height: 98.w,
                child: Row(
                  children: [
                    32.wb,
                    SizedBox(
                      width: 48.w,
                      height: 48.w,
                      child: Image.asset(_isVoice
                          ? Assets.icons.voice.path
                          : Assets.icons.keyboard.path),
                    ),
                    16.wb,
                    _isVoice
                        ? Container(
                            width: 558.w,
                            height: 72.w,
                            decoration: BoxDecoration(
                                color: BaseStyle.colorf6f6f6,
                                borderRadius: BorderRadius.circular(8.w)),
                            child: const TextField(
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 15),
                                  hintText: '发消息····',
                                  border: InputBorder.none),
                            ),
                          )
                        : GestureDetector(
                            child: Container(
                                width: 558.w,
                                height: 72.w,
                                decoration: BoxDecoration(
                                    color: BaseStyle.colorf6f6f6,
                                    borderRadius: BorderRadius.circular(8.w)),
                                child: Text(
                                  '按住 说话',
                                  style: TextStyle(
                                      color: BaseStyle.color666666,
                                      fontSize: BaseStyle.fontSize32),
                                )),
                          ),
                    16.wb,
                    SizedBox(
                      width: 48.w,
                      height: 48.w,
                      child: Image.asset(Assets.icons.file.path),
                    ),
                  ],
                )),
          ],
        ));
  }
}
