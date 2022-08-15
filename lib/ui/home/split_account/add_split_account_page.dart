import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/model/user/storeall_model.dart';
import 'package:cloud_car/ui/user/interface/business_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_bordered_text_field_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/cloud_search_head_widget.dart';
import 'package:cloud_car/widget/cloud_tag.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

class AddSplitAccountPage extends StatefulWidget {
  const AddSplitAccountPage({super.key});

  @override
  _AddSplitAccountPageState createState() => _AddSplitAccountPageState();
}

class _AddSplitAccountPageState extends State<AddSplitAccountPage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  List<StoreallModel> employees = [];

  final TextEditingController _editingController = TextEditingController();

  Map _params = {'status': 1};

  @override
  Widget build(BuildContext context) {
    return CloudScaffold.normal(
      title: '创建分账',
      barHeight: 88.w,
      bodyColor: Colors.white,
      body: Column(
        children: [
          8.hb,
          CloudSearchHeadWidget(onSearch: (text) {
            _params = {'name': text, 'status': 2};
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
              setState(() {});
            },
            child: employees.isEmpty
                ? const NoDataWidget(
                    text: '暂无客户信息',
                    paddingTop: 0,
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return _getList(employees[index], index);
                    },
                    itemCount: employees.length,
                  ),
          )),
        ],
      ),
      bottomNavi: Container(
        width: double.infinity,
        height: 120.w + MediaQuery.of(context).viewInsets.bottom,
        color: Colors.white,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 30.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            34.wb,
            Assets.icons.icUser.image(width: 32.w, height: 32.w),
            8.wb,
            '我的出资额'.text.size(28.sp).color(const Color(0xFF333333)).make(),
            12.wb,
            CloudBorderedTextFieldWidget(
              controller: _editingController,
              hintText: '请输入金额',
              width: 200.w,
              height: 60.w,
            ),
            8.wb,
            '元'.text.size(28.sp).color(const Color(0xFF333333)).make(),
            const Spacer(),
            _subButton('发起', () {})
          ],
        ),
      ),
    );
  }

  Widget _subButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120.w,
        height: 60.w,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF0593FF), Color(0xFF027AFF)]),
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: text.text.size(28.sp).color(const Color(0xFFFFFFFF)).make(),
      ),
    );
  }

  _getList(StoreallModel model, int index) {
    return Column(
      children: [
        Row(
          children: [
            32.wb,
            ('门店${index + 1}')
                .text
                .size(24.sp)
                .color(const Color(0xFF999999))
                .make(),
          ],
        ),
        ...model.staffs != null
            ? model.staffs!.mapIndexed((e, index) {
                return GestureDetector(
                  onTap: () async {},
                  child: _listTile(e.roleName, e.genderEM.typeNum, e.name,
                      e.phone, e.auditStatus, e.roleEm),
                );
              }).toList()
            : []
      ],
    );
  }

  _listTile(String position, int gender, String name, String phone, int judge,
      Role role) {
    return GestureDetector(
      onTap: (){},
      child: Container(
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
          ],
        ),
      ),
    );
  }
}
