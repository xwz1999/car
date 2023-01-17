
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_search_head_widget.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../model/user/storeall_model.dart';
import '../../../../widget/cloud_expansion_tile.dart';
import '../../../../widget/cloud_status_tag.dart';
import '../../../user/interface/business_func.dart';

typedef PurchaserCallback = Function(StoreallModel model,String name);

class ChoosePurchaserPage extends StatefulWidget {
   final PurchaserCallback callback;

  const ChoosePurchaserPage({super.key, required this.callback,});

  @override
  State<ChoosePurchaserPage> createState() => _ChoosePurchaserPageState();
}

List<StoreallModel> employees = [];

class _ChoosePurchaserPageState extends State<ChoosePurchaserPage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  StoreallModel storeallModel = StoreallModel.empty();
  final Map _params = {};

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
        title: Text('采购人信息',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: kForeGroundColor,
      body: Column(
        children: [
          8.hb,
          CloudSearchHeadWidget(onSearch: (text) {
            //_params = {'name': text};
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

                  //employees = await BusinessFunc.getStoreall(_params);
                  // employees = [const StaffAllModel(
                  //     auditStatus: 2, gender: 1,
                  //     name: '啊啊啊', id: 111,
                  //     brokerId: 2, phone: '123213290854',
                  //     roleId: 1, roleName: '店长'),
                  //   const StaffAllModel(auditStatus: 2, gender: 1,
                  //       name: '北包包', id: 111, brokerId: 2,
                  //       phone: '1231232131', roleId: 1, roleName: '销售')];
                  setState(() {});
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
              widget.callback(model,e.name) ;
              Get.back();
              // await Get.to(() => EmployeeDetailsPage(
              //   staffId: e.id,
              // ));
              // _easyRefreshController.callRefresh();
            },
            child: getText(e.roleName, e.genderEM.typeNum, e.name,
                e.phone, e.auditStatus,),/// e.roleEm
          );
        }).toList()
            : []
      ],
    );
  }
  getText(String position, int gender, String name, String phone, int judge,
      ) {///Role role
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
          // if (role == Role.manager) CloudTag.blue(text: '店长'),
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
  //   return GestureDetector(
  //     onTap: (){
  //       widget.callback(model);
  //       Get.back();
  //     },
  //     child: Container(
  //       color: Colors.white,
  //       height: 94.w,
  //       padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 18.w),
  //       child: Row(
  //         children: [
  //           Text(
  //             model.roleEM.typeStr,
  //             style: TextStyle(
  //                 fontSize: BaseStyle.fontSize28, color: BaseStyle.color333333),
  //           ),
  //           SizedBox(
  //             width: 32.w,
  //             height: 32.w,
  //             child: Image.asset(
  //               model.genderEM == Gender.female
  //                   ? Assets.icons.icUserWoman.path
  //                   : Assets.icons.icUser.path,
  //               fit: BoxFit.fill,
  //             ),
  //           ),
  //           16.wb,
  //           Text(
  //             model.name,
  //             style: TextStyle(
  //                 fontSize: BaseStyle.fontSize28, color: BaseStyle.color333333),
  //           ),
  //           16.wb,
  //           Text(
  //             model.phone,
  //             style: TextStyle(
  //                 fontSize: BaseStyle.fontSize24, color: BaseStyle.color999999),
  //           ),
  //           24.wb,
  //           // if (model.roleEM == Role.defaultRole) CloudTag.blue(text: '店长'),
  //           // SizedBox(
  //           //     child: model.auditStatus == 1
  //           //         ? const CloudStatusTag(text: '待审核')
  //           //         : const SizedBox())
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
