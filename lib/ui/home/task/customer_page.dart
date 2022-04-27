import 'package:cloud_car/model/task/task_invite_list_model.dart';
import 'package:cloud_car/ui/home/func/task_func.dart';
import 'package:cloud_car/ui/home/task/customer_invite_item.dart';
import 'package:cloud_car/ui/home/task/task_user_invite_page.dart';

import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../widget/button/cloud_back_button.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  int _page = 1;
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  List<TaskInviteListModel> lists = [];

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
        title: Text('客户付款',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: const Color(0xFFF6F6F6),
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(32.w),
          child: EasyRefresh(
            firstRefresh: true,
            header: MaterialHeader(),
            footer: MaterialFooter(),
            controller: _easyRefreshController,
            onRefresh: () async {
              _page = 1;
              lists = await TaskFunc.getCarList(_page);
              setState(() {});
            },
            onLoad: () async {
              _page++;
              await TaskFunc.getCarList(_page).then((value) {
                if (value.isEmpty) {
                  _easyRefreshController.finishLoad(noMore: true);
                } else {
                  lists.addAll(value);
                  setState(() {});
                }
              });
            },
            child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                // padding: EdgeInsets.only(top: 10.w),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(() => TaskUserInvitePage(
                              model: lists[index],
                            ));
                      },
                      child: CustomerInviteItem(model: lists[index]));
                },
                separatorBuilder: (_, __) {
                  return SizedBox(
                    height: 16.w,
                  );
                },
                itemCount: lists.length),
          ),
        ),
      ),
    );
  }
}
