import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/extensions/map_extension.dart';
import 'package:cloud_car/extensions/string_extension.dart';
import 'package:cloud_car/model/customer/customer_list_model.dart';
import 'package:cloud_car/ui/home/func/customer_func.dart';
import 'package:cloud_car/ui/home/func/customer_map.dart';
import 'package:cloud_car/ui/home/sort/search_customer_param_model.dart';
import 'package:cloud_car/ui/home/user_manager/user_info_page.dart';
import 'package:cloud_car/ui/home/user_manager/user_manager_page.dart';
import 'package:cloud_car/ui/home/user_manager/user_sort_list_page.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/choose_widget.dart';
import 'package:cloud_car/widget/custom_drawer.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/search_bar_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class UserManagerDetailPage extends StatefulWidget {
  final CustomerClassify customerClassify;

  const UserManagerDetailPage({super.key, required this.customerClassify});

  @override
  _UserManagerDetailPageState createState() => _UserManagerDetailPageState();
}

class _UserManagerDetailPageState extends State<UserManagerDetailPage> {
  late List<String> _dropDownHeaderItemStrings;

  List<dynamic>? data;
  List<Widget> listWidget = [];
  ScreenControl screenControl = ScreenControl();

  late String sort = '';

  late String search = '';

  final EasyRefreshController _refreshController = EasyRefreshController();
  int _page = 1;

  List<ChooseItem> _sortList = [];

  List<CustomerListModel> _list = [];

  String title = '????????????';

  late ValueNotifier<SearchCustomerParamModel> sortModel = ValueNotifier(
      SearchCustomerParamModel(
          name: '',
          customerClassify: widget.customerClassify,
          createdDate: '',
          isImportant: '',
          trailDate: ''));

  Map<String, dynamic> get _params => {
        'name': sortModel.value.name,
        'status': sortModel.value.customerClassify.typeNum,
        'important': sortModel.value.important,
        'createdDateStart': sortModel.value.createdDateStart,
        'createdDateEnd': sortModel.value.createdDateEnd,
        'trailCreatedDateStart': sortModel.value.trailCreatedDateStart,
        'trailCreatedDateEnd': sortModel.value.trailCreatedDateEnd,
      };
  bool _onLoad = true;

  @override
  void initState() {
    super.initState();
    _dropDownHeaderItemStrings = [
      '??????',
    ];

    _sortList = [
      ChooseItem(name: '????????????'),
      ChooseItem(name: '????????????'),
    ];
  }

  List<Widget> get listWidgets => [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.w)),
              color: kForeGroundColor),
          clipBehavior: Clip.antiAlias,
          child: ScreenWidget(
            pickString: sort,
            childAspectRatio: 144 / 56,
            callback: (String item, int value) {
              sort = item;
              if (kDebugMode) {
                print(sort);
              }
              screenControl.screenHide();
              _refreshController.callRefresh();
              setState(() {});
            },
            mainAxisSpacing: 10.w,
            crossAxisSpacing: 24.w,
            crossAxisCount: 4,
            haveButton: true,
            itemList: _sortList,
          ),
        ),
      ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: CustomDrawer(
            widthPercent: 0.86,
            backgroundColor: Colors.white,
            callback: (bool isOpened) {},
            child: _getSortList()),
        backgroundColor: const Color(0xFFF6F6F6),
        extendBody: true,
        body: Column(
          children: [
            _getAppbar(),
            ChooseWidget(
              callBack: (index) {
                sortModel.value.customerClassify =
                    CustomerClassify.values[index];
                _refreshController.callRefresh();
              },
              items: CustomerClassify.values.map((e) => e.typeStr).toList(),
              item: sortModel.value.customerClassify.typeStr,
            ),
            Divider(
              height: 1.w,
              color: BaseStyle.colordddddd,
            ),
            Expanded(
              child: Builder(builder: (context) {
                return DropDownWidget(
                  _dropDownHeaderItemStrings,
                  listWidgets,
                  height: 76.w,
                  bottomHeight: 400.w,
                  screenControl: screenControl,
                  headFontSize: 28.sp,
                  screen: '??????',
                  onTap: () {
                    screenControl.screenHide();
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: EasyRefresh.custom(
                    firstRefresh: true,
                    controller: _refreshController,
                    header: MaterialHeader(),
                    onRefresh: () async {
                      _page = 1;
                      _list = await CustomerFunc.getCustomerList(
                          page: _page,
                          size: 10,
                          order: sort.isEmpty
                              ? null
                              : (CustomerMap.customerSortString
                                      .getKeyFromValue(sort) as CustomerSort)
                                  .name
                                  .toString()
                                  .toSnake,
                          searchParams: _params);
                      _onLoad = false;
                      setState(() {});
                    },
                    onLoad: () async {
                      _page++;
                      var baseList = await apiClient
                          .requestList(API.car.getCarSelfLists, data: {
                        'page': _page,
                        'size': 10,
                        'order': (CustomerMap.customerSortString
                                .getKeyFromValue(sort) as CustomerSort)
                            .name
                            .toString()
                            .toSnake,
                        'search': _params
                      });
                      if (baseList.nullSafetyTotal > _list.length) {
                        _list.addAll(baseList.nullSafetyList
                            .map((e) => CustomerListModel.fromJson(e))
                            .toList());
                      } else {
                        _refreshController.finishLoad(noMore: true);
                      }
                      setState(() {});
                    },
                    slivers: [
                      SliverToBoxAdapter(
                        child: 80.hb,
                      ),
                      _onLoad
                          ? SliverToBoxAdapter(
                              child: 0.hb,
                            )
                          : _list.isEmpty
                              ? const SliverToBoxAdapter(
                                  child: NoDataWidget(
                                  text: '??????????????????',
                                  paddingTop: 300,
                                ))
                              : SliverPadding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 20.w),
                                  sliver: SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                      var model = _list[index];
                                      return _getItem(model);
                                    }, childCount: _list.length),
                                  ),
                                )
                    ],
                  ),
                );
              }),
            )
          ],
        ));
  }

  _getAppbar() {
    return SearchBarWidget(
      callback: (String text) {
        sortModel.value.name = text;
        _refreshController.callRefresh();
        setState(() {});
      },
      tips: '?????????????????????',
      title: Container(
        alignment: Alignment.center,
        child: Text(
          '????????????',
          style: TextStyle(
              color: const Color(0xFF111111),
              fontSize: BaseStyle.fontSize36,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _getSortList() {
    return UserSortListPage(
      onConfirm: () {
        Get.back();
        _refreshController.callRefresh();
        setState(() {});
      },
      pickSort: sortModel,
    );
  }

  _getItem(CustomerListModel model) {
    return GestureDetector(
      onTap: () async {
        bool? isSuccess = await Get.to(() => UserInfoPage(
              customerId: model.id,
              model: model,
            ));
        if (isSuccess ?? false) {
          _refreshController.callRefresh();
        }
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.w),
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.w),
              color: kForeGroundColor),
          child: Stack(
            children: [
              model.isImportant == 1
                  ? Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () async {
                          bool success =
                              await CustomerFunc.cancelImportant(model.id);
                          if (success) {
                            CloudToast.show('????????????');
                            _refreshController.callRefresh();

                            setState(() {});
                          }
                        },
                        child: Image.asset(
                          Assets.images.importantUser.path,
                          width: 130.w,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    )
                  : const SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.hb,
                  Row(
                    children: [
                      36.wb,
                      Image.asset(
                        model.gender == 0
                            ? Assets.icons.icUser.path
                            : Assets.icons.icUserWoman.path,
                        width: 32.w,
                        height: 32.w,
                      ),
                      5.wb,
                      Text(
                        model.nickname,
                        style: TextStyle(
                            fontSize: 32.sp,
                            color: BaseStyle.color333333,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      model.isImportant == 1
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: () async {
                                bool success =
                                    await CustomerFunc.setImportant(model.id);
                                if (success) {
                                  CloudToast.show('????????????');
                                  _refreshController.callRefresh();
                                  setState(() {});
                                }
                              },
                              child: Text(
                                '????????????',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  color: BaseStyle.color999999,
                                ),
                              ),
                            ),
                      24.wb,
                    ],
                  ),
                  10.hb,
                  Row(
                    children: [
                      36.wb,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          16.hb,
                          _getText('????????????', model.trailContent),
                          16.hb,
                          _getText(
                            '????????????',
                            DateUtil.formatDateMs(
                                model.trailCreatedAt.toInt() * 1000,
                                format: 'yyyy-MM-dd HH-mm-ss'),
                          ),
                          16.hb,
                          _getText('????????????', '???????????????'),
                          16.hb,
                          _getText(
                            '????????????',
                            DateUtil.formatDateMs(
                                model.createdAt.toInt() * 1000,
                                format: 'yyyy-MM-dd HH-mm-ss'),
                          ),
                          16.hb,
                          _getText('??????', model.brokerName),
                          16.hb,
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getText(String title, String content, {bool isRed = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 120.w,
          child: Text(
            title,
            style: TextStyle(fontSize: 28.sp, color: BaseStyle.color666666),
          ),
        ),
        20.wb,
        Text(
          content,
          style: TextStyle(
            fontSize: 28.sp,
            color: isRed ? const Color(0xFFFF3B02) : BaseStyle.color333333,
          ),
        ),
      ],
    );
  }
}
