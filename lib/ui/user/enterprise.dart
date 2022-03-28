import 'package:cloud_car/utils/headers.dart';

import 'package:flutter/material.dart';
import '../../widget/button/cloud_back_button.dart';

class EnterprisePage extends StatefulWidget {
  EnterprisePage({Key? key}) : super(key: key);

  @override
  State<EnterprisePage> createState() => _EnterprisePageState();
}

class _EnterprisePageState extends State<EnterprisePage> {
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
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: const Color(0xFFF6F6F6),
      extendBody: true,
      body: Container(
        color: Colors.white,
        height: 600.w,
        margin: EdgeInsets.only(top: 16.w),
        child: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
            ListTile(
              title: Text(
                '企业',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: Text(
                '云云问车',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: BaseStyle.color999999),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '门店',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: Text('门店1',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: BaseStyle.color999999)),
              onTap: () {},
            ),
            ListTile(
              onTap: () {},
              title: Text(
                '部门',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: Text('销售部',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: BaseStyle.color999999)),
            ),
            ListTile(
              title: Text('门店地址', style: Theme.of(context).textTheme.bodyText1),
              subtitle: Text(
                '浙江省宁波市海曙区宁波保险科技产业园1号楼601-3',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: BaseStyle.color999999),
              ),
            ),
          ]).toList(),
        ),
      ),
    );
  }
}
