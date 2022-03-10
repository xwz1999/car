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


        backgroundColor: const Color(0xFFF6F6F6),
        extendBody: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                primary: false,
                floating: false,
                pinned: true,
                snap: false,
                elevation: 0,
                toolbarHeight: MediaQuery
                    .of(context)
                    .padding
                    .top + kToolbarHeight,
                expandedHeight: 750.w,
                leadingWidth: 0,
                titleSpacing: 0,
                title: Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: EdgeInsets.only(top: MediaQuery
                      .of(context)
                      .padding
                      .top),
                  height: kToolbarHeight + MediaQuery
                      .of(context)
                      .padding
                      .top,
                  child: Row(
                    children: [
                      const CloudBackButton(),
                      30.wb,
                      Text('李四')
                    ],
                  ),
                ),
                leading: SizedBox(),
                // collapsedHeight:kToolbarHeight,
                backgroundColor: const Color(0xFFF6F6F6),
                flexibleSpace: FlexibleSpaceBar(

                  titlePadding: EdgeInsets.zero,

                  background: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    //
                    //height: double.infinity,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        165.hb,
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white
                          ),
                          margin: EdgeInsets.only(left: 32.w,
                              right: 32.w,
                              top: 24.w,
                              ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 32.w, vertical: 24.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('浏览客户', style: TextStyle(
                                  color: BaseStyle.color333333,
                                  fontSize: BaseStyle.fontSize32,
                                  fontWeight: FontWeight.bold),),
                              16.hb,
                              _getText('手机号', '11209381209380'),
                              16.hb,
                              _getText('微信号', '1122133'),
                              16.hb,
                              _getText('跟进时间', '2021-01-01 12：22：00'),
                              16.hb,
                              _getText('客户来源', '微信小程序'),
                              16.hb,
                              _getText('注册时间', '2021-01-01 12：22：00'),
                              16.hb,
                              _getText('销售', '张三', ),

                            ],
                          ),
                        ),
                        50.hb,
                      ],
                    ),
                  ),

                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child:
                  Container(
                    height: kToolbarHeight,
                    width: double.infinity,
                    color: Colors.white,
                    child: TabBar(
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
                        indicator: const BoxDecoration(),
                        indicatorColor: kPrimaryColor,
                        tabs: [
                          _tab(0, '浏览车辆'),
                          _tab(1, '客户轨迹'),
                          _tab(2, '相关资料')
                        ]),
                  ),
                )
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
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
        ),
        bottomNavigationBar:Container(
          color: Colors.white,
          height: 120.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: _getBottom(Assets.icons.icPhone.path,'电话')),
              Expanded(child: _getBottom(Assets.icons.icWx.path,'微信')),
              Expanded(child: _getBottom(Assets.icons.icInvite.path,'发起邀约')),
              Expanded(child: _getBottom(Assets.icons.icContract.path,'发起合同')),
            ],
          ),
        )
    );
  }


  _getBottom(String url,String text){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(url,width: 56.w,height: 56.w,),

          Text(text,style: TextStyle(color: BaseStyle.color333333,fontSize: 24.sp),)

        ],
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
