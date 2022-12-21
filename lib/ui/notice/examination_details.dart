import 'package:cloud_car/ui/notice/sell_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/car/new_car_info.dart';
import '../../model/contract/report_photo_model.dart';
import '../../widget/alert.dart';
import '../../widget/button/cloud_back_button.dart';
import '../../widget/button/cloud_bottom_button.dart';
import '../../widget/cloud_image_network_widget.dart';
import '../home/car_manager/publish_car/publish_finish_page.dart';
import '../home/car_manager/publish_car/push_car_manage_photo_page.dart';
import '../home/car_manager/publish_car/push_photo_model.dart';
import '../home/func/car_func.dart';
import '../user/user_order/status.dart';
import 'acquisition_widget.dart';
import 'modified_release_model.dart';

class ExaminationDetails extends StatefulWidget {
  ///审批状态  1出售，2修改 3发布  4 收购
  final int state;

  ///审核状态
  final int auditState;

  ///驳回理由
  final String reasonText;

  const ExaminationDetails({
    super.key,
    required this.state,
    required this.auditState,
    required this.reasonText,
  });

  @override
  _ExaminationDetailsState createState() => _ExaminationDetailsState();
}

class _ExaminationDetailsState extends State<ExaminationDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text(
          ReminderApprovalType.getValue(widget.state).typeStr,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      backgroundColor: bodyColor,
      extendBody: true,
      body: _getWidget(widget.state),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.w),
        decoration: BoxDecoration(
            border: Border.all(width: 1.w, color: const Color(0xFFEEEEEE)),
            color: Colors.white),
        height: widget.reasonText == '' ? 160.w : 200.w, //double.infinity,
        child: getBottomState(),
      ),
    );
  }

  _getWidget(int aState) {
    switch (aState) {
      case 1:
        return const SellWidget();

      case 2:
        return ModifiedReleaseModel(
          state: aState == 2,
        );
      case 3:
        return ModifiedReleaseModel(
          state: aState == 2,
        );
      case 4:
        return const AcquisitionWidget();
    }
  }

  getBottomState() {
    // switch (widget.state) {
    //
    //   ///出售申请
    //   case 1:
    return widget.auditState == 1

        ///1待审核 2已审核
        ? Row(
            children: [
              getContact(),
              28.wb,
              Expanded(
                  child: Row(
                children: [
                  getBox('驳回', Colors.white, 2, const Color(0xFF027AFF),
                      const Color(0xFF027AFF), () {
                    Alert.show(
                        context,
                        NormalContentDialog(
                          type: NormalTextDialogType.delete,
                          title: '驳回理由',
                          content: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4.w)),
                            child: const TextField(
                              maxLines: null,
                              minLines: 1,
                              decoration: InputDecoration(
                                hintText: '请输入',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          items: const ['取消'],
                          deleteItem: '确定',
                          //监听器
                          listener: (index) {
                            Get.back();
                            Alert.dismiss(context);
                          },
                          deleteListener: () {
                            CloudToast.show('驳回成功');
                            Alert.dismiss(context);
                          },
                        ));
                  }),
                  16.wb,
                  getBox('通过', const Color(0xFF027AFF), 0, Colors.white,
                      Colors.white, () {
                    Get.to(() => PublishFinishPage(
                          title: ReminderApprovalType.getValue(widget.state)
                              .typeStr,
                          remindText: '已同意',
                        ));
                  }),
                ],
              )),
            ],
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.reasonText == '' ? 32.hb : 0.hb,
                Row(
                  children: [
                    getContact(),
                    const Spacer(),
                    Text(
                      widget.reasonText == '' ? "已同意" : '已驳回',
                      style: TextStyle(
                          color: widget.reasonText == ''
                              ? const Color(0xFF027AFF)
                              : const Color(0xFFFF3B02),
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                // const Spacer(),
                8.hb,
                widget.reasonText == ''
                    ? const SizedBox()
                    : Flexible(
                        child: Text(
                          '驳回理由:${widget.reasonText}',
                          style: TextStyle(
                              fontSize: 28.sp,
                              color: const Color(0xFF333333),
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                widget.state == 2 || widget.state == 3
                    ? const Divider()
                    : const SizedBox(),
                widget.state == 2 || widget.state == 3
                    ? getBox(
                        widget.state == 2 ? '重新编辑' : '重新发布',
                        const Color(0xFF027AFF),
                        0,
                        Colors.white,
                        Colors.white,
                        () {})
                    : const SizedBox()

                // : Row(
                //     children: [
                //       Text(
                //         '驳回理由:',
                //         style: TextStyle(
                //             fontSize: 28.sp,
                //             color: const Color(0xFF333333),
                //             fontWeight: FontWeight.w600),
                //       ),
                //
                //     ],
                //   )
              ],
            ),
          );
    // }
  }

  getContact() {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          SizedBox(
            width: 64.w,
            height: 64.w,
            child: Image.asset(Assets.images.imgPhone.path),
          ),
          18.wb,
          Text(
            '联系TA',
            style: TextStyle(
              fontSize: 24.sp,
            ),
          )
        ],
      ),
    );
  }

  getBox(String text, Color bgColor, int bWidth, Color bColor, Color tColor,
      VoidCallback ontap) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        width: 240.w,
        height: 72.w,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: bgColor,
          border: Border.all(width: bWidth.w, color: bColor),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 28.w, color: tColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
