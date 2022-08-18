import 'package:cloud_car/ui/user/user_invitation/direct_sale_view.dart';
import 'package:cloud_car/ui/user/user_invitation/look_at_car_view.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

import '../../../widget/button/cloud_back_button.dart';

class UserInvitationPage extends StatefulWidget {
  const UserInvitationPage({super.key});

  @override
  _UserInvitationPageState createState() => _UserInvitationPageState();
}

class _UserInvitationPageState extends State<UserInvitationPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();

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
            title: TabBar(
              onTap: (index) {
                setState(() {});
              },
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
          children: const [
            LookAtCarView(),
            DirectSaleView(),
          ],
        ));
  }

  _tab(int index, String text) {
    return Text(text);
  }

  @override
  bool get wantKeepAlive => true;
}
