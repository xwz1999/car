
import 'package:cloud_car/model/user/storeselect_moedl.dart';
import 'package:cloud_car/ui/user/interface/business_func.dart';
import 'package:cloud_car/ui/user/user_management/add_stores_page.dart';
import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';

typedef TextCallback = Function(String content, int id);

class StructurePage extends StatefulWidget {
  final TextCallback callback;

  const StructurePage({super.key, required this.callback});

  @override
  State<StructurePage> createState() => _StructurePageState();
}

class _StructurePageState extends State<StructurePage> {
  final List<int> _selectIndex = [];

  List<StoreselectMoedl> moddels = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () {
      _refresh();
    });
  }

  _refresh() async {
    moddels = await BusinessFunc.getStoreselect();
    setState(() {});
  }

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
                onTap: () async{
                 await Get.to(() => const AddStoresPage());
                  _refresh();
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
                  widget.callback(moddels[_selectIndex.first].name,
                      moddels[_selectIndex.first].id);
                  Get.back();
                }, //选中返回数值
                child: ListTile(
                  title: Text(
                    moddels[index].name,
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
