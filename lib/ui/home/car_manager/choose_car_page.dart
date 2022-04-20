import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/model/car_item_model.dart';

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/colud_check_radio.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:cloud_car/widget/search_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


typedef CarCallback = Function(String city);

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
  final List<CarItemModel> _chooseModels = [];

  String _search = '';

  List<CarItemModel> models = [
    CarItemModel(
      name: '奔驰CLE 插电混动 纯电动续航103km',
      time: '2019年5月',
      distance: '20.43万公里',
      standard: '国六',
      url: Assets.images.homeBg.path,
      price: '27.43万',
    ),
    CarItemModel(
      name: '奔驰CLE 插电混动 纯电动续航103km',
      time: '2019年5月',
      distance: '20.43万公里',
      standard: '国六',
      url: Assets.images.homeBg.path,
      price: '27.43万',
    ),
    CarItemModel(
      name: '奔驰CLE 插电混动 纯电动续航103km',
      time: '2019年5月',
      distance: '20.43万公里',
      standard: '国六',
      url: Assets.images.homeBg.path,
      price: '27.43万',
    ),
    CarItemModel(
      name: '奔驰CLE 插电混动 纯电动续航103km',
      time: '2019年5月',
      distance: '20.43万公里',
      standard: '国六',
      url: Assets.images.homeBg.path,
      price: '27.43万',
    ),
    CarItemModel(
      name: '奔驰CLE 插电混动 纯电动续航103km',
      time: '2019年5月',
      distance: '20.43万公里',
      standard: '国六',
      url: Assets.images.homeBg.path,
      price: '27.43万',
    ),
    CarItemModel(
      name: '奔驰CLE 插电混动 纯电动续航103km',
      time: '2019年5月',
      distance: '20.43万公里',
      standard: '国六',
      url: Assets.images.homeBg.path,
      price: '27.43万',
    ),
    CarItemModel(
      name: '奔驰CLE 插电混动 纯电动续航103km',
      time: '2019年5月',
      distance: '20.43万公里',
      standard: '国六',
      url: Assets.images.homeBg.path,
      price: '27.43万',
    ),
  ];

  late TextEditingController _editingController;
  String _searchText = "";
  late FocusNode _contentFocusNode;

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
              child: ListView.separated(
                padding:
                    EdgeInsets.only(left: 24.w, right: 24.w, top: 20.w),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _getItem(index, models[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    color: const Color(0xFFF6F6F6),
                    height: 16.w,
                  );
                },
                itemCount: models.length,
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
                widget.callback(models[_selectIndex.first].name ?? '');
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
      print(_search);
    }, tips: '请输入车辆名称', title:Container(
      alignment: Alignment.center,
      child: Text(
        widget.title,
        style: TextStyle(
            color: Color(0xFF111111), fontSize: BaseStyle.fontSize36),
      ),
    ),);
  }

  _getItem(int index, CarItemModel model) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
      // width: double.infinity,
      height: 250.w,
      child: Row(
        children: [
          GestureDetector(
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
          ),
          Expanded(
            child: CarItemWidget(
              widgetPadding: EdgeInsets.zero,
              name: '奔驰CLE 插电混动 纯电动续航103km',
              time: '2019年5月',
              distance: '20.43万公里',
              standard: '国六',
              url: Assets.images.homeBg.path,
              price: '27.43万',
            ),
          ),
        ],
      ),
    );
  }
}
