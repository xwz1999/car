import 'package:cloud_car/model/user/HandbookInfo_model.dart';
import 'package:cloud_car/ui/user/interface/manuals_func.dart';

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flustars/flustars.dart';
// import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

//typedef ManualsBack = Function(int id);

class HandbookInfo extends StatefulWidget {
  //final ManualsBack manualsBack;
  final String name;
  final int id;
  // final String text;
  // final String startTime;
  // final String endTime;
  const HandbookInfo({
    Key? key,
    //required this.manualsBack,
    required this.id,
    required this.name,
    // required this.endTime,
    // required this.startTime,
    // required this.text,
  }) : super(key: key);

  @override
  State<HandbookInfo> createState() => _HandbookInfoState();
}

class _HandbookInfoState extends State<HandbookInfo> {
  List<HandbookInfoModel> manualsList = [];
  late String name;
  late int manualsId;
  // late String startTime;
  // late String endTime;
  late String text;

  @override
  @override
  void initState() {
    super.initState();
    name = widget.name;
    manualsId = widget.id;
    // startTime = widget.startTime;
    // endTime = widget.endTime;
    //text = widget.text;
    Future.delayed(const Duration(milliseconds: 0), () {
      product();
    });
    super.initState();
  }

  product() async {
    manualsList = await Handbook.getHandbookInfo(manualsId);
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
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 32.sp,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: manualsList.isEmpty ? const SizedBox() : getItem(manualsList.first),
    );
  }

  getItem(HandbookInfoModel model) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            //widget.manualsBack(model.id);
          },
        ),
        Text(
          model.content,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          DateUtil.formatDateMs(model.createdAt.toInt() * 1000,
              format: 'yyyy-MM-dd'),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          DateUtil.formatDateMs(model.updateAt.toInt() * 1000,
              format: 'yyyy-MM-dd'),
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
