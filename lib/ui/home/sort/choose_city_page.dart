import 'package:cloud_car/ui/home/sort/citylist_page.dart';

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';

import 'package:flutter/material.dart';

import '../../../model/region/china_region_model.dart';

typedef CityCallback = Function(ChinaRegionModel model);

class ChooseCityPage extends StatefulWidget {
  final CityCallback callback;

  const ChooseCityPage({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  _ChooseCityPageState createState() => _ChooseCityPageState();
}

class _ChooseCityPageState extends State<ChooseCityPage> {
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
        title: Text('定位筛选',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34.sp,
              color: const Color(0xFF333333),
            )),
      ),
      backgroundColor: const Color(0xFFF6F6F6),
      extendBody: true,
      body: CityListPage(cityCallback: (model) {
        widget.callback(model);
      }),
    );
  }
}
