import 'package:cloud_car/model/sort/sort_car_model_model.dart';

import 'package:cloud_car/ui/home/sort/sort_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';

import 'package:flutter/material.dart';

import 'carlist_page.dart';




class ChooseCarLastPage extends StatefulWidget {
  final VoidCallback callback;
  final String name;
  final int id;

  final ValueNotifier<SearchParamModel> pickCar;
  const ChooseCarLastPage(
      {Key? key, required this.name, required this.id, required this.callback, required this.pickCar})
      : super(key: key);

  @override
  _ChooseCarLastPageState createState() => _ChooseCarLastPageState();
}

class _ChooseCarLastPageState extends State<ChooseCarLastPage> {
  late String name;
  late int seriesId;

  List<SortCarModelModel> _list = [];

  @override
  void initState() {
    name = widget.name;
    seriesId = widget.id;
    Future.delayed(const Duration(milliseconds: 0), () {
      loadData();
    });
    super.initState();
  }

  void loadData() async {
    _list = await SortFunc.getModelList(seriesId);
    setState(() {});
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
      body: _list.isEmpty
          ? const SizedBox()
          : ListView.separated(
              padding: EdgeInsets.only(top: 20.w),
              itemBuilder: (context, index) {
                return _getItem(_list[index]);
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
              itemCount: _list.length,
            ),
    );
  }

  _getItem(SortCarModelModel model) {
    return GestureDetector(
      onTap: (){
        Get.back();
        Get.back();
        widget.pickCar.value.car=model;
        widget.callback();
      },
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 32.w),
          alignment: Alignment.centerLeft,
          color: Colors.transparent,
          child: Text(
            model.name,
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
