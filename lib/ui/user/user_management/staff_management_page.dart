import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/model/user/storeall_model.dart';
import 'package:cloud_car/ui/user/interface/business_func.dart';
import 'package:cloud_car/ui/user/user_management/add_employee_page.dart';
import 'package:cloud_car/ui/user/user_management/add_stores_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/cloud_expansion_tile.dart';
import 'package:cloud_car/widget/cloud_search_head_widget.dart';
import 'package:cloud_car/widget/cloud_status_tag.dart';
import 'package:cloud_car/widget/cloud_tag.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
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

// List<StaffAllModel> employees = [];

List<StoreallModel> employees = [];

class _StaffManagementPageState extends State<StaffManagementPage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  StoreallModel storeallModel = StoreallModel.empty();
  Map _params = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _easyRefreshController.dispose();
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
        title: Text('企业信息',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        // actions: [
        //   Row(
        //     children: [
        //       GestureDetector(
        //         onTap: () {
        //           Get.to(() => const PermissionsPage());
        //         },
        //         child: Text(
        //           '权限',
        //           style: Theme.of(context)
        //               .textTheme
        //               .subtitle2
        //               ?.copyWith(color: BaseStyle.color111111),
        //         ),
        //       ),
        //       32.wb,
        //     ],
        //   )
        // ],
      ),
      backgroundColor: kForeGroundColor,
      body: Column(
        children: [
          8.hb,
          CloudSearchHeadWidget(onSearch: (text) {
            _params = {'name': text};
            _easyRefreshController.callRefresh();
          }),
          32.hb,
          Expanded(
              child: EasyRefresh(
                  firstRefresh: true,
                  header: MaterialHeader(),
                  footer: MaterialFooter(),
                  controller: _easyRefreshController,
                  onRefresh: () async {
                    employees = await BusinessFunc.getStoreall(_params);
                    for (var item in employees) {
                      if (item.id == 0) {
                        storeallModel = item;
                      }
                    }

                    setState(() {});
                  },
                  child: employees.isEmpty
                      ? const NoDataWidget(
                          text: '暂无客户信息',
                          paddingTop: 0,
                        )
                      : CloudExpansionTile(
                          backgroundColor:
                              const Color(0xFF027AFF).withOpacity(0.1),
                          collapsedBackgroundColor:
                              const Color(0xFF333333).withOpacity(0.1),
                          visualDensity: VisualDensity(vertical: -3.w),
                          title: Row(
                            children: [
                              Text('入驻商',
                                  style: TextStyle(
                                      fontSize: BaseStyle.fontSize32,
                                      color: const Color(0xFF027AFF))),
                              24.wb,
                              Padding(
                                padding: EdgeInsets.only(top: 10.w),
                                child: Text((storeallModel.staffs != null ? storeallModel.staffs!.length : 0).toString(),
                                    style: TextStyle(
                                        fontSize: BaseStyle.fontSize28,
                                        color: const Color.fromRGBO(2, 122, 255, 0.8))),
                              )
                            ],
                          ),
                          children: [
                            ...storeallModel.staffs != null
                                ? storeallModel.staffs!.mapIndexed((e, index) {
                                    return GestureDetector(
                                      onTap: () async {
                                        await Get.to(() => EmployeeDetailsPage(
                                              staffId: e.id,
                                            ));
                                        _easyRefreshController.callRefresh();
                                      },
                                      child: getText(
                                          e.roleName,
                                          e.genderEM.typeNum,
                                          e.name,
                                          e.phone,
                                          e.auditStatus,
                                          e.roleEm),
                                    );
                                  }).toList()
                                : [],
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return _getList(employees[index]);
                              },
                              itemCount: employees.length,
                            ),
                          ],
                        )

                  // ListView.builder(
                  //         itemBuilder: (context, index) {
                  //           return _getList(employees[index]);
                  //         },
                  //         itemCount: employees.length,
                  //       ),
                  )),
          UserTool.userProvider.userInfo.business.roleEM== Role.manager?
          Row(
            children: [
          UserTool.userProvider.userInfo.business.roleId ==
          11? Expanded(
                child:CloudBottomButton(
                  onTap: () async {
                    await Get.to(() => const AddStoresPage());
                    _easyRefreshController.callRefresh();
                  },
                  text: '新增门店',
                ),
              ):const SizedBox(),
              Expanded(
                child: CloudBottomButton(
                  onTap: () async {
                    await Get.to(() => const AddEmployeePage());
                    _easyRefreshController.callRefresh();
                  },
                  text: '新建员工',
                ),
              ),
            ],
          ):const SizedBox(),
          50.hb,
        ],
      ),
    );
  }

  _getList(StoreallModel model) {
    return CloudExpansionTile(
      backgroundColor: const Color(0xFF027AFF).withOpacity(0.1),
      collapsedBackgroundColor: const Color(0xFF333333).withOpacity(0.1),
      visualDensity: VisualDensity(vertical: -3.w),

      tilePadding: EdgeInsets.only(left: 60.w, right: 40.w),
      title: Row(
        children: [
          Text(model.name,
              style: TextStyle(
                  fontSize: BaseStyle.fontSize32,
                  color: const Color(0xFF027AFF))),
          24.wb,
          Padding(
            padding: EdgeInsets.only(top: 10.w),
            child: Text((model.staffs != null ? model.staffs!.length : 0).toString(),
                style: TextStyle(
                    fontSize: BaseStyle.fontSize28,
                    color: const Color.fromRGBO(2, 122, 255, 0.8))),
          )
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
          Text(
            position,
            style: TextStyle(
                fontSize: BaseStyle.fontSize28, color: BaseStyle.color333333),
          ),
          16.wb,
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
          //if (model.roleEM == Role.defaultRole) CloudTag.blue(text: '店长'),
          SizedBox(
              child: judge == 1
                  ? const CloudStatusTag(text: '待审核')
                  : const SizedBox())
        ],
      ),
    );
  }

// getText(StaffAllModel model) {
//   return Container(
//     color: Colors.white,
//     height: 94.w,
//     padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 18.w),
//     child: Row(
//       children: [
//         SizedBox(
//           width: 32.w,
//           height: 32.w,
//           child: Image.asset(
//             model.genderEM == Gender.female
//                 ? Assets.icons.icUserWoman.path
//                 : Assets.icons.icUser.path,
//             fit: BoxFit.fill,
//           ),
//         ),
//         16.wb,
//         Text(
//           model.name,
//           style: TextStyle(
//               fontSize: BaseStyle.fontSize28, color: BaseStyle.color333333),
//         ),
//         16.wb,
//         Text(
//           model.phone,
//           style: TextStyle(
//               fontSize: BaseStyle.fontSize24, color: BaseStyle.color999999),
//         ),
//         24.wb,
//         if (model.roleEM == Role.defaultRole) CloudTag.blue(text: '店长'),
//         SizedBox(
//             child: model.auditStatus == 1
//                 ? const CloudStatusTag(text: '待审核')
//                 : const SizedBox())
//       ],
//     ),
//   );
// }
}
