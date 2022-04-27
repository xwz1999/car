import 'package:cloud_car/model/user/roleall_model.dart';

import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';
import '../interface/business_func.dart';

class Permissions extends StatefulWidget {
  const Permissions({Key? key}) : super(key: key);

  @override
  State<Permissions> createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
  @override
  List<RoleallModel> permissions = [];
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () {
      _refresh();
    });
  }

  void _refresh() async {
    permissions = await Business.getRoleall();
    setState(() {});
  }

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
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(right: 10.w),
                      title: Text(
                        permissions[index].name,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      subtitle: Text(
                        permissions[index].describe,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: BaseStyle.color999999),
                      ),
                    ),
                    const Divider()
                  ],
                ),
              );
              ;
            },
            itemCount: permissions.length,
          ))
        ],
      ),
    );
  }
}
