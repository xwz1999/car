import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/extensions/string_extension.dart';
import 'package:cloud_car/model/car/car_info_model.dart';
import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/call_order_page.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/car_detail_item.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_car_page.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/off_car_page.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/sell_car_order_page.dart';
import 'package:cloud_car/ui/home/car_manager/initiate_contract_page.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/ui/home/share/share_car_detail_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/swiper_pagination_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';

import 'modify_price_page.dart';

class CarsDetailPage extends StatefulWidget {
  final bool isSelf;
  final CarListModel carListModel;
  const CarsDetailPage({
    Key? key, required this.carListModel, required this.isSelf,
  }) : super(key: key);

  @override
  _CarsDetailPageState createState() => _CarsDetailPageState();
}

class _CarsDetailPageState extends State<CarsDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;


  final List<CarListModel> _chooseModels = [];
  ///滚动监听设置
  late ScrollController _scrollController;

  ///头部背景布局 true滚动一定的高度 false 滚动高度为0
  bool headerWhite = false;
  List tabs = [];
  CarInfoModel? carInfoModel;

  @override
  void initState() {
    ///自己发布的 tab2个 否则1个
    tabs = ['车辆详情', ];//'车辆轨迹'
    _tabController =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);

    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      ///监听滚动位置设置导航栏颜色
      if (_scrollController.offset > 900.w && headerWhite != true) {
        headerWhite = true;
        setState(() {});
      } else if (_scrollController.offset < 900.w && headerWhite != false) {
        headerWhite = false;
        setState(() {});
      }
    });
    Future.delayed(const Duration(milliseconds: 0), () async {
      await _refresh();

    });

    _chooseModels.add(widget.carListModel);

  }


  _refresh()async{
    carInfoModel = await CarFunc.getCarInfo(widget.carListModel.id);
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CloudScaffold(
      path: Assets.images.noticeBg.path,
      extendBody: true,
      body:  Expanded(
        child: carInfoModel==null?const SizedBox(): NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  pinned: true,
                  stretch: true,
                  expandedHeight: 1150.w,
                  elevation: 0,
                  backgroundColor:
                      headerWhite ? Colors.white : Colors.transparent,
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                  snap: false,
                  centerTitle: false,
                  title: headerWhite
                      ?  Text(
                          carInfoModel?.modelName??'',
                          style:  TextStyle(
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.w700,
                            fontSize: 36.sp,
                          ),
                        )
                      : const Text(''),
                  leading: const CloudBackButton(),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => CallOrderPage(carListModel: widget.carListModel,));
                      },
                      child: Image.asset(Assets.icons.carDetail.path,
                          height: 48.w, width: 48.w),
                    ),
                    24.wb,

                    ///收藏按钮 自己发布的车辆没有该按钮
                    !widget.isSelf?
                    GestureDetector(
                      onTap: () async{
                        var re = await apiClient.request(
                            carInfoModel?.collect == 0
                                ? API.car.collect.add
                                : API.car.collect.cancel,
                            data: {'carId': carInfoModel?.id},
                            showMessage: true);
                        if (re.code == 0) {

                        }
                      },
                      child:  Image.asset(carInfoModel?.collect == 1
                          ? Assets.icons.alreadyCollected.path
                          : Assets.icons.notCollect.path),
                    ):const SizedBox(),
                    24.wb,
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isDismissible: true,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            builder: (BuildContext context) {
                              return ShareCarDetailPage(
                                model: _chooseModels,
                                isMore: false,
                              );
                            });

                      },
                      child: Image.asset(Assets.icons.icShare.path,
                          color: Colors.black, height: 40.w, width: 40.w),
                    ),
                    16.wb,
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    //centerTitle: true,
                    background: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      color: Colors.transparent,
                      //
                      //height: double.infinity,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          135.hb,
                          Container(
                            decoration: BoxDecoration(
                              color: headerWhite
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 32.w, vertical: 24.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _title(),
                                32.hb,
                                _label(),
                                18.hb,
                                _information(),
                                30.hb,
                                _shuffling(),
                                32.hb,
                                _informations(),
                              ],
                            ),
                          ),
                          50.hb,
                        ],
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(kToolbarHeight - 10.w),
                    child: Container(
                      height: kToolbarHeight - 10.w,
                      width: double.infinity,
                      alignment: Alignment.center,
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
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                          ),
                          indicator: const BoxDecoration(),
                          indicatorColor: kPrimaryColor,
                          tabs: [
                            _tab(0, tabs[0]),
                            // _tab(1, tabs[1]),
                          ]),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(
                                  color: BaseStyle.colordddddd, width: 2.w))),
                    ),
                  )),
            ];
          },
          body: Padding(
            padding: EdgeInsets.only(bottom: 120.w),
            child: TabBarView(
              controller: _tabController,
              children: [
                CarDetailItem(carInfoModel: carInfoModel!,),

                // ListView.builder(
                //   physics: const NeverScrollableScrollPhysics(),
                //   padding: EdgeInsets.zero,
                //   shrinkWrap: true,
                //   itemBuilder: (BuildContext context, int index) {
                //     return Column(
                //       children: [
                //         index == 0
                //             ? Container(
                //                 width: double.infinity,
                //                 height: 40.w,
                //                 color: Colors.white,
                //               )
                //             : const SizedBox(),
                //         _getListItem(index, index < 2),
                //       ],
                //     );
                //   },
                //   itemCount: 5,
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavi: _bottom(),
    );
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
    return SizedBox(width: 150.w, child: Text(text));
  }

  _getListItem(int index, bool ing) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      height: 380.w,
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
                  Text('浏览车辆'),
                  Text(' ｜ '),
                  Text('云云问车-微信小程序-点击浏览'),
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
                  '奥迪A8',
                  '2020-2',
                  '',
                  '31.56万',
                  '12.44万公里',
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
            //头像
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

  //标题
  _title() {
    return Row(
      children: [
        Flexible(
            child: Text(
              carInfoModel?.modelName??'',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: const Color(0xFF111111), fontSize: 40.sp),
        )),
      ],
    );
  }

  //标签
  _label() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              _noRelease('在售'),
              16.wb,
              _noRelease('在厅'),
              16.wb,
              _textview(DateUtil.formatDateMs(carInfoModel!.licensingDate.toInt() * 1000,
                  format: 'yyyy-MM')),
              16.wb,
              _textview('${carInfoModel?.mileage}万公里'),
              16.wb,
              _textview(carInfoModel?.dischargeStandard??""),
            ],
          ),
        ),
      ],
    );
  }

  //提示信息
  _information() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(children: [
          TextSpan(
              text: carInfoModel!.price,
              style: TextStyle(
                  color: const Color(0xFFFF3B02),
                  fontSize: BaseStyle.fontSize40)),
          TextSpan(
              text: '万',
              style: TextStyle(
                  color: const Color(0xFFFF3B02),
                  fontSize: BaseStyle.fontSize32))
        ]))
      ],
    );
  }

  //轮播
  _shuffling() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 456.w,
          child: _bannerStyle(),
        )
      ],
    );
  }

  //信息栏
  _informations() {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0.0, 4.0),
                  blurRadius: 14.0,
                  spreadRadius: 0.0,
                  color: Color.fromRGBO(2, 122, 255, 0.11)),
              // BoxShadow(
              //     offset: Offset(0.0, 0.0),
              //     color: Color.fromRGBO(2, 122, 255, 0.11))
            ]),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${carInfoModel!.price}万',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 28.w,
                          height: 28.w,
                          child: Image.asset(Assets.icons.systemEstimate.path),
                        ),
                        // Icon(
                        //   Icons.timer,
                        //   size: 20,
                        // ),
                        Text(
                          '系统估价',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: const Color(0xFF999999)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            13.wb,
            SizedBox(
              width: 1.w,
              height: 40.w,
              child: const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey)),
            ),
            13.wb,
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          carInfoModel!.color,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 28.w,
                          height: 28.w,
                          child: Image.asset(Assets.icons.icColor.path),
                        ),
                        Text(
                          '车身颜色',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: const Color(0xFF999999)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            13.wb,
            SizedBox(
              width: 1.w,
              height: 40.w,
              child: const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey)),
            ),
            13.wb,
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 68.w)),
                    Text(
                      '-',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 28.w,
                          height: 28.w,
                          child: Image.asset(Assets.icons.carNumber.path),
                        ),
                        // Icon(
                        //   Icons.timer,
                        //   size: 20,
                        // ),
                        Text(
                          '车辆编号',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: const Color(0xFF999999)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

    // Row(children: [
    //   Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
    // ]),
  }


  ///自己发布的车辆可以编辑、调价、出售、下架。其他销售看见我发布的车辆详情时，只有出售操作。no去掉

  _bottom() {
    return Container(
      color: Colors.white,
      height: 120.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: _getBottom(Assets.icons.editor.path, '编辑', () {
            Get.to(() => const EditCarPage());
          })),
          Expanded(
              child: _getBottom(Assets.icons.transmission.path, '调价', () {
                Get.to(() => const ModifyPricePage());

              })),
          Expanded(
              child: _getBottom(Assets.icons.upload.path, '出售', () {
                  Get.to(() => SellCarOrderPage(carModel: widget.carListModel,));
                //Get.to(() => const InitiateContractPage());
          })),
          Expanded(
              child: _getBottom(Assets.icons.download.path, '下架/退库', () {
            Get.to(() => const OffCarPage());
          })),
        ],
      ),
    );
  }

  _noRelease(String text) {
    return Container(
      decoration: BoxDecoration(
          color: text == '在售'
              ? const Color(0xFFFF3B02).withOpacity(0.08)
              : const Color(0xFF027AFF).withOpacity(0.08),
          borderRadius: BorderRadius.all(
            Radius.circular(4.w),
          )),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: text == '在售'
                ? const Color(0xFFFF3B02)
                : const Color(0xFF027AFF)),
      ),
    );
  }

//文本
  _textview(String text) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(79, 90, 116, 0.08),
          borderRadius: BorderRadius.all(
            Radius.circular(4.w),
          )),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: const Color(0xFF4F5A74))),
    );
  }

//分页指示器
  _bulidPagination() {
    return SwiperPagination(

        //指示器显示的位置
        alignment: Alignment.bottomCenter, //位置在底部
        //距离调整
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10), //坐上右下
        //指示器构建
        builder: SwiperPaginationWidget(
            color: Colors.white,
            activeFontSize: 20.sp,
            fontSize: 20.sp,
            activeColor: Colors.white)
        // builder: DotSwiperPaginationBuilder(
        //   //点之间的间距
        //   space: 2,
        //   //没选中时的大小
        //   size: 6,
        //   //选中时的大小
        //   activeSize: 12,
        //   //没选中时的颜色
        //   color: Colors.black,
        //   //选中时的颜色
        //   activeColor: Colors.white,
        // )
        );
  }

//图片样式
  _bannerStyle() {
    return Swiper(
      itemCount:  carInfoModel!.carPhotos.length,
      //横向
      scrollDirection: Axis.horizontal,
      //布局构建
      itemBuilder: (context, index) {
        // return Image.network(
        //   'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp05%2F1910021010125G2-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649300928&t=fff0ffcc2c57eb09695f619918828ca8',
        //   fit: BoxFit.fill,
        // );
        return
          CloudImageNetworkWidget.car(
            urls: [carInfoModel!.carPhotos[index].imageWithHost],
          );

      },
      //自动翻页
      autoplay: true,
      //分页指示
      pagination: _bulidPagination(),
      //点击事件
      onTap: (index) {
        ('点击' + index.toString());
      },
      //布局方法
      //用户进行操作时停止自动翻页
      autoplayDisableOnInteraction: true,
      //无限轮播
      loop: true,
    );
  }
}
