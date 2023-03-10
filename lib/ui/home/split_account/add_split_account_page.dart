import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/model/split_account/broker_all_model.dart';
import 'package:cloud_car/model/split_account/business_all_model.dart';
import 'package:cloud_car/model/user/staff_all_model.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

class AddSplitAccountPage extends StatefulWidget {
  const AddSplitAccountPage({super.key});

  @override
  _AddSplitAccountPageState createState() => _AddSplitAccountPageState();
}

class _AddSplitAccountPageState extends State<AddSplitAccountPage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  List<BrokerAllModel> employees = [];

  final TextEditingController _amountEditingController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  Map _params = {'status': 2};

  final List<int> _selectBrokerId = [];
  final Map<int, TextEditingController> _mapTextController = {};
  List<bool> _openValues = [];

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
      title: '????????????',
      barHeight: 88.w,
      bodyColor: Colors.white,
      body: Column(
        children: [
          8.hb,
          CloudSearchHeadWidget(onSearch: (text) {
            _params = {
              "staff": {"name": text, 'status': 2},
            };
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
              employees = await BusinessFunc.getBrokerAll(_params);
              _openValues.clear();
              _initOpenValue();
              setState(() {});
            },
            child: employees.isEmpty
                ? const NoDataWidget(
                    text: '??????????????????',
                    paddingTop: 0,
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        collapsedBackgroundColor:
                            index.isEven ? Colors.black12 : Colors.transparent,
                        title: Text(employees[index].name),
                        children: employees[index]
                            .brokers
                            .mapIndexed((currentValue, index) =>
                                _listTile(currentValue, index))
                            .toList(),
                      );
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
            '???????????????'.text.size(28.sp).color(const Color(0xFF333333)).make(),
            12.wb,
            CloudBorderedTextFieldWidget(
              controller: _amountEditingController,
              hintText: '???????????????',
              width: 200.w,
              height: 60.w,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              inputType: TextInputType.number,
            ),
            8.wb,
            '???'.text.size(28.sp).color(const Color(0xFF333333)).make(),
            const Spacer(),
            _subButton(
                text: '??????',
                onTap: () async {
                  var result = await Get.dialog(_getNameDialog());
                  if (!result) return;
                  if (_nameController.text.trim().isEmpty) {
                    CloudToast.show('?????????????????????');
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
                  var res = await apiClient.request(API.split.create, data: {
                    'ownAmount': double.parse(_amountEditingController.text),
                    'name': _nameController.text,
                    'brokerAmounts': brokerData,
                  });
                  if (res.code == 0) {
                    Get.back();
                  } else {
                    CloudToast.show(res.msg);
                  }
                  cancel();
                }),
            32.wb,
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
            '????????????'.text.size(36.sp).color(Colors.black).bold.isIntrinsic.make(),
            24.hb,
            CloudBorderedTextFieldWidget(
              width: 400.w,
              height: 60.w,
              controller: _nameController,
              hintText: '???????????????',
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

  /// ??????????????????????????????
  void _initOpenValue() {
    _openValues = List.filled(employees.length, false);
  }

  Widget _listTile(SplitBrokerItem broker, int index) {
    return GestureDetector(
      onTap: () {
        if (_selectBrokerId.contains(broker.id)) {
          _selectBrokerId.remove(broker.id);
          _mapTextController[broker.id]?.dispose();
          _mapTextController.remove(broker.id);
        } else {
          _selectBrokerId.add(broker.id);
          _mapTextController.putIfAbsent(
              broker.id, () => TextEditingController());
        }
        setState(() {});
      },
      child: Container(
        color: Colors.white,
        height: 94.w,
        padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 18.w),
        child: Row(
          children: [
            CloudCheckBox(value: broker.id, groupValue: _selectBrokerId),
            16.wb,
            SizedBox(
              width: 32.w,
              height: 32.w,
              child: Image.asset(
                broker.gender == 2
                    ? Assets.icons.icUserWoman.path
                    : Assets.icons.icUser.path,
                fit: BoxFit.fill,
              ),
            ),
            16.wb,
            Text(
              broker.name,
              style: TextStyle(
                  fontSize: BaseStyle.fontSize28, color: BaseStyle.color333333),
            ),
            16.wb,
            // if (broker.roleEM == Role.manager) CloudTag.blue(text: '??????'),
            if (_selectBrokerId.contains(broker.id))
              Row(
                children: [
                  20.wb,
                  CloudBorderedTextFieldWidget(
                    controller: _mapTextController[broker.id],
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    inputType: TextInputType.number,
                  ),
                  20.wb,
                  const Text('???')
                ],
              )
          ],
        ),
      ),
    );
  }
}
