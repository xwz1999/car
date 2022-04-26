import 'package:cloud_car/model/sort/sort_series_model.dart';
import 'package:cloud_car/ui/home/sort/choose_car_last_page.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/ui/home/sort/sort_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';


class ChooseCarNextPage extends StatefulWidget {
  final VoidCallback callback;
  final String name;
  final int id;

  final ValueNotifier<SearchParamModel> pickCar;

  const ChooseCarNextPage(
      {Key? key,
      required this.name,
      required this.id,
      required this.callback,
      required this.pickCar})
      : super(key: key);

  @override
  _ChooseCarNextPageState createState() => _ChooseCarNextPageState();
}

class _ChooseCarNextPageState extends State<ChooseCarNextPage> {
  late String name;
  late int brandId;

  List<SortSeriesModel> _list = [];

  @override
  void initState() {
    name = widget.name;
    brandId = widget.id;
    Future.delayed(const Duration(milliseconds: 0), () {
      loadData();
    });
    super.initState();
  }

  void loadData() async {
    _list = await SortFunc.getSeriesList(brandId);
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
            Text(
              name,
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 32.sp,
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
                return Container();
              },
              itemCount: _list.length,
            ),
    );
  }

  _getItem(SortSeriesModel model) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 32.w),
          alignment: Alignment.centerLeft,
          color: const Color(0xFFf3f5f7),
          child: Text(
            model.name,
            style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 35.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        ...model.series.mapIndexed((e, index) {
          return GestureDetector(
            onTap: () async {
              widget.pickCar.value.series=model;
              if (widget.pickCar.value.returnType == 2) {
                Get.back();
                widget.callback();
                return;
              }
              Get.to(() => ChooseCarLastPage(
                    callback: widget.callback,
                    id: e.id,
                    name: name + ' >> ' + e.name,
                    pickCar: widget.pickCar,
                  ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              alignment: Alignment.centerLeft,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.hb,
                  Text(
                    e.name,
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 28.sp,
                    ),
                  ),
                  25.hb,
                  index != model.series.length - 1
                      ? Container(
                          width: double.infinity,
                          color: const Color(0xFFEEEEEE),
                          height: 1.w,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          );
        }).toList()
      ],
    );
  }
}
