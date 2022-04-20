
import 'package:cloud_car/ui/home/sort/choose_item_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/sort_list_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ItemCallback = Function(ChooseItem item);

class UserSortListPage extends StatefulWidget {
  final ItemCallback callback;

  const UserSortListPage({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  _UserSortListPageState createState() => _UserSortListPageState();
}

class _UserSortListPageState extends State<UserSortListPage> {

  List<ChooseItem> _gearbox  = [];



  @override
  void initState() {
    super.initState();

    _gearbox = [
      ChooseItem(name: '是'),
      ChooseItem(name: '否'),
    ];

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
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
              title: '门店',
              rightWidget: GestureDetector(
                onTap: (){
                  Get.to(()=>ChooseItemPage(callback: (String name) {
                    Get.back();

                  }, items: [
                    '1','2','3'
                  ], name: '门店',));
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
              callback: (ChooseItem item) {},
              title: '销售',
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
              itemList: _gearbox,
              childAspectRatio: 144 / 56,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 24.w,
              crossAxisCount: 4,
              callback: (ChooseItem item) {
                widget.callback(item);
              },
              title: '重要客户',
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
              title: '跟进时间',
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
              title: '注册时间',
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


          ],
        ),
        Positioned(bottom: 40.w,left: 30.w,
            child:       Row(
          children: [
            _resetBtn(),
            40.wb,
            _confirmBtn(),

          ],
        ))
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
