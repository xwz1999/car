import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/model/user/storeall_model.dart';
import 'package:cloud_car/ui/user/interface/business_func.dart';
import 'package:cloud_car/ui/user/user_management/add_employee_page.dart';
import 'package:cloud_car/ui/user/user_management/permissions_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/cloud_tag.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/button/cloud_back_button.dart';
import 'employee_details_page.dart';

class StaffManagementPage extends StatefulWidget {
  const StaffManagementPage({super.key});

  @override
  State<StaffManagementPage> createState() => _StaffManagementPageState();
}

List<StoreallModel> employees = [];

class _StaffManagementPageState extends State<StaffManagementPage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  late TextEditingController _editingController;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: searchText);
  }

  @override
  void dispose() {
    _easyRefreshController.dispose();
    super.dispose();
  }

  _refresh() async {
    employees = await BusinessFunc.getStoreall();
    setState(() {});
  }

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
                  Get.to(() => const PermissionsPage());
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
      ),
      backgroundColor: kForeGroundColor,
      body: Column(
        children: [
          8.hb,
          _search(),
          32.hb,
          Expanded(
              child: EasyRefresh(
            firstRefresh: true,
            header: MaterialHeader(),
            footer: MaterialFooter(),
            controller: _easyRefreshController,
            onRefresh: () async {
              await _refresh();
            },
            child: employees.isEmpty
                ? const NoDataWidget(
                    text: '暂无客户信息',
                    paddingTop: 0,
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return _getList(employees[index]);
                    },
                    itemCount: employees.length,
                  ),
          )),
          getButton(),
          34.hb
        ],
      ),
    );
  }

//输入框
  _search() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        32.wb,
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36.w),
              border: Border.all(width: 2.w, color: const Color(0xFFE7E7E7))),
          width: 606.w,
          height: 72.w,
          child: TextField(
            style: TextStyle(
              textBaseline: TextBaseline.ideographic,
              fontSize: 32.sp,
              color: Colors.black,
            ),
            controller: _editingController,
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

  _getList(StoreallModel model) {
    return ExpansionTile(
      backgroundColor: const Color(0xFF027AFF).withOpacity(0.1),
      //leading: Icon(Icons.),
      collapsedBackgroundColor: const Color(0xFF333333).withOpacity(0.1),
      title: Row(
        children: [
          Text(model.name,
              style: TextStyle(
                  fontSize: BaseStyle.fontSize32,
                  color: const Color(0xFF027AFF))),
          24.wb,
          Text((model.staffs != null ? model.staffs!.length : 0).toString(),
              style: TextStyle(
                  fontSize: BaseStyle.fontSize28,
                  color: const Color.fromRGBO(2, 122, 255, 0.8)))
        ],
      ),
      children: [
        ...model.staffs != null
            ? model.staffs!.mapIndexed((e, index) {
                return GestureDetector(
                  onTap: () async {
                    await Get.to(() => EmployeeDetailsPage(
                          staffId: e.id,
                        ));
                    _easyRefreshController.callRefresh();
                  },
                  child: getText(e.roleName, e.genderEM.typeNum, e.name,
                      e.phone, e.auditStatus, e.roleEm),
                );
              }).toList()
            : []
      ],
    );
  }

  getText(String position, int gender, String name, String phone, int judge,
      Role role) {
    return Container(
      color: Colors.white,
      height: 94.w,
      padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 18.w),
      child: Row(
        children: [
          SizedBox(
            width: 32.w,
            height: 32.w,
            child: Image.asset(
              gender == 2
                  ? Assets.icons.icUserWoman.path
                  : Assets.icons.icUser.path,
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
          if (role == Role.manager) CloudTag.blue(text: '店长'),
          SizedBox(child: judge == 1 ? getBox() : const SizedBox())
        ],
      ),
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

  /// 新建员工
  getButton() {
    return CloudBottomButton(
      onTap: () async {
        await Get.to(() => const AddEmployeePage());
        _easyRefreshController.callRefresh();
      },
      text: '新建员工',
    );
  }
}
