import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/colud_check_radio.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../model/car/new_car_info.dart';



class EditCarPriceInfoItem extends StatefulWidget {
  final NewCarInfo carListModel;
  const EditCarPriceInfoItem({super.key,required this.carListModel});

  @override
  _EditCarPriceInfoItemState createState() => _EditCarPriceInfoItemState();
}

class _EditCarPriceInfoItemState extends State<EditCarPriceInfoItem> {


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 32.w, right: 32.w),
        children: [
          getItem1(),
          30.hb,
        ],
      ),
    );
  }

  getItem(String path) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Image.asset(
          path,
          fit: BoxFit.fitHeight,
          height: 150.w,
          width: 200.w,
        ),
      ),
    );
  }

  getItem1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditItemWidget(
          title: '展示价格',
          value: '27.65',
          callback: (String content) {},
          endText: '万元',


        ),
        EditItemWidget(
          canChange: false,
          title: '系统估价',
          value: '26.12',
          callback: (String content) {},
          endText: '万元',


        ),


      ],
    );
  }

  getContentItem(String title, String content,
      {isSpecial = false, path, topIcon = true}) {
    return Padding(
      padding: EdgeInsets.only(top: 40.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topIcon
              ? Padding(
                  padding: EdgeInsets.only(top: 10.w),
                  child: Text(
                    '*  ',
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: const Color(0xFFE62222),
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(top: 10.w),
                  child: Text(
                    '*  ',
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: Colors.transparent,
                    ),
                  ),
                ),
          SizedBox(
            width: 170.w,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 28.sp,
                color: const Color(0xFF999999),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(top: isSpecial ? 10.w : 0.w),
            child: Text(
              content.isEmpty ? '/' : content,
              style: TextStyle(fontSize: 28.sp, color: BaseStyle.color333333),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )),
          path != null
              ? Image.asset(
                  path,
                  width: 32.w,
                  height: 32.w,
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  getChooseList(Function(String) callBack, List models, List<int> choices) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        ...models
            .mapIndexed((currentValue, index) => GestureDetector(
                  onTap: () {
                    if (choices.contains(index)) {
                      choices.remove(index);
                    } else {
                      choices.clear();
                      choices.add(index);
                    }
                    setState(() {});
                  },
                  child: Container(
                    width: 160.w,
                    color: Colors.white,
                    child: Row(
                      children: [
                        BeeCheckRadio(
                          value: index,
                          groupValue: choices,
                        ),
                        16.wb,
                        Text(
                          currentValue,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ],
    );
  }
}
