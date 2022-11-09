import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/model/user/staff_all_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_search_head_widget.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

typedef PurchaserCallback = Function(StaffAllModel model);

class ChoosePurchaserPage extends StatefulWidget {
  final PurchaserCallback callback;
  const ChoosePurchaserPage({super.key, required this.callback});

  @override
  State<ChoosePurchaserPage> createState() => _ChoosePurchaserPageState();
}

List<StaffAllModel> employees = [];

class _ChoosePurchaserPageState extends State<ChoosePurchaserPage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  // Map _params = {};

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
                  //employees = await BusinessFunc.getStoreall(_params);
                  employees = [const StaffAllModel(auditStatus: 2, gender: 1, name: '啊啊啊', id: 111, brokerId: 2, phone: '123213290854', roleId: 1, roleName: '店长'),
                    const StaffAllModel(auditStatus: 2, gender: 1, name: '北包包', id: 111, brokerId: 2, phone: '1231232131', roleId: 1, roleName: '销售')];
                  setState(() {});
                },
                child: employees.isEmpty
                    ? const NoDataWidget(
                  text: '暂无客户信息',
                  paddingTop: 0,
                )
                    : ListView.builder(
                  itemBuilder: (context, index) {
                    return getText(employees[index]);
                  },
                  itemCount: employees.length,
                ),
              )),


        ],
      ),
    );
  }


  getText(StaffAllModel model) {
    return GestureDetector(
      onTap: (){
        widget.callback(model);
        Get.back();
      },
      child: Container(
        color: Colors.white,
        height: 94.w,
        padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 18.w),
        child: Row(
          children: [
            Text(
              model.roleEM.typeStr,
              style: TextStyle(
                  fontSize: BaseStyle.fontSize28, color: BaseStyle.color333333),
            ),
            SizedBox(
              width: 32.w,
              height: 32.w,
              child: Image.asset(
                model.genderEM == Gender.female
                    ? Assets.icons.icUserWoman.path
                    : Assets.icons.icUser.path,
                fit: BoxFit.fill,
              ),
            ),
            16.wb,
            Text(
              model.name,
              style: TextStyle(
                  fontSize: BaseStyle.fontSize28, color: BaseStyle.color333333),
            ),
            16.wb,
            Text(
              model.phone,
              style: TextStyle(
                  fontSize: BaseStyle.fontSize24, color: BaseStyle.color999999),
            ),
            24.wb,
            // if (model.roleEM == Role.defaultRole) CloudTag.blue(text: '店长'),
            // SizedBox(
            //     child: model.auditStatus == 1
            //         ? const CloudStatusTag(text: '待审核')
            //         : const SizedBox())
          ],
        ),
      ),
    );
  }
}
