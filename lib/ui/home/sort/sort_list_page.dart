import 'package:cloud_car/ui/home/sort/choose_car_page.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/hive_store.dart';
import 'package:cloud_car/widget/cloud_bordered_text_field_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../widget/sort_list_widget.dart';


class SortListPage extends StatefulWidget {
  final ValueNotifier<SearchParamModel> pickCar;
  final VoidCallback onConfirm;


  const SortListPage({
    super.key,
    required this.pickCar,
    required this.onConfirm,
  });

  @override
  _SortListPageState createState() => _SortListPageState();
}

///根据筛选的json 把筛选页面的所有数据放入model里传回
class _SortListPageState extends State<SortListPage> {
  List<ChooseItem> _price = [];
  List<ChooseItem> _structure = [];
  List<ChooseItem> _gearbox = [];
  List<ChooseItem> _mileage = [];
  List<ChooseItem> _emission = [];
  List<ChooseItem> _carAge = [];
  List<ChooseItem> _fuel = [];

  TextEditingController editMinPriceController = TextEditingController();

  TextEditingController editMaxPriceController = TextEditingController();

  TextEditingController editMinMileController = TextEditingController();

  TextEditingController editMaxMileController = TextEditingController();

  String get _carName {
    return widget.pickCar.value.series.name.isEmpty
        ? '不限品牌'
        : '${widget.pickCar.value.brand.name}-${widget.pickCar.value.series.name}';
  }

  @override
  void initState() {
    super.initState();
    _price = [
      ChooseItem(name: '不限'),
      ChooseItem(name: '3万以下'),
      ChooseItem(name: '3-5万'),
      ChooseItem(name: '5-8万'),
      ChooseItem(name: '8-10万'),
      ChooseItem(name: '10-15万'),
      ChooseItem(name: '15-20万'),
      ChooseItem(name: '20-30万'),
      ChooseItem(name: '30-50万'),
      ChooseItem(name: '50-100万'),
      ChooseItem(name: '100万以上'),
    ];
    _structure = [
      ChooseItem(name: '客车'),
      ChooseItem(name: '货车'),
      ChooseItem(name: '三厢车'),
      ChooseItem(name: '两厢车'),
      ChooseItem(name: '旅行车'),
      ChooseItem(name: '皮卡'),
      ChooseItem(name: 'MVP'),
      ChooseItem(name: 'SUV'),
      ChooseItem(name: '掀背车'),
      ChooseItem(name: '软顶敞篷车'),
      ChooseItem(name: '硬顶敞篷车'),
      ChooseItem(name: '硬顶跑车'),
    ];
    _gearbox = [
      ChooseItem(name: '手自一体'),
      ChooseItem(name: '自动'),
      ChooseItem(name: '无级'),
      ChooseItem(name: '双离合'),
      ChooseItem(name: '手动'),
      ChooseItem(name: '电子无级'),
      ChooseItem(name: '机械式自动'),
      ChooseItem(name: '序列'),
      ChooseItem(name: 'ISR'),
      ChooseItem(name: '固定齿比'),
      ChooseItem(name: 'E-CVT+自动'),
      ChooseItem(name: '国际档'),
    ];
    _mileage = [
      ChooseItem(name: '1万公里内'),
      ChooseItem(name: '3万公里内'),
      ChooseItem(name: '5公里内'),
      ChooseItem(name: '8万公里内'),
    ];
    _fuel = [
      ChooseItem(name: '汽油'),
      ChooseItem(name: '柴油'),
      ChooseItem(name: '纯电动'),
      ChooseItem(name: '油电混合'),
      ChooseItem(name: '油气混合'),
      ChooseItem(name: '天然气'),
      ChooseItem(name: '氢能源'),
      ChooseItem(name: '甲醇'),
    ];
    _emission = [
      ChooseItem(name: '国一'),
      ChooseItem(name: '国二'),
      ChooseItem(name: '国三'),
      ChooseItem(name: '国四'),
      ChooseItem(name: '国五'),
      ChooseItem(name: '国六'),
      ChooseItem(name: '欧一'),
      ChooseItem(name: '欧二'),
      ChooseItem(name: '欧三'),
      ChooseItem(name: '欧四'),
      ChooseItem(name: '欧五'),
      ChooseItem(name: '欧六'),
    ];
    _carAge = [
      ChooseItem(name: '全部'),
      ChooseItem(name: '今年'),
      ChooseItem(name: '去年'),
      ChooseItem(name: '近3年'),
      ChooseItem(name: '近5年'),
      ChooseItem(name: '7年以上'),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    editMinPriceController.dispose();
    editMaxPriceController.dispose();
    editMinMileController.dispose();
    editMaxMileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 100.w),
      children: [
        SortListWidget(
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (m) {},
          title: '品牌车型',
          rightWidget: GestureDetector(
            onTap: () {
              Get.to(() => ChooseCarPage(
                    callback: () {
                      Get.back();
                      setState(() {});
                    },
                    pickCar: widget.pickCar,
                  ));
            },
            child: Container(
              color: Colors.transparent,
              width: 400.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      _carName,
                      style: Theme.of(context).textTheme.subtitle2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  10.wb,
                  Padding(
                    padding: EdgeInsets.only(top: 5.w),
                    child: Icon(
                      CupertinoIcons.chevron_forward,
                      size: 40.w,
                      color: BaseStyle.colordddddd,
                    ),
                  )
                ],
              ),
            ),
          ),
          pickString: '',
        ),
        16.hb,
        SortListWidget(
          itemList: _price,
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (ChooseItem item) {
            widget.pickCar.value.price = item.name;

            setState(() {});
          },
          title: '展示价格',
          rightWidget: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CloudBorderedTextFieldWidget(
                  controller: editMinPriceController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  // callback: (String content) {
                  //    widget.pickCar.value.editMinPrice = int.parse(content);
                  // },
                ),
                5.wb,
                Container(
                  color: const Color(0xFFDDDDDD),
                  width: 8.w,
                  height: 2.w,
                ),
                5.wb,
                CloudBorderedTextFieldWidget(
                  controller: editMaxPriceController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                ),
                10.wb,
                Text(
                  '万元',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
          pickString: widget.pickCar.value.price,
        ),
        16.hb,
        SortListWidget(
          itemList: _carAge,
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (ChooseItem item) {
            widget.pickCar.value.carAge = item.name;
            setState(() {});
          },
          title: '首次上牌',
          // rightWidget: GestureDetector(
          //   onTap: () {},
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         '请选择',
          //         style: Theme.of(context).textTheme.subtitle2,
          //       ),
          //       10.wb,
          //       Padding(
          //         padding: EdgeInsets.only(top: 5.w),
          //         child: Icon(
          //           CupertinoIcons.chevron_forward,
          //           size: 40.w,
          //           color: BaseStyle.colordddddd,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          pickString: widget.pickCar.value.carAge,
        ),
        16.hb,
        SortListWidget(
          itemList: _structure,
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (ChooseItem item) {
            widget.pickCar.value.struct = item.name;
            setState(() {});
          },
          title: '车身结构',
          pickString: widget.pickCar.value.struct,
        ),
        16.hb,
        SortListWidget(
          itemList: _gearbox,
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (ChooseItem item) {
            widget.pickCar.value.gear = item.name;
            setState(() {});
          },
          title: '变速箱类型',
          pickString: widget.pickCar.value.gear,
        ),
        16.hb,
        SortListWidget(
          itemList: _mileage,
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (ChooseItem item) {
            widget.pickCar.value.mile = item.name;
            setState(() {});
          },
          title: '表显里程',
          rightWidget: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CloudBorderedTextFieldWidget(
                  controller: editMinMileController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                ),
                5.wb,
                Container(
                  color: const Color(0xFFDDDDDD),
                  width: 8.w,
                  height: 2.w,
                ),
                5.wb,
                CloudBorderedTextFieldWidget(
                  controller: editMaxMileController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                ),
                10.wb,
                Text(
                  '万公里',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
          pickString: widget.pickCar.value.mile,
        ),
        16.hb,
        SortListWidget(
          itemList: _fuel,
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (ChooseItem item) {
            widget.pickCar.value.fuel = item.name;
            setState(() {});
          },
          title: '能源类型',
          pickString: widget.pickCar.value.fuel,
        ),
        16.hb,
        SortListWidget(
          itemList: _emission,
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (ChooseItem item) {
            widget.pickCar.value.dischargeStandard = item.name;
            setState(() {});
          },
          title: '排放标准',
          pickString: widget.pickCar.value.dischargeStandard,
        ),
        56.hb,
        Row(
          children: [
            _resetBtn(),
            40.wb,
            _confirmBtn(),
          ],
        )
      ],
    );
  }

  _confirmBtn() {
    return GestureDetector(
      onTap: () async {


        if (editMinPriceController.text.isNotEmpty) {
          widget.pickCar.value.editMinPrice =
              int.parse(editMinPriceController.text);
        }
        if (editMaxPriceController.text.isNotEmpty) {
          widget.pickCar.value.editMaxPrice =
              int.parse(editMaxPriceController.text);
        }
        if (editMinMileController.text.isNotEmpty) {
          widget.pickCar.value.editMinMile =
              int.parse(editMinMileController.text);
        }
        if (editMaxMileController.text.isNotEmpty) {
          widget.pickCar.value.editMaxMile =
              int.parse(editMaxMileController.text);
        }
        widget.onConfirm();

      },
      child: Container(
        width: 300.w,
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
          '确  定',
          style: TextStyle(
              color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
        ),
      ),
    );
  }

  _resetBtn() {
    return GestureDetector(
      onTap: () {
        widget.pickCar.value = SearchParamModel.init(returnType: 2);
        widget.onConfirm();
        HiveStore.carBox?.delete('screening');
        setState(() {});
      },
      child: Container(
        width: 240.w,
        padding: EdgeInsets.symmetric(vertical: 16.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
        ),
        child: Text(
          '重  置',
          style:
              TextStyle(color: kPrimaryColor, fontSize: BaseStyle.fontSize28),
        ),
      ),
    );
  }
}
