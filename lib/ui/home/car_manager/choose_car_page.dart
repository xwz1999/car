import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/model/car_manager/car_list_model.dart';
import 'package:cloud_car/ui/home/car_valuation/car_func.dart';

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_list_model.dart';
import 'package:cloud_car/widget/button/colud_check_radio.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:cloud_car/widget/search_bar_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../constants/api/api.dart';


typedef CarCallback = Function(String city,int carId);

///单选
class ChooseCarPage extends StatefulWidget {
  final String title;
  final CarCallback callback;


  const ChooseCarPage({
    Key? key,
    required this.callback, required this.title,
  }) : super(key: key);

  @override
  _ChooseCarPageState createState() => _ChooseCarPageState();
}

class _ChooseCarPageState extends State<ChooseCarPage> {
  //选中的item
  final List<int> _selectIndex = [];

  final List<CarListModel> _chooseModels = [];

  String _search = '';

  List<CarListModel> models = [
  ];

  late TextEditingController _editingController;

  late FocusNode _contentFocusNode;

  bool _onLoad = true;

  int _page = 1;
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  @override
  void initState() {
    super.initState();
    _contentFocusNode = FocusNode();
    _editingController = TextEditingController();
  }

  @override
  void dispose() {
    _editingController.dispose();
    _contentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: bodyColor,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _getAppbar() ?? const SizedBox(),
            Expanded(
              child:
              EasyRefresh(
                firstRefresh: true,
                header: MaterialHeader(),
                footer: MaterialFooter(),
                controller: _easyRefreshController,
                onRefresh: () async {
                  _page = 1;
                  models = await CarFunc.getCarList(_page,10);
                  _onLoad = false;
                  setState(() {});
                },
                onLoad: () async {
                  _page++;
                 // models = await CarFunc.getCarList(_page);
                  BaseListModel baseList=   await apiClient
                      .requestList(API.car.getCarLists, data: {'page': _page, 'size': 10});

                  if (baseList.nullSafetyTotal > models.length) {
                    models.addAll(baseList.nullSafetyList
                        .map((e) => CarListModel.fromJson(e))
                        .toList());
                  } else {
                    _easyRefreshController.finishLoad(noMore: true);
                  }
                  setState(() {});
                },
                child:

                _onLoad?const SizedBox():
                models.isEmpty?const NoDataWidget(text: '暂无相关车辆信息',paddingTop: 300,):
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 32.w),
                  itemBuilder: (BuildContext context, int index) {
                    return _getItem(index, models[index]);
                  },
                  itemCount: models.length,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 30.w),
          height: 150.w,
          color: kForeGroundColor,
          child: GestureDetector(
            onTap: () {
              if (_selectIndex.isEmpty) {
                BotToast.showText(text: '请先选择车辆');
              } else {
                widget.callback(models[_selectIndex.first].modelName ,models[_selectIndex.first].id);
                Get.back();
              }
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              padding: EdgeInsets.symmetric(vertical: 16.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: <Color>[
                    Color(0xFF0593FF),
                    Color(0xFF027AFF),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.w)),
              ),
              child: Text(
                '确定选择',
                style: TextStyle(
                    color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
              ),
            ),
          ),
        ),
      ),
    );

  }

  _getAppbar() {
    return SearchBarWidget(callback: (String text) {
      _search  = text;
    }, tips: '请输入车辆名称', title:Container(
      alignment: Alignment.center,
      child: Text(
        widget.title,
        style: TextStyle(
            color: const Color(0xFF111111), fontSize: BaseStyle.fontSize36),
      ),
    ),);
  }

  _getItem(int index, CarListModel model) {
    return GestureDetector(
      onTap: () {
        if (_selectIndex.contains(index)) {
          _selectIndex.remove(index);
          _chooseModels.remove(model);
        } else {
          _selectIndex.clear();
          _selectIndex.add(index);
          _chooseModels.add(model);
        }
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
        margin: EdgeInsets.symmetric(horizontal: 32.w),
        // width: double.infinity,
        height: 250.w,
        child: Row(
          children: [
            Container(
              color: Colors.transparent,
              height: 230.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: double.infinity,
                alignment: Alignment.center,
                child: BeeCheckRadio(
                  value: index,
                  groupValue: _selectIndex,
                  //backColor: Colors.blue,
                  // indent: Container(
                  //   width: 24.w,
                  //   height: 24.w,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(22.w),
                  //       border: Border.all(color: Color(0xFFCCCCCC),width: 2.w)),
                  // ),
                ),
              ),
            ),
            Expanded(
              child: CarItemWidget(
                widgetPadding:
                EdgeInsets.symmetric(horizontal: 24.w),
                name: model.modelName,
                time: DateUtil.formatDateMs(
                    model.licensingDate.toInt() * 1000,
                    format: 'yyyy年MM月'),
                distance: model.mileage + '万公里',
                // standard: '国六',
                url: model.mainPhoto,
                price:
                NumUtil.divide(num.parse(model.price), 10000).toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
