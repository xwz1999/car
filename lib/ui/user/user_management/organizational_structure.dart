import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/cloud_back_button.dart';

class StructurePage extends StatefulWidget {
  const StructurePage({Key? key}) : super(key: key);

  @override
  State<StructurePage> createState() => _StructurePageState();
}

class _StructurePageState extends State<StructurePage> {

  //  for (var i = 0; i < 5; i++)
  //               {
  //                 CatWidget.add(ListTile(
  //                   title: Text('门店$i'),
  //                 ));
  //               }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('企业信息',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  //Get.to(() => Permissions());
                },
                child: Text(
                  '新增门店',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: BaseStyle.color111111),
                ),
              ),
              32.wb,
            ],
          )
        ],
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: kForeGroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 600.w),
            child: Text(
              '云云问车',
              style: TextStyle(
                  fontSize: BaseStyle.fontSize24,
                  color: const Color(0xFF999999)),
            ),
          ),
          24.hb,
          SizedBox(
            child: Column(children: [
              ListTile(
                title: Text(
                  '门店1',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              ListTile(
                title: Text(
                  '门店1',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              ListTile(
                title: Text(
                  '门店1',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
