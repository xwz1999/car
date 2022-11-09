import 'package:cloud_car/model/split_account/broker_model.dart';
import 'package:cloud_car/model/split_account/common_contact_model.dart';
import 'package:cloud_car/ui/home/split_account/split_func.dart';
import 'package:cloud_car/ui/user/interface/business_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/cloud_check_box.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
// import 'package:velocity_x/velocity_x.dart';

import 'add_split_account_page_next.dart';

class AddSplitAccountPage extends StatefulWidget {
  const AddSplitAccountPage({super.key});

  @override
  _AddSplitAccountPageState createState() => _AddSplitAccountPageState();
}

class _AddSplitAccountPageState extends State<AddSplitAccountPage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  //List<BrokerAllModel> employees = [];
  ///搜索结果
  List<BrokerModel> employees = [];

  ///常用联系人列表
  List<CommonContactModel> commonContacts = [];

  // ///已参与的人员列表
  // List<CommonContactModel> joinContacts = [];

  ///最后选中的人员列表
  List<CommonContactModel> finalContacts = [];

  late bool _showSearch;
  //
  // final TextEditingController _amountEditingController =
  //     TextEditingController();
  // final TextEditingController _nameController = TextEditingController();

  final TextEditingController _editingController = TextEditingController();

  Map _params = {'status': 2};

  //final List<int> _selectBrokerId = [];
  //final Map<int, TextEditingController> _mapTextController = {};
  // List<bool> _openValues = [];

  @override
  void initState() {
    _showSearch = false;
    super.initState();
  }

  @override
  void dispose() {
    // _mapTextController.forEach((key, value) {
    //   value.dispose();
    // });
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
          8.hb,
          // CloudSearchHeadWidget(onSearch: (text) {
          //   _params = {
          //     "staff": {"name": text, 'status': 2},
          //   };
          //   _easyRefreshController.callRefresh();
          // }),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              32.wb,
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36.w),
                    border:
                        Border.all(width: 2.w, color: const Color(0xFFE7E7E7))),
                width: 606.w,
                height: 72.w,
                child: TextField(
                  style: TextStyle(
                    textBaseline: TextBaseline.ideographic,
                    fontSize: 32.sp,
                    color: Colors.black,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  controller: _editingController,
                  onEditingComplete: () {},
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.w, bottom: 10.w),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "请输入员工手机号",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                    prefixIcon: const Icon(
                      CupertinoIcons.search,
                      size: 16,
                    ),
                    suffixIcon: IconButton(
                      iconSize: 16,
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        employees.clear();
                        setState(() {
                          _editingController.clear();
                        });
                        _showSearch = false;
                      },
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
              24.wb,
              GestureDetector(
                onTap: () async {
                  employees.clear();
                  _params = {
                    "phone": _editingController.text,
                  };
                  var model = await BusinessFunc.searchBrokerAll(_params);
                  employees.add(model!);
                  _showSearch = true;
                  setState(() {});
                  //_easyRefreshController.callRefresh();
                },
                child: Text('搜索',
                    style: TextStyle(
                        color: BaseStyle.color333333, fontSize: 28.sp)),
              ),
              20.wb,
            ],
          ),
          32.hb,
          Expanded(
              child: EasyRefresh(
                  firstRefresh: true,
                  header: MaterialHeader(),
                  footer: MaterialFooter(),
                  controller: _easyRefreshController,
                  onRefresh: () async {
                    commonContacts = await SplitFunc.getCommonContact();
                    // _openValues.clear();
                    // _initOpenValue();
                    setState(() {});
                  },
                  child: _showSearch ? _searchList() : _commonContactList()

                  // commonContacts.isEmpty
                  //     ? const NoDataWidget(
                  //         text: '暂无客户信息',
                  //         paddingTop: 0,
                  //       )
                  //     : ListView.builder(
                  //         itemBuilder: (context, index) {
                  //           return _listTile(employees[index],index);
                  //         },
                  //         itemCount: employees.length,
                  //       ),
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
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  List<int> resultList = [];
                  for(var item in finalContacts){
                    resultList.add(item.id);
                  }
                  bool result = await SplitFunc.addCommonContact(resultList);
                  if (result) {
                    _easyRefreshController.callRefresh();
                    setState(() {});
                  }
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
                    '取消常用联系',
                    style: TextStyle(
                        color: const Color(0xFF027AFF), fontSize: 28.sp),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if(finalContacts.isEmpty){
                    CloudToast.show('至少选择一名参与人员');
                  }else{
                    Get.to(()=>AddSplitAccountPageNext(finalContacts: finalContacts,));
                  }
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
                    '下一步',
                    style: TextStyle(
                        color: Colors.white, fontSize: 28.sp),
                  ),
                ),
              ),
            ),
            // 34.wb,
            // Assets.icons.icUser.image(width: 32.w, height: 32.w),
            // 8.wb,
            // '我的出资额'.text.size(28.sp).color(const Color(0xFF333333)).make(),
            // 12.wb,
            // CloudBorderedTextFieldWidget(
            //   controller: _amountEditingController,
            //   hintText: '请输入金额',
            //   width: 200.w,
            //   height: 60.w,
            //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            //   inputType: TextInputType.number,
            // ),
            // 8.wb,
            // '元'.text.size(28.sp).color(const Color(0xFF333333)).make(),
            // const Spacer(),
            // _subButton(
            //     text: '发起',
            //     onTap: () async {
            //       Get.to(() => const SplitCarInfoPage());
            //
            //       // var result = await Get.dialog(_getNameDialog());
            //       // if (!result) return;
            //       // if (_nameController.text.trim().isEmpty) {
            //       //   CloudToast.show('名称不能为空！');
            //       //   return;
            //       // }
            //       // var cancel = CloudToast.loading;
            //       // var brokerData = [];
            //       // _mapTextController.forEach((key, value) {
            //       //   brokerData.add({
            //       //     'brokerId': key,
            //       //     'amount': num.parse(value.text),
            //       //   });
            //       // });
            //       // var res = await apiClient.request(API.split.create, data: {
            //       //   'ownAmount': double.parse(_amountEditingController.text),
            //       //   'name': _nameController.text,
            //       //   'brokerAmounts': brokerData,
            //       // });
            //       // if (res.code == 0) {
            //       //   Get.back();
            //       // } else {
            //       //   CloudToast.show(res.msg);
            //       // }
            //       // cancel();
            //     }),
            // 32.wb,
          ],
        ),
      ),
    );
  }

  // Widget _getNameDialog() {
  //   return CloudDialogWidget(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           40.hb,
  //           '账目名称'.text.size(36.sp).color(Colors.black).bold.isIntrinsic.make(),
  //           24.hb,
  //           CloudBorderedTextFieldWidget(
  //             width: 400.w,
  //             height: 60.w,
  //             controller: _nameController,
  //             hintText: '请输入名称',
  //           ),
  //         ],
  //       ),
  //       onConfirm: () {
  //         Get.back(result: true);
  //       },
  //       onCancel: () {
  //         Get.back(result: false);
  //       });
  // }

  // Widget _subButton({required String text, required VoidCallback onTap}) {
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Container(
  //       width: 120.w,
  //       height: 60.w,
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //         gradient: const LinearGradient(
  //             begin: Alignment.centerLeft,
  //             end: Alignment.centerRight,
  //             colors: [Color(0xFF0593FF), Color(0xFF027AFF)]),
  //         borderRadius: BorderRadius.circular(8.w),
  //       ),
  //       child: text.text.size(28.sp).color(const Color(0xFFFFFFFF)).make(),
  //     ),
  //   );
  // }

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
                  '常用联系人',
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
        if (finalContacts.contains(model)) {
          finalContacts.remove(model);
          // _mapTextController[broker.id]?.dispose();
          // _mapTextController.remove(broker.id);
        } else {
          finalContacts.add(model);
          // _mapTextController.putIfAbsent(
          //     broker.id, () => TextEditingController());
        }
        setState(() {});
      },
      child: Container(
        color: Colors.white,
        height: 94.w,
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 18.w),
        child: Row(
          children: [
            CloudCheckBox(value: model, groupValue: finalContacts),
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
          ],
        ),
      ),
    );
  }

  Widget _searchList() {
    return employees.isEmpty
        ? const NoDataWidget(
            text: '暂无客户信息',
            paddingTop: 0,
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return _searchItem(employees[index]);
            },
            itemCount: employees.length,
          );
  }

  _searchItem(BrokerModel model) {
    return Container(
      color: Colors.white,
      height: 94.w,
      padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 18.w),
      child: Row(
        children: [
          CloudCheckBox(value: model.id, groupValue: finalContacts),
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
            model.nickname,
            style: TextStyle(
                fontSize: BaseStyle.fontSize28, color: BaseStyle.color333333),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              bool result = await SplitFunc.addCommonContact([model.id]);
              if (result) {
                employees.clear();
                _showSearch = false;
                _editingController.clear();

                _easyRefreshController.callRefresh();
                setState(() {});
              }
            },
            child: SizedBox(
              width: 50.w,
              height: 50.w,
              child: Image.asset(
                Assets.icons.icSplitAdd.path,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

// Widget _listTile(CommonContactModel broker, int index) {
//   return GestureDetector(
//     onTap: () {
//       if (finalContacts.contains(broker)) {
//         finalContacts.remove(broker);
//         // _mapTextController[broker.id]?.dispose();
//         // _mapTextController.remove(broker.id);
//       } else {
//         finalContacts.add(broker);
//         // _mapTextController.putIfAbsent(
//         //     broker.id, () => TextEditingController());
//       }
//       setState(() {});
//     },
//     child: Container(
//       color: Colors.white,
//       height: 94.w,
//       padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 18.w),
//       child: Row(
//         children: [
//           CloudCheckBox(value: broker.id, groupValue: finalContacts),
//           16.wb,
//           SizedBox(
//             width: 32.w,
//             height: 32.w,
//             child: Image.asset(
//               // broker.gender == 2
//               true
//                   ? Assets.icons.icUserWoman.path
//                   : Assets.icons.icUser.path,
//               fit: BoxFit.fill,
//             ),
//           ),
//           16.wb,
//           Text(
//             broker.nickname,
//             style: TextStyle(
//                 fontSize: BaseStyle.fontSize28, color: BaseStyle.color333333),
//           ),
//           16.wb,
//           // if (broker.roleEM == Role.manager) CloudTag.blue(text: '店长'),
//           if (_selectBrokerId.contains(broker.id))
//             Row(
//               children: [
//                 20.wb,
//                 CloudBorderedTextFieldWidget(
//                   controller: _mapTextController[broker.id],
//                   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                   inputType: TextInputType.number,
//                 ),
//                 20.wb,
//                 const Text('元')
//               ],
//             )
//         ],
//       ),
//     ),
//   );
// }
}
