import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/model/split_account/broker_all_model.dart';
import 'package:cloud_car/model/split_account/broker_model.dart';
import 'package:cloud_car/model/split_account/business_all_model.dart';
import 'package:cloud_car/model/split_account/common_contact_model.dart';
import 'package:cloud_car/model/user/staff_all_model.dart';
import 'package:cloud_car/ui/home/split_account/split_car_info_page.dart';
import 'package:cloud_car/ui/home/split_account/split_func.dart';
import 'package:cloud_car/ui/user/interface/business_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/cloud_bordered_text_field_widget.dart';
import 'package:cloud_car/widget/cloud_check_box.dart';
import 'package:cloud_car/widget/cloud_dialog_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/cloud_search_head_widget.dart';
import 'package:cloud_car/widget/cloud_tag.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

class AddSplitAccountPageNext extends StatefulWidget {
  final   List<CommonContactModel> finalContacts ;
  const AddSplitAccountPageNext({super.key, required this.finalContacts});

  @override
  _AddSplitAccountPageNextState createState() => _AddSplitAccountPageNextState();
}

class _AddSplitAccountPageNextState extends State<AddSplitAccountPageNext> {

  ///常用联系人列表
  List<CommonContactModel> commonContacts = [];


  ///最后选中的人员列表
  // List<CommonContactModel> lastContacts = [];

  final List<int> _selectBrokerId = [];


  final TextEditingController _amountEditingController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final Map<int, TextEditingController> _mapTextController = {};

  @override
  void initState() {
    super.initState();
    commonContacts = widget.finalContacts;
    for(var item in commonContacts ){
      _selectBrokerId.add(item.id);
      _mapTextController.putIfAbsent(
          item.id, () => TextEditingController());
    }

    //lastContacts = widget.finalContacts;
  }

  @override
  void dispose() {
    _mapTextController.forEach((key, value) {
      value.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CloudScaffold.normal(
      title: '创建分账',
      barHeight: 88.w,
      bodyColor: Colors.white,
      body: Column(
        children: [
          32.hb,
          Expanded(
              child: _commonContactList()
          ),
        ],
      ),
      bottomNavi: Container(
        width: double.infinity,
        height: 200.w + MediaQuery.of(context).viewInsets.bottom,
        color: Colors.white,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 30.w),
        child: Column(
          children: [
            Row(
              children: [
                34.wb,
                Assets.icons.icUser.image(width: 32.w, height: 32.w),
                8.wb,
                '我的出资额'.text.size(28.sp).color(const Color(0xFF333333)).make(),
                const Spacer(),
                CloudBorderedTextFieldWidget(
                  controller: _amountEditingController,
                  hintText: '请输入金额',
                  width: 200.w,
                  height: 60.w,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  inputType: TextInputType.number,
                ),
                8.wb,
                '元'.text.size(28.sp).color(const Color(0xFF333333)).make(),
                34.wb,
              ],
            ),
            20.hb,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 72.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: const Color(0xFF027AFF), width: 2.w),
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                      child: Text(
                        '上一步',
                        style: TextStyle(
                            color: const Color(0xFF027AFF), fontSize: 28.sp),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: ()async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      var result = await Get.dialog(_getNameDialog());
                      if (!result) return;
                      if (_nameController.text.trim().isEmpty) {
                        CloudToast.show('名称不能为空！');
                        return;
                      }
                      if(_amountEditingController.text.trim().isEmpty){
                        CloudToast.show('我的出资额不能为空');
                        return;
                      }
                      var cancel = CloudToast.loading;
                      var brokerData = [];
                      _mapTextController.forEach((key, value) {
                        brokerData.add({
                          'brokerId': key,
                          'amount': num.parse(value.text),
                        });
                      });
                      print(brokerData);
                      var res = await apiClient.request(API.split.create, data: {
                        'ownAmount': double.parse(_amountEditingController.text),
                        'name': _nameController.text,
                        'brokerAmounts': brokerData,
                      });
                      if (res.code == 0) {
                        Get.back();
                        Get.back();
                      } else {
                        CloudToast.show(res.msg);
                      }
                      cancel();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 72.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:  const Color(0xFF027AFF),
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                      child: Text(
                        '发起分账',
                        style: TextStyle(
                            color: Colors.white, fontSize: 28.sp),
                      ),
                    ),
                  ),
                ),

                // const Spacer(),
                // _subButton(
                //     text: '发起',
                //     onTap: () async {
                //       //Get.to(() => const SplitCarInfoPage());
                //
                //
                //     }),
                // 32.wb,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getNameDialog() {
    return CloudDialogWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            40.hb,
            '账目名称'.text.size(36.sp).color(Colors.black).bold.isIntrinsic.make(),
            24.hb,
            CloudBorderedTextFieldWidget(
              width: 400.w,
              height: 60.w,
              controller: _nameController,
              hintText: '请输入名称',
            ),
          ],
        ),
        onConfirm: () {
          Get.back(result: true);
        },
        onCancel: () {
          Get.back(result: false);
        });
  }

  Widget _subButton({required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120.w,
        height: 60.w,
        alignment: Alignment.center,
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

  /// 初始化折叠组件折叠值
  // void _initOpenValue() {
  //   _openValues = List.filled(employees.length, false);
  // }

  Widget _commonContactList() {
    return commonContacts.isEmpty
        ? const NoDataWidget(
            text: '暂无客户信息',
            paddingTop: 0,
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 32.w),
                child: Text(
                  '参与人员',
                  style: TextStyle(
                      fontSize: BaseStyle.fontSize28,
                      color: BaseStyle.color999999),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _commonContactItem(commonContacts[index]);
                },
                itemCount: commonContacts.length,
              ),
            ],
          );
  }

  _commonContactItem(CommonContactModel model) {
    return GestureDetector(
      onTap: () {
        if (_selectBrokerId.contains(model.id)) {
          _selectBrokerId.remove(model.id);
          _mapTextController[model.id]?.dispose();
          _mapTextController.remove(model.id);
        } else {
          _selectBrokerId.add(model.id);
          _mapTextController.putIfAbsent(
              model.id, () => TextEditingController());
        }
        setState(() {});
      },
      child: Container(
        color: Colors.white,
        height: 94.w,
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 18.w),
        child: Row(
          children: [
            CloudCheckBox(value: model.id, groupValue: _selectBrokerId),
            16.wb,
            Text(
              model.roleName,
              style: TextStyle(
                  fontSize: BaseStyle.fontSize28, color: BaseStyle.color333333),
            ),
            16.wb,
            SizedBox(
              width: 32.w,
              height: 32.w,
              child: Image.asset(
                model.gender == 2
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
            const Spacer(),
            if (_selectBrokerId.contains(model.id))
            Row(
              children: [
                20.wb,
                CloudBorderedTextFieldWidget(
                  width: 150.w,
                  height: 50.w,
                  controller: _mapTextController[model.id],
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  inputType: TextInputType.number,
                ),
                20.wb,
                const Text('元')
              ],
            )
          ],
        ),
      ),
    );
  }

}
