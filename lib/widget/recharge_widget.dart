import 'package:cloud_car/ui/user/user_assessment/assessment_pay.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/putup_widget.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef ItemCallback = Function(String item);

class RechargeWidget extends StatefulWidget {
  final List<ChooseItem> itemList;
  final ItemCallback callback;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final bool haveButton;

  const RechargeWidget(
      {Key? key,
      required this.itemList,
      required this.callback,
      required this.crossAxisCount,
      required this.mainAxisSpacing,
      required this.crossAxisSpacing,
      required this.childAspectRatio,
      this.haveButton = false})
      : super(key: key);

  @override
  _RechargeWidgetState createState() => _RechargeWidgetState();
}

class _RechargeWidgetState extends State<RechargeWidget> {
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
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 32.w,
            right: 32.w,
          ),
          child: SortWidget(
            crossAxisSpacing: widget.mainAxisSpacing,
            itemList: widget.itemList,
            childAspectRatio: widget.childAspectRatio,
            crossAxisCount: widget.crossAxisCount,
            mainAxisSpacing: widget.mainAxisSpacing,
            callback: (ChooseItem item, int index) {
              for (int i = 0; i < widget.itemList.length; i++) {
                if (i != index) {
                  widget.itemList[i].isChoose = false;
                } else {
                  widget.itemList[i].isChoose = !widget.itemList[i].isChoose;
                }
              }
              if (kDebugMode) {
                print(item.name);
              }
              setState(() {});
            },
          ),
        ),
        762.hb,
        widget.haveButton ? _confirmBtn() : const SizedBox(),
        //40.hb,
      ],
    );
  }

  _confirmBtn() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const AssessmentPayPage());
        // if (_chooseItem.isNotEmpty) {
        //   widget.callback(_chooseItem);
        // } else {
        //   print(_chooseItem);
        //   BotToast.showText(text: '请先选择一个充值类型');
        // }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.w),
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 32.w, right: 32.w),
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
          '充值',
          style: TextStyle(
              color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
        ),
      ),
    );
  }
}
