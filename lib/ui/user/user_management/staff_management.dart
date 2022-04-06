import 'package:cloud_car/ui/user/user_management/add_employee.dart';
import 'package:cloud_car/ui/user/user_management/add_stores.dart';
import 'package:cloud_car/ui/user/user_management/permissions.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../widget/button/cloud_back_button.dart';

class StaffManagement extends StatefulWidget {
  const StaffManagement({Key? key}) : super(key: key);

  @override
  State<StaffManagement> createState() => _StaffManagementState();
}

class _StaffManagementState extends State<StaffManagement> {
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
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => Permissions());
                },
                child: Text(
                  '权限',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: BaseStyle.color111111),
                ),
              ),
              32.wb,
            ],
          )
        ],
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: kForeGroundColor,
      body: Column(
        children: [8.hb, _search(), 10.hb, _getList(), _getButtom(), 34.hb],
      ),
    );
  }
}

_search() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      32.wb,
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36.w),
            border: Border.all(width: 2.w, color: Color(0xFFE7E7E7))),
        width: 606.w,
        height: 72.w,
        child: TextField(
          keyboardType: TextInputType.text,
          // onEditingComplete: () {
          //   setState(() {});
          //   // _refreshController.callRefresh();
          // },
          // // focusNode: _contentFocusNode,

          onTap: () {},

          style: TextStyle(
            textBaseline: TextBaseline.ideographic,
            fontSize: 32.sp,
            color: Colors.black,
          ),
          // controller: _editingController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20.w, bottom: 10.w),
            filled: true,
            fillColor: Colors.white,
            hintText: "请输入员工名称",
            hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 14,
                fontWeight: FontWeight.w300),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              size: 16,
            ),
            enabledBorder: UnderlineInputBorder(
              //
              // 不是焦点的时候颜色
              borderRadius: BorderRadius.circular(36.w),
              borderSide: const BorderSide(
                color: kForeGroundColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              // 焦点集中的时候颜色
              borderRadius: BorderRadius.circular(36.w),
              borderSide: const BorderSide(color: kForeGroundColor),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(36.w),
                borderSide: const BorderSide(color: kForeGroundColor)),
          ),
        ),
      ),
      12.wb,
      GestureDetector(
        onTap: () {},
        child: Text('取消',
            style: TextStyle(color: BaseStyle.color333333, fontSize: 28.sp)),
      ),
      20.wb,
    ],
  );
}

_getList() {
  return Expanded(
    child: ListView(
      children: [
        ExpansionTile(
          backgroundColor: const Color(0xFF027AFF).withOpacity(0.1),
          //leading: Icon(Icons.),
          collapsedBackgroundColor: const Color(0xFF333333).withOpacity(0.1),
          title: Row(
            children: [
              Text('门店1',
                  style: TextStyle(
                      fontSize: BaseStyle.fontSize32,
                      color: const Color(0xFF027AFF))),
              24.wb,
              Text('6',
                  style: TextStyle(
                      fontSize: BaseStyle.fontSize28,
                      color: const Color.fromRGBO(2, 122, 255, 0.8)))
            ],
          ),
          children: [
            Container(
              color: kForeGroundColor,
              child: ListTile(
                title: Column(
                  children: [
                    _getText('销售员', Assets.icons.icUser.path, '哈蓓元',
                        '17403612025', 1),
                    36.hb,
                    _getText('销售员', Assets.icons.icUser.path, '多梁',
                        '19552514283', 0),
                    36.hb,
                    _getText('评估师/车务', Assets.icons.icUser.path, '邵秋毅',
                        '15330162683', 0),
                    36.hb,
                    _getText('销售/车务', Assets.icons.icUser.path, '迟欣',
                        '18983673960', 0),
                    36.hb,
                    _getText('销售/车务', Assets.icons.cancellationAccount.path,
                        '柏娣波', '18358319827', 0),
                    36.hb,
                    _getText('店长', Assets.icons.cancellationAccount.path, '章筠叶',
                        '14574150898', 0),
                    36.hb,
                  ],
                ),
              ),
            )
          ],
        ),
        ExpansionTile(
          backgroundColor: const Color(0xFF027AFF).withOpacity(0.1),
          //leading: Icon(Icons.),
          collapsedBackgroundColor: const Color(0xFF333333).withOpacity(0.1),
          title: Row(
            children: [
              Text('门店1',
                  style: TextStyle(
                      fontSize: BaseStyle.fontSize32,
                      color: const Color(0xFF027AFF))),
              24.wb,
              Text('6',
                  style: TextStyle(
                      fontSize: BaseStyle.fontSize28,
                      color: const Color.fromRGBO(2, 122, 255, 0.8)))
            ],
          ),
          children: [
            Container(
              color: kForeGroundColor,
              child: ListTile(
                title: Column(
                  children: [
                    _getText('销售员', Assets.icons.icUser.path, '哈蓓元',
                        '17403612025', 1),
                    36.hb,
                    _getText('销售员', Assets.icons.icUser.path, '多梁',
                        '19552514283', 0),
                    36.hb,
                    _getText('评估师/车务', Assets.icons.icUser.path, '邵秋毅',
                        '15330162683', 0),
                    36.hb,
                    _getText('销售/车务', Assets.icons.icUser.path, '迟欣',
                        '18983673960', 0),
                    36.hb,
                    _getText('销售/车务', Assets.icons.cancellationAccount.path,
                        '柏娣波', '18358319827', 0),
                    36.hb,
                    _getText('店长', Assets.icons.cancellationAccount.path, '章筠叶',
                        '14574150898', 0),
                    36.hb,
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

_getText(String position, String icon, String name, String phone, int judge) {
  return Row(
    children: [
      Text(
        position,
        style: TextStyle(
            fontSize: BaseStyle.fontSize28, fontWeight: FontWeight.bold),
      ),
      20.wb,
      SizedBox(
        width: 32.w,
        height: 32.w,
        child: Image.asset(
          Assets.icons.icUser.path,
          fit: BoxFit.fill,
        ),
      ),
      16.wb,
      Text(
        name,
        style: TextStyle(
            fontSize: BaseStyle.fontSize28, color: BaseStyle.color333333),
      ),
      16.wb,
      Text(
        phone,
        style: TextStyle(
            fontSize: BaseStyle.fontSize24, color: BaseStyle.color999999),
      ),
      24.wb,
      SizedBox(child: judge == 1 ? getBox() : a())
    ],
  );
}

getBox() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
    decoration: BoxDecoration(
        color: const Color(0xFFFF3B02).withOpacity(0.08),
        borderRadius: BorderRadius.circular(4.w)),
    child: Text(
      '待审核',
      style: TextStyle(
          fontSize: BaseStyle.fontSize20, color: const Color(0xFFFF3B02)),
    ),
  );
}

a() {}

_getButtom() {
  return Row(
    children: [
      Padding(padding: EdgeInsets.only(left: 32.w)),
      GestureDetector(
        onTap: () {
          Get.to(() => AddStores());
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 102.w, vertical: 22.w),
            decoration: BoxDecoration(
                border: Border.all(width: 2.w, color: const Color(0xFF027AFF)),
                borderRadius: BorderRadius.circular(8.w)),
            child: Text(
              '新建门店',
              style: TextStyle(
                  color: const Color(0xFF027AFF),
                  fontSize: BaseStyle.fontSize28),
            )),
      ),
      46.wb,
      GestureDetector(
        onTap: () {
          Get.to(() => AddEmployee());
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 102.w, vertical: 22.w),
            decoration: BoxDecoration(
                color: const Color(0xFF027AFF),
                borderRadius: BorderRadius.circular(8.w)),
            child: Text(
              '新建员工',
              style: TextStyle(
                  color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
            )),
      )
    ],
  );
}
