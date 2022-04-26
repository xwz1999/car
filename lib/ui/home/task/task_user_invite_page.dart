
import 'package:cloud_car/ui/home/car_manager/Initiate_contract_page.dart';
import 'package:cloud_car/ui/home/car_manager/invite_detail_page.dart';
import 'package:cloud_car/ui/home/user_manager/customers_browse_page.dart';
import 'package:cloud_car/ui/home/user_manager/customers_trajectory_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

class TaskUserInvitePage extends StatefulWidget {
  final int id;
  const TaskUserInvitePage({Key? key, required this.id}) : super(key: key);

  @override
  _TaskUserInvitePageState createState() => _TaskUserInvitePageState();
}

class _TaskUserInvitePageState extends State<TaskUserInvitePage>  with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isImportant = false;

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
      appBar: AppBar(
        leading: const CloudBackButton(),
        backgroundColor: Colors.white,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('李四'),
          ],
        ),
        titleSpacing: 0,

        actions: [
          _isImportant?GestureDetector(
            onTap: (){
              _isImportant = false;
              setState(() {

              });
            },
            child: Image.asset(
              Assets.images.importantUser.path,
              width: 130.w,
              fit: BoxFit.fitWidth,
            ),
          ):
          GestureDetector(
            onTap: (){
              _isImportant = true;
              setState(() {

              });
            },
            child: Padding(
              padding:  EdgeInsets.only(right: 32.w),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  '设为重要',
                  style: TextStyle(
                    color: BaseStyle.color999999,
                    fontSize: BaseStyle.fontSize28,),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: kToolbarHeight - 10.w,
            width: double.infinity,
            child: TabBar(
                onTap: (index) {
                  setState(() {});
                },
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(
                    vertical: 10.w, horizontal: 40.w),
                controller: _tabController,
                indicatorWeight: 3,
                labelColor: kPrimaryColor,
                unselectedLabelColor: BaseStyle.color333333,
                indicatorPadding: EdgeInsets.symmetric(
                    horizontal: 30.w, vertical: 0.w),
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
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                        color: BaseStyle.colordddddd, width: 2.w))),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(bottom: 120.w),
              child: TabBarView(
                controller: _tabController,
                children: [
                  CustomersBrowsePage(id: widget.id,),
                  CustomersTrajectoryPage(id: widget.id,),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          index == 0
                              ? Container(
                            width: double.infinity,
                            height: 40.w,
                            color: Colors.white,
                          )
                              : const SizedBox(),
                          _getListItem(index, index < 2),
                        ],
                      );
                    },
                    itemCount: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 120.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: _getBottom(Assets.icons.icPhone.path, '电话', () {
                    Alert.show(
                        context,
                        NormalContentDialog(
                          type: NormalTextDialogType.delete,
                          content: RichText(
                            text: TextSpan(
                                text: '是否拨打电话',
                                style: TextStyle(
                                    color: BaseStyle.color333333,
                                    fontSize: BaseStyle.fontSize28),
                                children: [
                                  TextSpan(
                                    text: '[1289038123093]',
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: BaseStyle.fontSize28),
                                  ),
                                  TextSpan(
                                    text: '?',
                                    style: TextStyle(
                                        color: BaseStyle.color333333,
                                        fontSize: BaseStyle.fontSize28),
                                  ),
                                ]),
                          ),
                          items: const ['取消'],
                          listener: (index) {
                            Alert.dismiss(context);
                          },
                          deleteListener: () {
                            Alert.dismiss(context);
                          },
                          title: '呼出提示',
                          deleteItem: '确定',
                        ));
                  })),
              Expanded(child: _getBottom(Assets.icons.icWx.path, '微信', () {})),
              Expanded(
                  child: _getBottom(Assets.icons.icInvite.path, '发起邀约', () {
                    Get.to(() => const InviteDetailPage());
                  })),
              Expanded(
                  child: _getBottom(Assets.icons.icContract.path, '发起合同', () {
                    Get.to(() => const InitiateContractPage());
                  })),
            ],
          ),
        )
    );
  }

  _getBottom(String url, String text, Function callBack) {
    return GestureDetector(
      onTap: () {
        callBack();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            url,
            width: 56.w,
            height: 56.w,
          ),
          Text(
            text,
            style: TextStyle(color: BaseStyle.color333333, fontSize: 24.sp),
          )
        ],
      ),
    );
  }

  _tab(int index, String text) {
    return Text(text);
  }


  _getListItem(int index, bool ing) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 32.w),
              height: double.infinity,
              child: Column(
                children: [
                  index != 0
                      ? Container(
                    width: 2.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                      color: !ing ? kPrimaryColor : BaseStyle.colorcccccc,
                    ),
                  )
                      : const SizedBox(),
                  Container(
                    margin: EdgeInsets.only(top: index != 0 ? 0 : 10.w),
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      color: ing ? kPrimaryColor : BaseStyle.colorcccccc,
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                  ),
                  index != 0?
                  Expanded(
                    child: Container(
                      width: 2.w,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: ing ? kPrimaryColor : BaseStyle.colorcccccc,
                      ),
                    ),
                  ):const SizedBox()
                ],
              ),
            ),
            30.wb,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text('浏览车辆'),
                    Text(' ｜ '),
                    Text('云云问车-微信小程序-点击浏览'),
                  ],
                ),
                16.hb,
                const Text('2021-12-01 09:30:12'),
                16.hb,
                Container(
                  width: 560.w,
                  height: 200.w,
                  child: _getCarItem(
                    '',
                    '奥迪A8',
                    '2020-2',
                    '',
                    '31.56万',
                    '12.44万公里',
                  ),
                  decoration: BoxDecoration(
                    color: BaseStyle.colorf6f6f6,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                ),
                50.hb,
              ],
            ),
          ],
        ),
      ),
    );
  }

  _getCarItem(String url, String name, String time, String distance,
      String standard, String price) {
    return Container(
      padding: EdgeInsets.only(left: 24.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            //头像
            width: 200.w, height: 150.w,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.w)),
                child: url.contains('http')
                    ? FadeInImage.assetNetwork(
                  image: url,
                  fit: BoxFit.cover,
                  placeholder: '',
                )
                    : Image.asset(url),
              ),
            ),
          ),
          24.wb,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: BaseStyle.color111111,
                      fontSize: BaseStyle.fontSize28,
                      fontWeight: FontWeight.bold),
                ),
                16.hb,
                Row(
                  children: [
                    _getTextView(time),
                    16.wb,
                    _getTextView(distance),
                    16.wb,
                    _getTextView(standard),
                  ],
                ),
                16.hb,
                Text(
                  price,
                  style: TextStyle(
                    color: const Color(0xFFFF3B02),
                    fontSize: BaseStyle.fontSize36,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getTextView(String text) {
    return text.isNotEmpty
        ? Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF1F2F4),
          borderRadius: BorderRadius.all(Radius.circular(2.w))),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xFF4F5A74),
          fontSize: 20.sp,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    )
        : const SizedBox();
  }
}
