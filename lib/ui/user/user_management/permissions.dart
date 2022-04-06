import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';

class Permissions extends StatefulWidget {
  const Permissions({Key? key}) : super(key: key);

  @override
  State<Permissions> createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('权限详情',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),

        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: kForeGroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
            ListTile(
              contentPadding: EdgeInsets.only(right: 10.w),
              title: Text(
                '销售员',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                '能够查看全店的车，并进行客户跟进、销售下单',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: BaseStyle.color999999),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(right: 10.w),
              title: Text(
                '评估师/车务',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                '负责录入车辆信息、编辑店里的车辆',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: BaseStyle.color999999),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(right: 10.w),
              title: Text(
                '销售/车务',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                '可以录入车辆信息、编辑车辆，并进行客户跟',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: BaseStyle.color999999),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(right: 10.w),
              title: Text(
                '店长',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                '能够管理店内的客户、车辆、订单',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: BaseStyle.color999999),
              ),
            )
          ]).toList(),
        ),
      ),
    );
  }
}
