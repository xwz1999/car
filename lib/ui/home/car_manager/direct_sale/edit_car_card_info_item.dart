import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/colud_check_radio.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EditCardInfoItem extends StatefulWidget {
  const EditCardInfoItem({Key? key}) : super(key: key);

  @override
  _EditCardInfoItemState createState() => _EditCardInfoItemState();
}

class _EditCardInfoItemState extends State<EditCardInfoItem> {
  final List<int> _selectIndex1 = [];

  final List<int> _selectIndex2 = [];

  final List<String> _models1 = ['有', '无'];

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
    return Container(
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
          title: '过户次数',
          value: '1',
          callback: (String content) {},
          endText: '次',
          topIcon: false,
        ),
        EditItemWidget(
          title: '钥匙数量',
          value: '2',
          callback: (String content) {},
          endText: '把',
          topIcon: false,
        ),

        Padding(
          padding: EdgeInsets.only(top: 40.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Padding(
                      padding: EdgeInsets.only(top: 10.w),
                      child: Text(
                        '*  ',
                        style: TextStyle(
                          fontSize: 28.sp,
                          color: const Color(0xFFE62222),
                        ),
                      ),
                    ),
              SizedBox(
                width: 170.w,
                child: Text(
                  '交强险',
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color(0xFF999999),
                  ),
                ),
              ),
              SizedBox(
                height: 50.w,
                child: getChooseList(
                        (String choice) {}, _models1, _selectIndex1),
              ),
            ],
          ),
        ),
        getContentItem('交强险到期', '2021-12-01',
            path: Assets.icons.icGoto.path, topIcon: false, isSpecial: true),

        Padding(
          padding: EdgeInsets.only(top: 40.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Text(
                  '*  ',
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color(0xFFE62222),
                  ),
                ),
              ),
              SizedBox(
                width: 170.w,
                child: Text(
                  '商业险',
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color(0xFF999999),
                  ),
                ),
              ),
              SizedBox(
                height: 50.w,
                child: getChooseList(
                        (String choice) {}, _models1, _selectIndex2),
              ),
            ],
          ),
        ),

        getContentItem('商业险到期', '2021-12-01',
            path: Assets.icons.icGoto.path, topIcon: false, isSpecial: true),
        EditItemWidget(
          title: '商业金额险',
          value: '100020.0',
          callback: (String content) {},
          endText: '元',
          topIcon: false,
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
