import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

import '../ui/home/citylist_custom_header_page.dart';
import 'drop_down_widget.dart';

class DropDownPage extends StatefulWidget {
  const DropDownPage({Key? key}) : super(key: key);

  @override
  _DropDownPageState createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  List<String> titles = ["北京", "招标类型", "更多筛选"];
  List<Widget> listWidget = [];
  ScreenControl screenControl = ScreenControl();
  List<String> types = ["全部", "招标", "中标", "公示"];

  @override
  void initState() {
    listWidget = [
      const CityListCustomHeaderPage(),
      // Row(
      //   children: [
      //     Expanded(
      //         flex: 1,
      //         child: ListView.builder(itemBuilder: (context, index) {
      //           return InkWell(
      //             onTap: () {},
      //             child: Container(
      //               decoration: const BoxDecoration(
      //                   border: Border(
      //                       bottom: BorderSide(color: Color(0xffdddddd)))),
      //               padding: EdgeInsets.all(10.r),
      //               child: Text("北京", style: TextStyle(fontSize: 14.sp)),
      //             ),
      //           );
      //         })),
      //     Expanded(
      //         flex: 1,
      //         child: ListView.builder(itemBuilder: (context, index) {
      //           return InkWell(
      //             onTap: () {
      //               titles[0] = "省份";
      //               screenControl.screenHide();
      //             },
      //             child: Container(
      //               decoration: const BoxDecoration(
      //                   color: Color(0xffdddddd),
      //                   border: Border(
      //                       bottom: BorderSide(color: Color(0xffffffff)))),
      //               padding: EdgeInsets.all(10.r),
      //               child: Text("北京", style: TextStyle(fontSize: 14.sp)),
      //             ),
      //           );
      //         }))
      //   ],
      // ),
      ListView.builder(
          shrinkWrap: true,
          itemCount: types.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xffdddddd)))),
              padding: EdgeInsets.all(10.w),
              child: InkWell(
                  onTap: () {
                    titles[1] = types[index];
                    screenControl.screenHide();
                  },
                  child: Text(
                    types[index],
                    style: TextStyle(fontSize: 14.sp),
                  )),
            );
          }),
      ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 15.r, top: 10.r, right: 15.r, bottom: 10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("检索内容",
                    style:
                        TextStyle(fontSize: 14.r, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "全部",
                        style: TextStyle(fontSize: 14.r),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "标题",
                        style: TextStyle(fontSize: 14.r),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "内容",
                        style: TextStyle(fontSize: 14.r),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.r, right: 15.r, bottom: 10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("匹配方式",
                    style:
                        TextStyle(fontSize: 14.r, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "全部",
                        style: TextStyle(fontSize: 14.r),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "模糊",
                        style: TextStyle(fontSize: 14.r),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "精准",
                        style: TextStyle(fontSize: 14.r),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('筛选组件'),
        ),
        body: DropDownWidget(
          titles,
          listWidget,
          height: 40.r,
          bottomHeight: 400.r,
          screenControl: screenControl,
          headFontSize: 16.sp,
          child: Container(
            margin: EdgeInsets.only(top: 40.4.r),
            child: ListView.builder(itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(15.r),
                child: Text("item $index"),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: const Color(0xffeeeeee), width: 0.4.r))),
              );
            }),
          ),
          screen: '筛选',
        ));
  }
}
