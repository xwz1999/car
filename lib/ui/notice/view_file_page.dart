import 'package:cloud_car/utils/headers.dart';
import 'package:file_preview/file_preview.dart';
import 'package:flutter/material.dart';

import '../../widget/button/cloud_back_button.dart';

class ViewFilePage extends StatelessWidget {
  final String url;
  final String title;

  const ViewFilePage({Key? key, required this.url, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text(title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34.sp,
                color: const Color(0xFF333333),
              )),
        ),
        backgroundColor: const Color(0xFFF6F6F6),
        extendBody: true,
        body: ListView(
          children: [
            url==''?const SizedBox():
            FilePreviewWidget(
              width: 750.w,
              height: double.infinity,
              path: url,
            ),
          ],
        ));
  }
}
