import 'package:cloud_car/ui/home/search_page.dart';
import 'package:cloud_car/ui/home/sort_list_page.dart';
import 'package:cloud_car/ui/home/user_manager/user_info_page.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/choose_widget.dart';
import 'package:cloud_car/widget/custom_drawer.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/material.dart';

class UserManagerDetailPage extends StatefulWidget {
  const UserManagerDetailPage({Key? key}) : super(key: key);

  @override
  _UserManagerDetailPageState createState() => _UserManagerDetailPageState();
}

class _UserManagerDetailPageState extends State<UserManagerDetailPage> {
  late List<String> _dropDownHeaderItemStrings;

  List<dynamic>? data;
  List<Widget> listWidget = [];
  ScreenControl screenControl = ScreenControl();
  late String city;
  late String brand;
  late String price;
  late String sort;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<ChooseItem> _sortList = [];
  String title = '客户统计';

  @override
  void initState() {
    super.initState();
    _dropDownHeaderItemStrings = [
      '排序',
    ];

    _sortList = [
      ChooseItem(name: '最近跟进'),
      ChooseItem(name: '最近注册'),
    ];

    listWidget = [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.w)),
            color: kForeGroundColor),
        clipBehavior: Clip.antiAlias,
        child: ScreenWidget(
          childAspectRatio: 144 / 56,
          callback: (String item) {},
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          haveButton: true,
          itemList: _sortList,
        ),
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => const SearchPage());
              },
              child: Image.asset(Assets.icons.mainSearch.path,
                  height: 48.w, width: 48.w),
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
        endDrawer: CustomDrawer(
            widthPercent: 0.86,
            backgroundColor: Colors.white,
            callback: (bool isOpened) {},
            child: _getSortList()),
        backgroundColor: const Color(0xFFF6F6F6),
        extendBody: true,
        body: Column(
          children: [
            ChooseWidget(
              callBack: (name) {
                setState(() {});
              },
              items: const [
                '浏览客户',
                '意向客户',
                '邀请注册',
                '成交客户',
              ],
            ),
            Divider(
              height: 1.w,
              color: BaseStyle.colordddddd,
            ),
            Expanded(
              child: DropDownWidget(
                _dropDownHeaderItemStrings,
                listWidget,
                height: 76.w,
                bottomHeight: 400.w,
                screenControl: screenControl,
                headFontSize: 28.sp,
                child: Container(
                  margin: EdgeInsets.only(top: 80.w),
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
                    itemBuilder: (context, index) {
                      return _getItem(false);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        color: const Color(0xFFF6F6F6),
                        height: 16.w,
                      );
                    },
                    itemCount: 10,
                  ),
                ),
                screen: '筛选',
                onTap: () {
                  screenControl.screenHide();
                  _scaffoldKey.currentState?.openEndDrawer();
                  print('筛选');
                },
              ),
            )
          ],
        ));
  }

  _getSortList() {
    return SortListPage(
      callback: (ChooseItem item) {
        print(item.name + '123123');
      },
    );
  }

  _getItem(bool isImport) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>UserInfoPage());
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w), color: kForeGroundColor),
        child: Stack(
          children: [
            isImport?Positioned(
              child: Image.asset(
                Assets.images.importantUser.path,
                width: 130.w,
                fit: BoxFit.fitWidth,
              ),
              right: 0,
              top: 0,
            ):const SizedBox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.hb,
                Row(
                  children: [
                    36.wb,
                    Image.asset(Assets.icons.icUser.path,width: 32.w,height: 32.w,),
                    5.wb,
                    Text(
                      '李四',
                      style: TextStyle(
                          fontSize: 32.sp,
                          color: BaseStyle.color333333,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    isImport?const SizedBox():GestureDetector(
                      onTap: (){

                      },
                      child: Text(
                        '设为重要',
                        style: TextStyle(
                            fontSize: 24.sp,
                            color: BaseStyle.color999999,
                        ),
                      ),
                    ),
                    24.wb,
                  ],
                ),
                10.hb,
                const Divider(height: 2,color: BaseStyle.colorf6f6f6,),
                Row(
                  children: [
                    36.wb,
                    Column(
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
                        20.hb,
                      ],
                    )
                  ],
                )

              ],
            ),
          ],
        ),
      ),
    );
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
