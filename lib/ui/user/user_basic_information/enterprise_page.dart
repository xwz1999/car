import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

import '../../../widget/button/cloud_back_button.dart';

class EnterprisePage extends StatefulWidget {
  const EnterprisePage({super.key});

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
        color: bodyColor,
        margin: EdgeInsets.only(top: 16.w),
        child: ColoredBox(
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
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
              Padding(
                padding: EdgeInsets.only(left: 32.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.hb,
                    Text('门店地址', style: Theme.of(context).textTheme.bodyText1),
                    24.hb,
                    Text(
                      '浙江省宁波市海曙区宁波保险科技产业园1号楼601-3',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: BaseStyle.color999999),
                    ),
                    24.hb,
                  ],
                ),
              )
            ]).toList(),
          ),
        ),
      ),
    );
  }
}
