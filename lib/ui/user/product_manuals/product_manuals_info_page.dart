import 'package:cloud_car/model/user/handbookInfo_model.dart';
import 'package:cloud_car/ui/user/interface/manuals_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class HandbookInfoPage extends StatefulWidget {
  final String name;
  final int itemId;
  const HandbookInfoPage({
    super.key,
    required this.itemId,
    required this.name,
  });

  @override
  State<HandbookInfoPage> createState() => _HandbookInfoPageState();
}

class _HandbookInfoPageState extends State<HandbookInfoPage> {
  late HandbookInfoModel manualsList = const HandbookInfoModel(
      id: 0, name: '', updatedAt: 0, content: '', createdAt: 0);
  late String name;

  // late String startTime;
  // late String endTime;
  late String text;

  @override
  void initState() {
    // startTime = widget.startTime;
    // endTime = widget.endTime;
    //text = widget.text;
    Future.delayed(const Duration(milliseconds: 0), () {
      _refresh();
      setState(() {});
    });
    super.initState();
  }

  _refresh() async {
    manualsList = (await ManualsFunc.getHandbookInfo(widget.itemId))!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CloudScaffold.normal(
      title: manualsList.name,
      barHeight: 88.w,
      extendBody: false,
      body:
          //SizedBox()
          _getItem(manualsList),
    );
  }

  _getItem(HandbookInfoModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.content,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const Spacer(),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Text(
        //       DateUtil.formatDateMs(model.createdAt.toInt() * 1000,
        //           format: 'yyyy-MM-dd'),
        //       style: Theme.of(context).textTheme.subtitle1,
        //     ),
        //     20.wb,
        //   ],
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '更新日期：${DateUtil.formatDateMs(model.updatedAt.toInt() * 1000, format: 'yyyy-MM-dd')}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            20.wb,
          ],
        ),
        40.hb,
      ],
    );
  }
}
