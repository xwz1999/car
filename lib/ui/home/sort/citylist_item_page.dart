import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

import '../../../model/region/china_region_model.dart';
import '../../../widget/button/cloud_back_button.dart';

typedef CityCallback = Function(ChinaRegionModel model);

class CityListItemPage extends StatefulWidget {
  final CityCallback cityCallback;
  final String cityName;
  final List<ChinaRegionModel> cityList;

  const CityListItemPage(
      {super.key,
      required this.cityCallback,
      required this.cityList,
      required this.cityName});

  @override
  _CityListItemPageState createState() => _CityListItemPageState();
}

class _CityListItemPageState extends State<CityListItemPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text(
          widget.cityName,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      backgroundColor: kForeGroundColor,
      body: ListView.builder(
        itemCount: widget.cityList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              widget.cityCallback(widget.cityList[index]);
              print(widget.cityList[index].id);
              Get.back();
              // print(widget.cityList[index].id);
              // print(widget.cityList[index].name);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
              height: 80.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cityList[index].name,
                    style:
                        TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w400),
                  ),
                  const Divider(
                    color: Colors.black38,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
