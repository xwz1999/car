import 'package:cloud_car/model/task/task_invite_list_model.dart';
import 'package:cloud_car/ui/home/car_manager/Initiate_contract_page.dart';
import 'package:cloud_car/ui/home/car_manager/invite_detail_page.dart';
import 'package:cloud_car/ui/home/user_manager/customers_browse_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

class UserInvitePage extends StatefulWidget {
  final TaskInviteListModel model;
  const UserInvitePage({
    super.key,
    required this.model,
  });

  @override
  _UserInvitePageState createState() => _UserInvitePageState();
}

class _UserInvitePageState extends State<UserInvitePage>
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
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  primary: false,
                  floating: false,
                  pinned: true,
                  snap: false,
                  elevation: 0,
                  toolbarHeight:
                      MediaQuery.of(context).padding.top + kToolbarHeight,
                  expandedHeight: 0.w,
                  leadingWidth: 0,
                  titleSpacing: 0,
                  title: Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    height: kToolbarHeight + MediaQuery.of(context).padding.top,
                    child: Row(
                      children: [
                        const CloudBackButton(),
                        30.wb,
                        const Text('??????'),
                        const Spacer(),
                        _isImportant
                            ? GestureDetector(
                                onTap: () {
                                  _isImportant = false;
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
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 32.w),
                                  child: Text(
                                    '????????????',
                                    style: TextStyle(
                                      color: BaseStyle.color999999,
                                      fontSize: BaseStyle.fontSize28,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  leading: Image.asset(
                    Assets.images.importantUser.path,
                    width: 130.w,
                    fit: BoxFit.fitWidth,
                  ),
                  // collapsedHeight:kToolbarHeight,
                  backgroundColor: const Color(0xFFF6F6F6),
                  // flexibleSpace: FlexibleSpaceBar(
                  //   titlePadding: EdgeInsets.zero,
                  //   background: Container(
                  //     alignment: Alignment.center,
                  //     width: double.infinity,
                  //     //
                  //     //height: double.infinity,
                  //
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         165.hb,
                  //         Container(
                  //           decoration:
                  //               const BoxDecoration(color: Colors.white),
                  //           margin: EdgeInsets.only(
                  //             left: 32.w,
                  //             right: 32.w,
                  //             top: 24.w,
                  //           ),
                  //           padding: EdgeInsets.symmetric(
                  //               horizontal: 32.w, vertical: 24.w),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 '????????????',
                  //                 style: TextStyle(
                  //                     color: BaseStyle.color333333,
                  //                     fontSize: BaseStyle.fontSize32,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //               16.hb,
                  //               _getText('?????????', '11209381209380'),
                  //               16.hb,
                  //               _getText('?????????', '1122133'),
                  //               16.hb,
                  //               _getText('????????????', '2021-01-01 12???22???00'),
                  //               16.hb,
                  //               _getText('????????????', '???????????????'),
                  //               16.hb,
                  //               _getText('????????????', '2021-01-01 12???22???00'),
                  //               16.hb,
                  //               _getText(
                  //                 '??????',
                  //                 UserTool.userProvider.userInfo.nickname,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         50.hb,
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(kToolbarHeight - 10.w),
                    child: Container(
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
                          labelPadding: EdgeInsets.symmetric(
                              vertical: 10.w, horizontal: 40.w),
                          controller: _tabController,
                          indicatorWeight: 3,
                          labelColor: kPrimaryColor,
                          unselectedLabelColor: BaseStyle.color333333,
                          indicatorPadding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 0.w),
                          indicatorSize: TabBarIndicatorSize.label,
                          labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                          ),
                          indicator: const BoxDecoration(),
                          indicatorColor: kPrimaryColor,
                          tabs: [
                            _tab(0, '????????????'),
                            _tab(1, '????????????'),
                            _tab(2, '????????????')
                          ]),
                    ),
                  )),
            ];
          },
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: 120.w),
            child: TabBarView(
              controller: _tabController,
              children: [
                CustomersBrowsePage(
                  customerId: widget.model.customerId,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        index == 0
                            ? Container(
                                width: double.infinity,
                                height: 40.w,
                                color: Colors.white,
                              )
                            : const SizedBox(),
                        _getListItem(index, index < 2),
                      ],
                    );
                  },
                  itemCount: 5,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        index == 0
                            ? Container(
                                width: double.infinity,
                                height: 40.w,
                                color: Colors.white,
                              )
                            : const SizedBox(),
                        _getListItem(index, index < 2),
                      ],
                    );
                  },
                  itemCount: 5,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.red,
          height: 120.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: _getBottom(Assets.icons.icPhone.path, '??????', () {
                Alert.show(
                    context,
                    NormalContentDialog(
                      type: NormalTextDialogType.delete,
                      content: RichText(
                        text: TextSpan(
                            text: '??????????????????',
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
                      items: const ['??????'],
                      listener: (index) {
                        Alert.dismiss(context);
                      },
                      deleteListener: () {
                        Alert.dismiss(context);
                      },
                      title: '????????????',
                      deleteItem: '??????',
                    ));
              })),
              Expanded(child: _getBottom(Assets.icons.icWx.path, '??????', () {})),
              Expanded(
                  child: _getBottom(Assets.icons.icInvite.path, '????????????', () {
                Get.to(() => InviteDetailPage(
                      id: widget.model.customerId,
                      phone: '',
                      name: widget.model.customerNickname,
                    ));
              })),
              Expanded(
                  child: _getBottom(Assets.icons.icContract.path, '????????????', () {
                Get.to(() => const InitiateContractPage());
              })),
            ],
          ),
        ));
  }

  _getBottom(String url, String text, Function callBack) {
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

  _getListItem(int index, bool ing) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 32.w),
              height: double.infinity,
              child: Column(
                children: [
                  index != 0
                      ? Container(
                          width: 2.w,
                          height: 10.w,
                          decoration: BoxDecoration(
                            color: ing ? kPrimaryColor : BaseStyle.colorcccccc,
                          ),
                        )
                      : const SizedBox(),
                  Container(
                    margin: EdgeInsets.only(top: index != 0 ? 0 : 10.w),
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      color: ing ? kPrimaryColor : BaseStyle.colorcccccc,
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 2.w,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: ing ? kPrimaryColor : BaseStyle.colorcccccc,
                      ),
                    ),
                  )
                ],
              ),
            ),
            30.wb,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text('????????????'),
                    Text(' ??? '),
                    Text('????????????-???????????????-????????????'),
                  ],
                ),
                16.hb,
                const Text('2021-12-01 09:30:12'),
                16.hb,
                Container(
                  width: 560.w,
                  height: 200.w,
                  child: _getCarItem(
                    '',
                    '??????A8',
                    '2020-2',
                    '',
                    '31.56???',
                    '12.44?????????',
                  ),
                  decoration: BoxDecoration(
                    color: BaseStyle.colorf6f6f6,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                ),
                50.hb,
              ],
            ),
          ],
        ),
      ),
    );
  }

  _getCarItem(String url, String name, String time, String distance,
      String standard, String price) {
    return Container(
      padding: EdgeInsets.only(left: 24.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            //??????
            width: 200.w, height: 150.w,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.w)),
                child: url.contains('http')
                    ? FadeInImage.assetNetwork(
                        image: url,
                        fit: BoxFit.cover,
                        placeholder: '',
                      )
                    : Image.asset(url),
              ),
            ),
          ),
          24.wb,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: BaseStyle.color111111,
                      fontSize: BaseStyle.fontSize28,
                      fontWeight: FontWeight.bold),
                ),
                16.hb,
                Row(
                  children: [
                    _getTextView(time),
                    16.wb,
                    _getTextView(distance),
                    16.wb,
                    _getTextView(standard),
                  ],
                ),
                16.hb,
                Text(
                  price,
                  style: TextStyle(
                    color: const Color(0xFFFF3B02),
                    fontSize: BaseStyle.fontSize36,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getTextView(String text) {
    return text.isNotEmpty
        ? Container(
            decoration: BoxDecoration(
                color: const Color(0xFFF1F2F4),
                borderRadius: BorderRadius.all(Radius.circular(2.w))),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
            child: Text(
              text,
              style: TextStyle(
                color: const Color(0xFF4F5A74),
                fontSize: 20.sp,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        : const SizedBox();
  }
}
