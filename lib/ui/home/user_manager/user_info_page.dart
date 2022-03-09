
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget {

  const UserInfoPage({
    Key? key,
  }) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;


  late String _selfText = '';

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);

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
          actions: [
            GestureDetector(
              onTap: () {
                //Get.to(() => const SearchPage());
              },
              child: Text('设为重要',style: TextStyle(color: BaseStyle.color999999,fontSize: BaseStyle.fontSize28),),
            ),
            20.wb,
          ],
          backgroundColor: kForeGroundColor,
          title: Text('客户统计',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
        ),

        backgroundColor: const Color(0xFFF6F6F6),
        extendBody: true,
        body:CustomScrollView(
          slivers: [
            // SliverAppBar(
            //   title: Container(
            //     color: Colors.white,
            //     child: TabBar(
            //         onTap: (index) {
            //
            //           setState(() {});
            //         },
            //         isScrollable: true,
            //         labelPadding:
            //         EdgeInsets.symmetric(vertical: 10.w, horizontal: 40.w),
            //         controller: _tabController,
            //         indicatorWeight: 3,
            //         labelColor: BaseStyle.color111111,
            //         unselectedLabelColor: BaseStyle.color999999,
            //         indicatorPadding:
            //         EdgeInsets.symmetric(horizontal: 30.w, vertical: 0.w),
            //         indicatorSize: TabBarIndicatorSize.label,
            //         labelStyle: TextStyle(
            //           color: Colors.white.withOpacity(0.85),
            //         ),
            //         indicatorColor: kPrimaryColor,
            //         tabs: [_tab(0, '标准版'), _tab(1, '简洁版'), _tab(2, '自定义版')]),
            //   ),
            //     expandedHeight: 440.w,
            //     flexibleSpace:FlexibleSpaceBar(
            //
            //       width: double.infinity,
            //       padding: EdgeInsets.symmetric(horizontal: 20.w),
            //       height: 440.w,
            //       color: Colors.red,
            //     )
            //
            // )
            SliverAppBar(
              pinned: true,
              expandedHeight: 600.w,
              leading: SizedBox(),
              backgroundColor: const Color(0xFFF6F6F6),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                titlePadding:EdgeInsets.zero,

                background:   Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 32.w,right:32.w,top: 24.w,bottom: 100.w),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      16.hb,
                      _getText('车架号', 'GDL26173890989890'),
                      16.hb,
                      _getText('车架号', 'GDL26173890989890'),
                      16.hb,
                      _getText('车架号1', 'GDL26173890989890'),
                      16.hb,
                      _getText('车架号', 'GDL26173890989890'),
                      16.hb,
                      _getText('车架号', 'GDL26173890989890'),
                      16.hb,
                      _getText('车架号', 'GDL26173890989890', isRed: true),
                      50.hb,
                    ],
                  ),
                ),

              ),
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(50.w),
                    child:
                    TabBar(
                        onTap: (index) {

                          setState(() {});
                        },
                        isScrollable: true,
                        labelPadding:
                        EdgeInsets.symmetric(vertical: 10.w, horizontal: 40.w),
                        controller: _tabController,
                        indicatorWeight: 3,
                        labelColor: BaseStyle.color111111,
                        unselectedLabelColor: BaseStyle.color999999,
                        indicatorPadding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 0.w),
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                        ),
                        indicatorColor: kPrimaryColor,
                        tabs: [_tab(0, '标准版'), _tab(1, '简洁版'), _tab(2, '自定义版')]),
                )
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                        (BuildContext context,  int index) {
                      return Card(
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          color: Colors.primaries[(index % 18)],
                          child: Text(''),
                        ),
                      );
                    },
                    childCount: 80
                )
            )
          ],
        )
    );
  }


  _tab(int index, String text) {
    return Text(text);
  }


  _getText(String title, String content, {bool isRed = false}) {
    return Row(

      children: [
        SizedBox(
          width: 120.w,
          child: Text(
            title,
            style: TextStyle(fontSize: 28.sp, color: BaseStyle.color666666),
          ),
        ),
        20.wb,
        Text(
          content,
          style: TextStyle(
            fontSize: 28.sp,
            color: isRed ? const Color(0xFFFF3B02) : BaseStyle.color333333,
          ),
        ),
      ],
    );
  }
}
