import 'package:cloud_car/ui/home/customer_item.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_back_button.dart';
import 'package:flutter/material.dart';

class UserInvitation extends StatefulWidget {
  const UserInvitation({Key? key}) : super(key: key);

  @override
  _UserInvitationState createState() => _UserInvitationState();
}

class _UserInvitationState extends State<UserInvitation>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<dynamic>? data;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const CloudBackButton(
              isSpecial: true,
            ),
            backgroundColor: kForeGroundColor,
            title: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.only(right: 72.w, top: 30.w),
              unselectedLabelColor: BaseStyle.color999999,
              labelStyle: const TextStyle(
                  color: BaseStyle.color111111, fontWeight: FontWeight.bold),
              indicatorPadding: EdgeInsets.only(right: 72.w, top: 16.w),
              // indicator:
              //     BoxDecoration(borderRadius: BorderRadius.circular(4.w)),
              tabs: [
                _tab(0, '看车邀约'),
                _tab(1, '直卖预约'),
              ],
            )
            //leading:  Container(width: 10.w, child: const CloudBackButton()),
            ),
        backgroundColor: const Color(0xFFF6F6F6),
        extendBody: true,
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 16.w),
                // padding: EdgeInsets.only(top: 10.w),
                itemBuilder: (context, index) {
                  return const CustomerItem();
                },
                separatorBuilder: (_, __) {
                  return SizedBox(
                    height: 16.w,
                  );
                },
                itemCount: 6),
            ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 16.w),
                // padding: EdgeInsets.only(top: 10.w),
                itemBuilder: (context, index) {
                  return const CustomerItem();
                },
                separatorBuilder: (_, __) {
                  return SizedBox(
                    height: 16.w,
                  );
                },
                itemCount: 6),
          ],
        ));
  }

  _tab(int index, String text) {
    return Text(text);
  }
}
