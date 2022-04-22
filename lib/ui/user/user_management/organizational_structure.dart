import 'package:cloud_car/ui/home/sort/carlist_page.dart';

import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/cloud_back_button.dart';

typedef TextCallback = Function(String content);

class StructurePage extends StatefulWidget {
  final TextCallback callback;

  const StructurePage({Key? key, required this.callback}) : super(key: key);

  @override
  State<StructurePage> createState() => _StructurePageState();
}

class _StructurePageState extends State<StructurePage> {
  //选中的item
  final List<int> _selectIndex = [];
  //选中的item内容
  // final List<String> _chooseModels = [];
  List moddels = [
    {'title': '门店1'},
    {'title': '门店2'},
    {'title': '门店3'}
  ];
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
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (_selectIndex.contains(index)) {
                    _selectIndex.remove(index);
                  } else {
                    _selectIndex.clear();
                    _selectIndex.add(index);
                  }

                  setState(() {});
                  //print("我点击了：${_selectIndex.first}");
                  widget.callback(moddels[_selectIndex.first]['title'] ?? '');
                  Get.back();
                }, //选中返回数值
                child: ListTile(
                  title: Text(
                    moddels[index]['title'],
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              );
            },
            itemCount: moddels.length,
          ))
        ],
      ),
    );
  }
}
