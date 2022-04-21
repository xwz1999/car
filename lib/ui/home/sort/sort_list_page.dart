
import 'package:cloud_car/ui/home/sort/choose_car_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/sort_edit_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widget/sort_list_widget.dart';

typedef ItemCallback = Function(ChooseItem item);

class SortListPage extends StatefulWidget {
  final ItemCallback callback;

  const SortListPage({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  _SortListPageState createState() => _SortListPageState();
}

///根据筛选的json 把筛选页面的所有数据放入model里传回
class _SortListPageState extends State<SortListPage> {
  List<ChooseItem> _price  = [];
  List<ChooseItem> _structure  = [];
  List<ChooseItem> _gearbox  = [];
  List<ChooseItem> _mileage = [];
  List<ChooseItem> _emission  = [];

  String _carName = '不限品牌';


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
      ChooseItem(name: '手动'),
      ChooseItem(name: '自动'),
    ];
    _mileage = [
      ChooseItem(name: '1万公里内'),
      ChooseItem(name: '3万公里内'),
      ChooseItem(name: '5公里内'),
      ChooseItem(name: '8万公里内'),
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
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 32.w,right: 32.w,top: 100.w),
      children: [
        SortListWidget(

          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (ChooseItem item) {
            widget.callback(item);
          },
          title: '品牌车型',
          rightWidget: GestureDetector(
            onTap: (){
              Get.to(()=> ChooseCarPage(callback: (String name, int id) {
                Get.back();
                Get.back();
                Get.back();
                _carName = name;
                setState(() {
                });
              },));
            },
            child: Container(
              color: Colors.transparent,
              width: 400.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Expanded(child: Text(_carName,style: Theme.of(context).textTheme.subtitle2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.end,),),
                  10.wb,
                  Padding(
                    padding:  EdgeInsets.only(top: 5.w),
                    child: Icon(CupertinoIcons.chevron_forward,size: 40.w,color: BaseStyle.colordddddd,),
                  )
                ],
              ),
            ),
          ),
        ),
        16.hb,
        SortListWidget(
          itemList: _price,
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (ChooseItem item) {},
          title: '展示价格',
          rightWidget: GestureDetector(
            onTap: (){

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SortEditWidget(callback: (String content) {

                },),
                5.wb,
                Container(
                  color: const Color(0xFFDDDDDD),
                  width: 8.w,
                  height: 2.w,
                ),
                5.wb,
                SortEditWidget(callback: (String content) {

                },),
                10.wb,

                Text('万元',style: Theme.of(context).textTheme.subtitle2,),

              ],
            ),
          ),
        ),
        16.hb,
        SortListWidget(
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (ChooseItem item) {
            widget.callback(item);
          },
          title: '首次上牌',
          rightWidget: GestureDetector(
            onTap: (){

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('请选择',style: Theme.of(context).textTheme.subtitle2,),
                10.wb,
                Padding(
                  padding:  EdgeInsets.only(top: 5.w),
                  child: Icon(CupertinoIcons.chevron_forward,size: 40.w,color: BaseStyle.colordddddd,),
                )
              ],
            ),
          ),

        ),
        16.hb,
        SortListWidget(
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (ChooseItem item) {
            widget.callback(item);
          },
          title: '门店',
          rightWidget: GestureDetector(
            onTap: (){

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('请选择',style: Theme.of(context).textTheme.subtitle2,),
                10.wb,
                Padding(
                  padding:  EdgeInsets.only(top: 5.w),
                  child: Icon(CupertinoIcons.chevron_forward,size: 40.w,color: BaseStyle.colordddddd,),
                )
              ],
            ),
          ),
        ),
        16.hb,
        SortListWidget(
          itemList: _structure,
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (ChooseItem item) {
            widget.callback(item);
          },
          title: '车身结构',
        ),
        16.hb,
        SortListWidget(
          itemList: _gearbox,
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (ChooseItem item) {
            widget.callback(item);
          },
          title: '变速箱类型',
        ),
        16.hb,
        SortListWidget(
          itemList: _mileage,
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (ChooseItem item) {
            widget.callback(item);
          },
          title: '表显里程',
          rightWidget: GestureDetector(
            onTap: (){

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SortEditWidget(callback: (String content) {

                },),
                5.wb,
                Container(
                  color: const Color(0xFFDDDDDD),
                  width: 8.w,
                  height: 2.w,
                ),
                5.wb,
                SortEditWidget(callback: (String content) {

                },),
                10.wb,

                Text('万公里',style: Theme.of(context).textTheme.subtitle2,),

              ],
            ),
          ),
        ),
        16.hb,
        SortListWidget(
          itemList: _emission,
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          callback: (ChooseItem item) {
            widget.callback(item);
          },
          title: '排放标准',
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
      onTap: () {

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
          style: TextStyle(
              color: kPrimaryColor, fontSize: BaseStyle.fontSize28),
        ),
      ),
    );
  }


}
