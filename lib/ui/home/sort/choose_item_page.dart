
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';


typedef CarCallback = Function(String name,);

class ChooseItemPage extends StatefulWidget {
  final CarCallback callback;
  final String name;
  final List<String> items;

  const ChooseItemPage(
      {Key? key, required this.name, required this.callback, required this.items})
      : super(key: key);

  @override
  _ChooseItemPageState createState() => _ChooseItemPageState();
}

class _ChooseItemPageState extends State<ChooseItemPage> {
  late String name;

  late List<String> items;

  @override
  void initState() {
    name = widget.name;

    items = widget.items;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 32.sp,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: items.isEmpty
          ? const SizedBox()
          : ListView.separated(
              padding: EdgeInsets.only(top: 20.w),
              itemBuilder: (context, index) {
                return _getItem(items[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
               return  Padding(
                 padding: EdgeInsets.only(left: 24.w, right: 24.w,),
                 child: Container(

                    width: double.infinity,
                    color: const Color(0xFFEEEEEE),
                    height: 1.w,
                  ),
               );
              },
              itemCount: items.length,
            ),
    );
  }

  _getItem(String text) {
    return GestureDetector(
      onTap: (){
        widget.callback(text);
      },
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 32.w),
          alignment: Alignment.centerLeft,
          color: Colors.transparent,
          child: Text(
            text,
            style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 28.sp,
                ),
          ),
        ),
      ],
    ));
  }
}
