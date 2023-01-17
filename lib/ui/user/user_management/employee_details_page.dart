import 'package:cloud_car/model/user/staff_info_model.dart';
import 'package:cloud_car/ui/user/interface/business_func.dart';
import 'package:cloud_car/ui/user/user_management/editor_employee_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class EmployeeDetailsPage extends StatefulWidget {
  final int staffId;

  const EmployeeDetailsPage({super.key, required this.staffId});

  @override
  State<EmployeeDetailsPage> createState() => _EmployeeDetailsPageState();
}

class _EmployeeDetailsPageState extends State<EmployeeDetailsPage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  bool audit = true;
  bool res = false;
  StaffInfoModel? staffInfo;

  /// 有权限为true
  bool get _deletePermission {
    var userRole = UserTool.userProvider.userInfo;
    if (userRole.business.roleId == 11) {
      return true;
    }
    if (userRole.business.storeId == staffInfo?.storeId &&
        userRole.business.roleId == 1) {
      return true;
    } else {
      return false;
    }
  }

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
        title: Text('员工详情',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: kForeGroundColor,
      body: EasyRefresh(
        firstRefresh: true,
        header: MaterialHeader(),
        controller: _easyRefreshController,
        onRefresh: () async {
          Future.delayed(const Duration(milliseconds: 0), () async {
            staffInfo = await BusinessFunc.getStaffInfo(widget.staffId);
            setState(() {});
          });
        },
        child: staffInfo == null
            ? const SizedBox.shrink()
            : ListView(shrinkWrap: true, children: [
                _getUserinfo(),
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16.w)),
                  child: Container(
                      padding:
                          EdgeInsets.only(left: 56.w, top: 24.w, bottom: 24.w),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom:
                              BorderSide(color: const Color(0xFFDDDDDD), width: 2.w),
                        ),
                        //borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.w)),
                      ),
                      child: Text(
                        '权限描述',
                        style: TextStyle(
                          fontSize: BaseStyle.fontSize28,
                          fontWeight: FontWeight.bold,
                          color: BaseStyle.color333333,
                        ),
                      )),
                ),
                32.hb,
                Row(
                  children: [
                    56.wb,
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF027AFF).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4.w)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
                      child: Text(
                        staffInfo!.roleEm.typeStr,
                        style: TextStyle(
                            color: const Color(0xFF027AFF),
                            fontSize: BaseStyle.fontSize28),
                      ),
                    ),
                  ],
                ),
                24.hb,
                Padding(
                  padding: EdgeInsets.only(left: 56.w),
                  child: Text(
                    staffInfo!.roleEm.typeText,
                    style: TextStyle(
                        color: BaseStyle.color333333,
                        fontSize: BaseStyle.fontSize28),
                  ),
                ),
                staffInfo!.roleId == 1 || staffInfo!.roleId == 3 ? 0.hb : 32.hb,
                Padding(
                  padding: EdgeInsets.only(left: 56.w),
                  child: Offstage(
                    offstage: staffInfo!.roleId == 1 || staffInfo!.roleId == 3,
                    child: SizedBox(
                        child: Text(
                      '销售提成比例      ${staffInfo!.commission}%',
                      style: TextStyle(
                          color: BaseStyle.color666666,
                          fontSize: BaseStyle.fontSize28),
                    )),
                  ),
                ),
                72.hb,
                Padding(
                  padding: EdgeInsets.only(left: 56.w),
                  child: Offstage(
                    offstage: staffInfo!.auditStatus == 1 ||
                        staffInfo!.auditStatus == 2 ||
                        staffInfo!.roleId == 1,
                    child: Text(
                      '驳回理由',
                      style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28),
                    ),
                  ),
                ),
                56.hb,
                Padding(
                  padding: EdgeInsets.only(left: 56.w),
                  child: Offstage(
                    offstage: staffInfo!.auditStatus == 1 ||
                        staffInfo!.auditStatus == 2 ||
                        staffInfo!.roleId == 1,
                    child: Text(
                      '该员工未能通过技术培训',
                      style: TextStyle(
                          color: const Color(0xFFFF6F42),
                          fontSize: BaseStyle.fontSize28),
                    ),
                  ),
                )
              ]),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(top: BorderSide(color: const Color(0xFFDDDDDD), width: 2.w))),
        height: 100.w,
        child: Row(
          children: [
            Offstage(
              offstage: !_deletePermission,
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 100.w)),
                  getButton(Assets.icons.delete.path, '删除', () async {
                    await Get.dialog(NormalContentDialog(
                      type: NormalTextDialogType.delete,
                      title: '确认提示',
                      content: const Text('确认删除该员工吗？'),
                      items: const ['取消'],
                      deleteItem: '确定',
                      //监听器
                      listener: (index) {
                        Alert.dismiss(context);
                        setState(() {});
                      },
                      deleteListener: () async {
                        var res =
                            await BusinessFunc.getStaffDelete(widget.staffId);
                        if (res) {
                          Get.back();
                        }
                        Get.back();
                      },
                    ));
                  }),
                  200.wb,
                  Offstage(
                    offstage: !_deletePermission,
                    child: getButton(Assets.icons.editor1.path, '编辑', () async {
                      res = await Get.to(() => EditorEmployeePage(
                            roleId: staffInfo!.roleId,
                            storeId: staffInfo!.storeId,
                            staffId: widget.staffId,
                            nameText: staffInfo!.name,
                            gender: staffInfo!.genderEm,
                            phoneText: staffInfo!.phone,
                            storeIdText: staffInfo!.storeName,
                            roleName: staffInfo!.roleName,
                            commissionText: staffInfo!.commission,
                          ));
                      //print(audit);
                    }),
                  )
                ],
              ),
            )
          ],
        ),
      ), //
    );
  }

  _getAudit() {
    return Offstage(
      offstage: staffInfo!.auditStatus == 1 ||
          staffInfo!.auditStatus == 2 ||
          staffInfo!.roleId == 1,
      child: Image.asset(
        staffInfo!.auditStatus == 1
            ? Assets.icons.inreview.path
            : Assets.icons.hasrejected.path,
        width: 140.w,
        height: 140.w,
      ),
    );
  }

//按钮
  getButton(String url, String text, Function() onTap) {
    return Offstage(
      offstage: !audit,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 56.w,
              height: 56.w,
              child: Image.asset(url),
            ),
            4.hb,
            Text(
              text,
              style: TextStyle(
                  color: BaseStyle.color333333, fontSize: BaseStyle.fontSize24),
            )
          ],
        ),
      ),
    );
  }

//   describe() {
//     switch (widget.permissions) {
//       case '销售员':
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '能够查看全店的车，并进行客户跟进、销售下单',
//               style: TextStyle(
//                   color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
//             ),
//             32.hb,
//             SizedBox(
//                 width: 250.w,
//                 child: Text(
//                   '销售提成比例${widget.proportion}%',
//                   style: TextStyle(
//                       color: BaseStyle.color666666,
//                       fontSize: BaseStyle.fontSize28),
//                 )),
//           ],
//         );
//       case '评估师/车务':
//         return Text(
//           '负责录入车辆信息、编辑店里的车辆',
//           style: TextStyle(
//               color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
//         );
//
//       case '销售/车务':
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '可以录入车辆信息、编辑车辆，并进行客户跟踪、销售下单',
//               style: TextStyle(
//                   color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
//             ),
//             32.hb,
//             SizedBox(
//                 width: 250.w,
//                 child: Text(
//                   '销售提成比例${widget.proportion}%',
//                   style: TextStyle(
//                       color: BaseStyle.color666666,
//                       fontSize: BaseStyle.fontSize28),
//                 )),
//           ],
//         );
//
//       case '店长':
//         return Text(
//           '能够管理店内的客户、车辆、订单',
//           style: TextStyle(
//               color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
//         );
//     }
//   }

//员工信息
  _getUserinfo() {
    return Stack(
      children: [
        Container(
          color: bodyColor,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
            padding: EdgeInsets.symmetric(vertical: 20.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(left: 32.w),
                child: Text(
                  staffInfo!.name,
                  style: TextStyle(
                      color: BaseStyle.color333333,
                      fontWeight: FontWeight.bold,
                      fontSize: BaseStyle.fontSize36),
                ),
              ),
              getText('性别', staffInfo!.genderEm.typeStr),
              getText('手机号', staffInfo!.phone),
              getText('权限配置', staffInfo!.roleName),
              getText('所属门店', staffInfo!.storeName),
              //getText('所属入驻商', '宁波xx4s专营店'),

              ///widget.business
              ///staffInfo!.Storeid
            ]),
          ),
        ),
        Positioned(left: 534.w, top: 12.w, child: _getAudit())
      ],
    );
  }

//文字样式
  getText(String title, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      child: Row(
        children: [
          SizedBox(
              width: 170.w,
              child: Text(
                title,
                style: TextStyle(
                    color: BaseStyle.color666666,
                    fontSize: BaseStyle.fontSize28),
              )),
          Text(
            text,
            style: TextStyle(
                color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
          )
        ],
      ),
    );
  }
}
