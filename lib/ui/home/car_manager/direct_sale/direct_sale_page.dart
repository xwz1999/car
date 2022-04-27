import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:cloud_car/widget/choose_widget.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DirectSalePage extends StatefulWidget {
  final int type;

  ///1未直卖 2为收购
  final Function callBack;
  const DirectSalePage({Key? key, required this.callBack, required this.type})
      : super(key: key);

  @override
  _DirectSalePageState createState() => _DirectSalePageState();
}

class _DirectSalePageState extends State<DirectSalePage> {
  final List<String> _dropDownHeaderItemStrings = [
    '排序',
  ];

  ScreenControl screenControl = ScreenControl();

  List<Widget> listWidget = [];
  List<ChooseItem> _sortList = [];
  @override
  void initState() {
    super.initState();

    _sortList = [
      ChooseItem(name: '最近创建'),
      ChooseItem(name: '标价最高'),
      ChooseItem(name: '标价最低'),
      ChooseItem(name: '车龄最短'),
      ChooseItem(name: '里程最少'),
      ChooseItem(name: '最近更新'),
    ];

    listWidget = [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.w)),
            color: kForeGroundColor),
        clipBehavior: Clip.antiAlias,
        child: ScreenWidget(pickString: '',
          childAspectRatio: 144 / 56,
          callback: (String item) {
            if (kDebugMode) {
              print(item);
            }

            ///调研接口 按照item进行排序
            screenControl.screenHide();
            setState(() {});
          },
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          haveButton: true,
          itemList: _sortList,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: kToolbarHeight,
        ),
        // ChooseWidget(
        //   callBack: (name) {
        //     setState(() {});
        //   },
        //   items: const [
        //     '在售',
        //     '已预定',
        //     '已售',
        //     '退库',
        //     '待审核',
        //     '已驳回',
        //   ],
        // ),
        Divider(
          height: 1.w,
          color: BaseStyle.colordddddd,
        ),
        Expanded(
          child: DropDownWidget(
            _dropDownHeaderItemStrings,
            listWidget,
            height: 76.w,
            bottomHeight: 24.w,
            screenControl: screenControl,
            headFontSize: 28.sp,
            child: Container(
              margin: EdgeInsets.only(top: 80.w),
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
                itemBuilder: (context, index) {
                  return CarItemWidget(
                    widgetPadding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
                    name: '奔驰CLE 插电混动 纯电动续航103km',
                    time: '2019年5月',
                    distance: '20.43万公里',
                    standard: '国六',
                    url: Assets.images.homeBg.path,
                    price: '27.43万',
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    color: const Color(0xFFF6F6F6),
                    height: 16.w,
                  );
                },
                itemCount: 10,
              ),
            ),
            screen: '筛选',
            onTap: () {
              screenControl.screenHide();

              widget.callBack();
            },
          ),
        )
      ],
    );
  }
}
