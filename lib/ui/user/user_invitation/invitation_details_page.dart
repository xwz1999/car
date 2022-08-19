import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/model/task/task_invite_list_model.dart';
import 'package:cloud_car/ui/home/car_manager/Initiate_contract_page.dart';
import 'package:cloud_car/ui/home/car_manager/invite_detail_page.dart';
import 'package:cloud_car/ui/user/user_invitation/invitation_details_lists.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

class InvitaionDetailsPage extends StatefulWidget {
  final TaskInviteListModel model;

  const InvitaionDetailsPage({super.key, required this.model});

  @override
  _InvitaionDetailsPageState createState() => _InvitaionDetailsPageState();
}

class _InvitaionDetailsPageState extends State<InvitaionDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isImportant = false;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
        extendBody: true,
        appBar: AppBar(
          leading: const CloudBackButton(),
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.model.customerNickname,
                style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF111111)),
              ),
            ],
          ),
          titleSpacing: 0,
          actions: [
            _isImportant
                ? GestureDetector(
                    onTap: () {
                      _isImportant = false;
                      BotToast.showText(text: '取消成功');
                      setState(() {});
                    },
                    child: Image.asset(
                      Assets.images.importantUser.path,
                      width: 130.w,
                      fit: BoxFit.fitWidth,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      _isImportant = true;
                      BotToast.showText(text: '重点客户设置成功');
                      setState(() {});
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 32.w),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          '设为重要',
                          style: TextStyle(
                            color: BaseStyle.color999999,
                            fontSize: BaseStyle.fontSize28,
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: kToolbarHeight - 10.w,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          color: BaseStyle.colordddddd, width: 2.w))),
              child: TabBar(
                  onTap: (index) {
                    setState(() {});
                  },
                  isScrollable: true,
                  labelPadding:
                      EdgeInsets.symmetric(vertical: 10.w, horizontal: 40.w),
                  controller: _tabController,
                  indicatorWeight: 3,
                  labelColor: kPrimaryColor,
                  unselectedLabelColor: BaseStyle.color333333,
                  indicatorPadding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 0.w),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                  ),
                  indicator: const BoxDecoration(),
                  indicatorColor: kPrimaryColor,
                  tabs: [_tab(0, '浏览车辆'), _tab(1, '客户轨迹'), _tab(2, '相关资料')]),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(bottom: 120.w),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    InvitationDetailsList(
                      customerId: widget.model.customerId,
                      type: widget.model.type + 1,
                    ),
                    InvitationDetailsList(
                      customerId: widget.model.customerId,
                      type: widget.model.type + 1,
                    ),
                    InvitationDetailsList(
                      customerId: widget.model.customerId,
                      type: widget.model.type + 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 120.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: getBottom(Assets.icons.icPhone.path, '电话', () {
                Alert.show(
                    context,
                    NormalContentDialog(
                      type: NormalTextDialogType.delete,
                      content: RichText(
                        text: TextSpan(
                            text: '是否拨打电话',
                            style: TextStyle(
                                color: BaseStyle.color333333,
                                fontSize: BaseStyle.fontSize28),
                            children: [
                              TextSpan(
                                text: '[1289038123093]',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: BaseStyle.fontSize28),
                              ),
                              TextSpan(
                                text: '?',
                                style: TextStyle(
                                    color: BaseStyle.color333333,
                                    fontSize: BaseStyle.fontSize28),
                              ),
                            ]),
                      ),
                      items: const ['取消'],
                      listener: (index) {
                        Alert.dismiss(context);
                      },
                      deleteListener: () {
                        Alert.dismiss(context);
                      },
                      title: '呼出提示',
                      deleteItem: '确定',
                    ));
              })),
              Expanded(child: getBottom(Assets.icons.icWx.path, '微信', () {})),
              // Expanded(
              //     child: getBottom(Assets.icons.icInvite.path, '修改邀约', () {
              //   Get.to(() => InviteDetailPage(
              //         id: widget.model.customerId,
              //         phone: '',
              //         name: widget.model.customerNickname,
              //       ));
              // })),
              // Expanded(
              //     child: getBottom(Assets.icons.icContract.path, '发起合同', () {
              //   Get.to(() => const InitiateContractPage());
              // })),
            ],
          ),
        ));
  }

  getBottom(String url, String text, Function callBack) {
    return GestureDetector(
      onTap: () {
        callBack();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            url,
            width: 56.w,
            height: 56.w,
          ),
          Text(
            text,
            style: TextStyle(color: BaseStyle.color333333, fontSize: 24.sp),
          )
        ],
      ),
    );
  }

  _tab(int index, String text) {
    return Text(text);
  }
}
