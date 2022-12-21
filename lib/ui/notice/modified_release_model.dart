///修改 分布

import 'package:cloud_car/utils/headers.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/car/new_car_info.dart';
import '../../model/contract/report_photo_model.dart';
import '../../widget/cloud_image_network_widget.dart';
import '../home/car_manager/publish_car/push_car_manage_photo_page.dart';
import '../home/car_manager/publish_car/push_photo_model.dart';
import '../home/func/car_func.dart';

class ModifiedReleaseModel extends StatefulWidget {
  final bool state;///true  修改   false发布

  ///修改 发布
  const ModifiedReleaseModel({super.key, required this.state});

  @override
  _ModifiedReleaseModelState createState() => _ModifiedReleaseModelState();
}

class _ModifiedReleaseModelState extends State<ModifiedReleaseModel> {
  List<CarPhotos> carPhotos = [];
  List<CarPhotos> dataPhotos = [];
  List<CarPhotos> interiorPhotos = [];
  List<CarPhotos> defectPhotos = [];
  List<ImagePhoto> bannerList = [];
  late PushPhotoModel pushPhotoModel;
  late ReportPhotoModel reportPhotoModel;
  int collect = 0;
  NewCarInfo? carInfoModel;

  _refresh() async {
    carInfoModel = await CarFunc.getNewCarInfo(76);
    // print(carInfoModel!.carInfo);
    collect = carInfoModel?.carInfo.collect ?? 0;
    for (var item in carInfoModel!.carInfo.carPhotos) {
      if (item.photo.isNotEmpty && item.text.isNotEmpty) {
        carPhotos.add(CarPhotos(photo: item.photo, text: item.text));
      }
      if (item.photo.isNotEmpty && item.text.isNotEmpty) {
        bannerList.add(item);
      }
    }
    for (var item in carInfoModel!.carInfo.interiorPhotos) {
      if (item.photo.isNotEmpty && item.text.isNotEmpty) {
        interiorPhotos.add(CarPhotos(photo: item.photo, text: item.text));
      }
    }

    for (var item in carInfoModel!.carInfo.defectPhotos) {
      if (item.photo.isNotEmpty && item.text.isNotEmpty) {
        defectPhotos.add(CarPhotos(photo: item.photo, text: item.text));
      }
    }
    // for (var item in carInfoModel!.carInfo.dataPhotos) {
    //   if (item.photo.isNotEmpty && item.text.isNotEmpty) {
    //     repairPhotos.add(CarPhotos(photo: item.photo, text: item.text));
    //   }
    // }
    for (var item in carInfoModel!.carInfo.dataPhotos) {
      if (item.photo.isNotEmpty && item.text.isNotEmpty) {
        dataPhotos.add(CarPhotos(photo: item.photo, text: item.text));
      }
    }
    // for (int i = 0; i < carInfoModel!.carInfo.dataPhotos.length; i++) {
    //   for (int j = 0; j < dataPhotos.length; j++) {
    //     if (dataPhotos[j].text ==
    //         carInfoModel!.carInfo.dataPhotos[i].text) {
    //       if (carInfoModel!.carInfo.dataPhotos[i].photo != '') {
    //         dataPhotos[j].photo =
    //             carInfoModel!.carInfo.dataPhotos[i].photo;
    //       } else {
    //         dataPhotos.removeAt(j);
    //       }
    //     }
    //   }
    // }
    // for (int i = 0; i < carInfoModel!.carInfo.reportPhotos.length; i++) {
    //   for (int j = 0; j < _reportPhotos.length; j++) {
    //     if (_reportPhotos[j].text ==
    //         carInfoModel!.carInfo.reportPhotos[i].text) {
    //       if (carInfoModel!.carInfo.reportPhotos[i].photo != '') {
    //         _reportPhotos[j].photo =
    //             carInfoModel!.carInfo.reportPhotos[i].photo;
    //       } else {
    //         _reportPhotos.removeAt(j);
    //       }
    //     }
    //   }
    // }
    pushPhotoModel = PushPhotoModel(
      carPhotos: carPhotos,
      interiorPhotos: [],
      defectPhotos: [],
      dataPhotos: dataPhotos,
      // repairPhotos: repairPhotos,
    );

    reportPhotoModel = ReportPhotoModel(paints: dataPhotos);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      _refresh();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _gexFramework(
          Row(
            children: [
              SizedBox(
                width: 196.w,
                height: 150.w,
                child: CloudImageNetworkWidget.car(urls: []),
              ),
              20.wb,
              SizedBox(
                width: 406.w,
                child: Column(
                  children: [
                    Text('奥迪Q3 2020款 35 TFSI 进取型 SUV',
                        style: TextStyle(
                            fontSize: BaseStyle.fontSize28,
                            color: BaseStyle.color111111)),
                    26.hb,
                    _getChip(
                      '过户${1}次',
                      DateUtil.formatDateMs(6849273.toInt() * 1000,
                          format: 'yyyy年 '),
                      '${10}万公里',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.w),
          margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
          width: 750.w,
          height: 560.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '照片信息',
                style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w800),
              ),
              32.hb,
              Expanded(
                  child: SizedBox(
                    // color: Colors.white,
                    // width: ,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      crossAxisCount: 3,
                      children: [
                        _buildChild(
                          _titles[0],
                          0,
                        ),
                        _buildChild(
                          _titles[1],
                          1,
                        ),
                        _buildChild(
                          _titles[2],
                          1,
                        ),
                        _buildChild(
                          _titles[3],
                          1,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
        _gexFramework(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '车辆档案',
              style: TextStyle(
                  fontSize: 28.sp,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w800),
            ),
            32.hb,
            _getTitle('车辆类型', '二手车(中规)', false,widget.state),
            16.hb,
            _getTitle('车辆来源', '车商', false,widget.state),
            16.hb,
            _getTitle('品牌车型', '奥迪A3 2020款 Sportback 35 TFSI 进取运动型', false,widget.state),
            16.hb,
            _getTitle('车架号', 'LGJ83476524683243', false,widget.state),
            16.hb,
            _getTitle('发动机号', 'LGJ83476524683243', false,widget.state),
            16.hb,
            _getTitle('首次上牌', '2020-03', false,widget.state),
            16.hb,
            _getTitle('车身颜色', '黑色', true,widget.state),
            16.hb,
            _getTitle('内饰颜色', '黑色', false,widget.state),
            16.hb,
            _getTitle('临时车牌', '浙B562T8', false,widget.state),
            16.hb,
            _getTitle('车位编号', '3F-107', true,widget.state),
            16.hb,
            _getTitle('库存状态', '在厅', false,widget.state),
            16.hb,
            _getTitle('使用性质', '非运营', false,widget.state),
            16.hb,
            _getTitle('表显里程', '3.0万公里', false,widget.state),
            16.hb,
            _getTitle('出厂日期', '2021年10月1日', false,widget.state),
            16.hb,
            _getTitle('新车指导价', '15万', false,widget.state),
            16.hb,
            _getTitle('购置税', '12000', true,widget.state),
            16.hb,
            _getTitle('加装费用', '5000', true,widget.state),
            16.hb,
            _getTitle('车辆所在地', '浙江 宁波', false,widget.state),
            16.hb,
            _getTitle('环保等级', '国五', false,widget.state),
          ],
        )),
        _gexFramework(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '车况描述',
              style: TextStyle(
                  fontSize: 28.sp,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w800),
            ),
            32.hb,
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    color: const Color(0xFFF8F8F8)),
                child: Flexible(child: Text(
                  '车门与门框之间的连接部件位置对称，且车门在开关时不与周边部件发生接触。如果以上的现象没有出现，则可判定此车的车身外部结构无碰撞，或修复后可以满足日常的安全使用。',
                  style: TextStyle(
                      fontSize: 28.sp, fontWeight: FontWeight.w700),
                ),)
            )
          ],
        )),
        _gexFramework(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '车辆配置',
              style: TextStyle(
                  fontSize: 28.sp,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w800),
            ),
            32.hb,
            _getTitle('排量', '1.8T',true,widget.state),
            16.hb,
            _getTitle('变速箱类型', '手自一体',false,widget.state),
            16.hb,
            _getTitle('燃油形式', '汽油',true,widget.state),
            16.hb,
            _getTitle('车身结构', '三厢车',false,widget.state),
            16.hb,
            _getTitle('座位数', '5座',false,widget.state),


          ],
        )),
        _gexFramework(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '采购信息',
              style: TextStyle(
                  fontSize: 28.sp,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w800),
            ),
            32.hb,
            _getTitle('采购类型', '收购',false,widget.state),
            16.hb,
            _getTitle('收购人', '张三',false,widget.state),
            16.hb,
            _getTitle('采购价格', '12万',false,widget.state),
            16.hb,
            _getTitle('采购日期', '2022-12-09',false,widget.state),
            16.hb,
            _getTitle('门店', '云云问车二号店',false,widget.state),

          ],
        )),
        _gexFramework(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '采购信息',
              style: TextStyle(
                  fontSize: 28.sp,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w800),
            ),
            32.hb,
            _getTitle('过户次数', '1次',false,widget.state),
            16.hb,
            _getTitle('钥匙数量', '2把',true,widget.state),
            16.hb,
            _getTitle('交强险', '有',false,widget.state),
            16.hb,
            _getTitle('交强险到期', '2022-12-09',false,widget.state),
            16.hb,
            _getTitle('商业险', '有',false,widget.state),
            16.hb,
            _getTitle('商业险到期', '2022-12-09',false,widget.state),

          ],
        )),
      ],
    );
  }

  _getTitle(String title, String text, bool update,bool state) {
    return Row(
      children: [
        SizedBox(
          width: 160.w,
          child: Text(
            title,
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600),
          ),
        ),
        state?
        Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: update ? FontWeight.w700 : FontWeight.w400,
                color: update ? const Color(0xFF333333) : const Color(
                    0xFF999999),
              ),
            )): Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 28.sp,
                // fontWeight: update ? FontWeight.w700 : FontWeight.w400,
                // color: update ? const Color(0xFF333333) :  const Color(
                //     0xFF999999),
              ),
            ))
      ],
    );
  }

  _gexFramework(Widget? child) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
      child: child,
    );
  }

  final List<String> _titles = ['车辆照片', '内饰照片', '缺陷照片', '报告数据'];

  Widget _buildChild(String bottom,
      int index,) {
    List<CarPhotos> photos = [];
    int length = 0;
    String firstPhoto = '';
    switch (index) {
      case 0:
        photos = carPhotos;
        break;
      case 1:
        photos = interiorPhotos;
        break;
      case 2:
        photos = defectPhotos;
        break;
      case 3:
        photos = dataPhotos;
        break;
    // case 4:
    //   photos = repairPhotos;
    //   break;
    }

    for (int i = 0; i < photos.length; i++) {
      if (photos[i].photo != null && photos[i].photo != '') {
        firstPhoto = photos[i].photo!;
        length++;
      }
    }
    return GestureDetector(
      onTap: () async {
        await Get.to(
          PushCarManagePhotoPage(
            isSelf: true,

            ///widget.carListModel.isSelf == 1,
            tabs: _titles,
            model: pushPhotoModel,
            initIndex: index,
            imgCanTap: false,
            // reportPhotoModel: reportPhotoModel,
            newPublishCarInfo: null,
          ),
        );
        setState(() {});
      },
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            length == 0
                ? Container(
              width: 210.w,
              height: 158.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Assets.images.addcar.path),
                ),
              ),
            )
                : Stack(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              children: [
                Container(
                  width: 210.w,
                  height: 158.w,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.w),
                  ),
                  child: CloudImageNetworkWidget(
                    urls: [firstPhoto],
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 66.w,
                    height: 36.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.w),
                        bottomRight: Radius.circular(16.w),
                      ),
                    ),
                    child: Text(
                      '$length张',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            10.hb,
            bottom.text
                .size(28.sp)
                .black
                .bold
                .make(),
          ],
        ),
      ),
    );
  }

  //标签样式
  _getChip(String num, String time, String distance) {
    return Row(
      children: [
        //Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF027AFF).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            num,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF027AFF)),
          ),
        ),
        16.wb,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            time,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        ),
        16.wb,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            distance,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        )
      ],
    );
  }
}
