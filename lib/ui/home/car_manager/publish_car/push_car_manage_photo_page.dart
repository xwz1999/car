import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/model/contract/report_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/new_push_car_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/publish_finish_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_report_photo_page.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/cloud_image_preview_list.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:cloud_car/widget/picker/image_pick_widget/multi_image_pick_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PushCarManagePhotoPage extends StatefulWidget {
  final List<String> tabs;
  final PushPhotoModel model;
  // final ReportPhotoModel reportPhotoModel;
  final NewPublishCarInfo? newPublishCarInfo;
  final int initIndex;
  final bool imgCanTap;
  final bool isSelf;


  const PushCarManagePhotoPage(
      {super.key,
      required this.tabs,
      required this.model,
      this.initIndex = 0,
      this.imgCanTap = true,
      // required this.reportPhotoModel,
        this.newPublishCarInfo, this.isSelf = false});

  @override
  _PushCarManagePhotoPageState createState() => _PushCarManagePhotoPageState();
}

class _PushCarManagePhotoPageState extends State<PushCarManagePhotoPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  List<dynamic> _carPhotos = [];
  List<dynamic> _interiorPhotos = [];
  // List<dynamic> _repairPhotos = [];
  List<dynamic> _defectPhotos = [];
  // List<dynamic> _reportPhotos = [];
  List<PushImgModel> _reportPhotos = [];

  @override
  void initState() {
    print(widget.tabs.length);
    _tabController = TabController(
        length: widget.tabs.length,
        vsync: this,
        initialIndex: widget.initIndex);


    if(widget.imgCanTap){
      _reportPhotos = [
        PushImgModel(name: '漆面数据', isMust: true),
        PushImgModel(name: '行驶证照片', isMust: true),
        PushImgModel(name: '检测报告', isMust: true),
        PushImgModel(name: '登记证书', isMust: true),
        PushImgModel(name: '交强险', isMust: false),
        PushImgModel(name: '商业险', isMust: false),
        ///添加新数据
        PushImgModel(name: '维保记录', isMust: false),
      ];
    }else{
      if(!widget.isSelf){
        _reportPhotos = [
          PushImgModel(name: '漆面数据', isMust: false),
          PushImgModel(name: '检测报告', isMust: false),
        ];
      }else{
        _reportPhotos = [
          PushImgModel(name: '漆面数据', isMust: false),
          PushImgModel(name: '行驶证照片', isMust: false),
          PushImgModel(name: '检测报告', isMust: false),
          PushImgModel(name: '登记证书', isMust: false),
          PushImgModel(name: '交强险', isMust: false),
          PushImgModel(name: '商业险', isMust: false),
        ];
      }

    }

    // for (int i = 0; i < widget.reportPhotoModel.paints!.length; i++) {
    //   for (int j = 0; j < _reportPhotos.length; j++) {
    //     if (_reportPhotos[j].name == widget.reportPhotoModel.paints![i].text) {
    //       if (widget.reportPhotoModel.paints![i].photo != '') {
    //         _reportPhotos[j].url = widget.reportPhotoModel.paints![i].photo;
    //       }
    //     }
    //   }
    // }

    for (int i = 0; i < widget.model.dataPhotos!.length; i++) {
        for (int j = 0; j < _reportPhotos.length; j++) {
        if (_reportPhotos[j].name == widget.model.dataPhotos![i].text) {
          if (widget.model.dataPhotos![i].photo != '') {
            _reportPhotos[j].url = widget.model.dataPhotos![i].photo;
          }
        }
      }
    }
    for (var item in widget.model.carPhotos!) {
      _carPhotos.add(item.photo);
    }
    for (var item in widget.model.interiorPhotos!) {
      _interiorPhotos.add(item.photo);
    }
    // for (var item in widget.model.dataPhotos??[]) {
    //   _repairPhotos.add(item.photo);
    // }
    // for (var item in widget.model.repairPhotos??[]) {
    //   _repairPhotos.add(item.photo);
    // }
    for (var item in widget.model.defectPhotos!) {
      _defectPhotos.add(item.photo);
    }
    super.initState();
  }

  bool get canTap {
    if (_carPhotos.isEmpty){
      CloudToast.show('请上传车辆照片');
      return false;
    }

    if (_interiorPhotos.isEmpty){
      CloudToast.show('请上传内饰照片');
      return false;
    }

    // if (_defectPhotos.isEmpty){
    //   CloudToast.show('请上传缺陷照片');
    //   return false;
    // }
    for(var item in _reportPhotos){
      if(item.name=='漆面数据'&&item.url==null){
        CloudToast.show('请先上传漆面数据');
        return false;
      }
      if(item.name=='行驶证照片'&&item.url==null){
        CloudToast.show( '请先上传行驶证照片');
        return false;
      }
      if(item.name=='检测报告'&&item.url==null){
        CloudToast.show( '请先上传检测报告');
        return false;
      }
      if(item.name=='登记证书'&&item.url==null){
        CloudToast.show( '请先上登记证书');
        return false;
      }
    }

    // if (_repairPhotos.isEmpty){
    //   CloudToast.show('请上传维保记录');
    //   return false;
    // }

    return true;
  }

  Future uploadPhotos() async {

    widget.model.carPhotos!.clear();
    widget.model.interiorPhotos!.clear();
    widget.model.defectPhotos!.clear();
    widget.model.dataPhotos!.clear();
    // widget.model.repairPhotos!.clear();
    // widget.reportPhotoModel.paints!.clear();


    for (var i = 0; i < _reportPhotos.length; i++) {
      if (_reportPhotos[i].url.runtimeType != String &&
          _reportPhotos[i].url.runtimeType != Null) {
        var url = await apiClient.uploadImage(_reportPhotos[i].url);
        _reportPhotos[i].url = url;
      }
      widget.model.dataPhotos!.add(
          CarPhotos(photo: _reportPhotos[i].url, text: _reportPhotos[i].name));
    }

    for (var i = 0; i < _defectPhotos.length; i++) {
      if (_defectPhotos[i].runtimeType != String) {
        var url = await apiClient.uploadImage(_defectPhotos[i]);
        _defectPhotos.removeAt(i);
        _defectPhotos.insert(i, url);
      }
      widget.model.defectPhotos!
          .add(CarPhotos(photo: _defectPhotos[i], text: '缺陷照片'));
    }

    for (var i = 0; i < _carPhotos.length; i++) {
      if (_carPhotos[i].runtimeType != String) {
        var url = await apiClient.uploadImage(_carPhotos[i]);
        _carPhotos.removeAt(i);
        _carPhotos.insert(i, url);
      }
      widget.model.carPhotos!
          .add(CarPhotos(photo: _carPhotos[i], text: '车辆照片'));
    }

    for (var i = 0; i < _interiorPhotos.length; i++) {
      if (_interiorPhotos[i].runtimeType != String) {
        var url = await apiClient.uploadImage(_interiorPhotos[i]);
        _interiorPhotos.removeAt(i);
        _interiorPhotos.insert(i, url);
      }
      widget.model.interiorPhotos!
          .add(CarPhotos(photo: _interiorPhotos[i], text: '内饰照片'));
    }

    //   for (var i = 0; i < _repairPhotos.length; i++) {
    //   if (_repairPhotos[i].runtimeType != String) {
    //     var url = await apiClient.uploadImage(_repairPhotos[i]);
    //     _repairPhotos.removeAt(i);
    //     _repairPhotos.insert(i, url);
    //   }
    //   widget.model.repairPhotos!
    //       .add(CarPhotos(photo: _repairPhotos[i], text: '维保记录'));
    // }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CloudScaffold.normal(
      title: '车辆图片管理',

      appBarBottom: TabBar(
          isScrollable: true,
          labelColor: Colors.blue,
          controller: _tabController,
          unselectedLabelColor: Colors.black,
          automaticIndicatorColorAdjustment: false,
          indicatorColor: Colors.transparent,
          tabs: widget.tabs.map((e) => Tab(text: e)).toList()),
      body: TabBarView(controller: _tabController, children: [
        _getView1(0, _carPhotos),
        _getView1(1, _interiorPhotos),
        _getView1(2, _defectPhotos),
        // _getView1(3, _reportPhotos),
        _getView(4, _reportPhotos)
        // _getView(3, _reportPhotos),
        // _getView1(4, _repairPhotos)
      ]),
      bottomNavi: widget.imgCanTap? Container(
        margin: EdgeInsets.only(bottom: 40.w),
        height: 90.w,
        width: double.infinity,
        child: CloudBottomButton(
          onTap: ()async {

            CloudToast.loading;
            if (!canTap) {
              BotToast.closeAllLoading();
              return;
            }
            await uploadPhotos();
            BotToast.closeAllLoading();
            // var result = await  CarFunc.newPushCar(reportPhotoModel: widget.reportPhotoModel,
            //     pushPhotoModel: widget.model, newPublishCarInfo: widget.newPublishCarInfo!);
            var result = await  CarFunc.newPushCar(
                pushPhotoModel: widget.model, newPublishCarInfo: widget.newPublishCarInfo!);
            if(result){
              Get.to(() => const PublishFinishPage());
            }
          },
          text: '下一步',
        ),
      ):const SizedBox(),
    );
  }

  Widget _getView(
    int index,
    List<PushImgModel> list,
  ) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 24.w),
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 3,
            //纵轴间距
            mainAxisSpacing: 10,
            //横轴间距
            crossAxisSpacing: 20,
            //子组件宽高长度比例
            childAspectRatio: 100 / 105),
        itemBuilder: (BuildContext context, int iIndex) {
          return _buildChild(list[iIndex], iIndex, index, list);
        });
  }

  Widget _buildChild(
      PushImgModel model, int index, int type, List<PushImgModel> list) {
    List<File> fileLists = [];
    List<String> stringLists = [];
    for (var item in list) {
      if (item.url.runtimeType == String) {
        stringLists.add(item.url);
      } else {
        if (item.url != null) {
          fileLists.add(item.url);
        }
      }
    }

    return GestureDetector(
      onTap: () async {
        if (widget.imgCanTap) {
          var value = await CloudImagePicker.pickSingleImage(title: '选择图片');
          _reportPhotos[index].url = value;
          setState(() {});
        } else {

          if (model.url.runtimeType == String) {
            if(model.url!='') {
              await CloudImagePreviewList.toPath(path: stringLists, index: index);
            }
          } else {
            if(model.url!=null){
              await CloudImagePreviewList.toFile(file: fileLists, index: index);
            }

          }
        }
      },
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            model.url == null || model.url == ''
                ? Container(
                    width: 210.w,
                    height: 158.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(Assets.images.addcar.path),
                      ),
                    ),
                  )
                : Stack(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    children: [
                      Container(
                          // width: 210.w,
                          // height: 158.w,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.w),
                          ),
                          child: image(model.url)),
                    ],
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.w),
                  child:   model.isMust!=null&&model.isMust!?
                  '* '.text.size(28.sp).color(Colors.red).make().paddingOnly(top: 5):const SizedBox(),
                ),
                ( model.name??'').text.size(32.sp).color(const Color(0xFF110000)).make(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _getView1(
    int index,
    List<dynamic> list,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.imgCanTap?
          Text(
            '按住照片拖动排序，第一张默认为首页',
            style: TextStyle(color: const Color(0xFF999999), fontSize: 28.sp),
          ):const SizedBox(),
          20.hb,
          MultiImagePickWidget(
            photos: list,
            onChanged: (files) {
             if(index==0){
               _carPhotos=files;
             }else if(index==1){
               _interiorPhotos=files;
             }else if(index==2){
               _defectPhotos=files;
             }
             // else if(index==3){
             //   _reportPhotos=files;
             // }
             // else if(index==4){
             //   _repairPhotos=files;
             // }
              setState(() {});
            },
            maxCount: widget.imgCanTap ? null : list.length,
          ),
        ],
      ),
    );
  }

  Widget image(dynamic file) {
    return file.runtimeType == String
        ? CloudImageNetworkWidget(
            width: 210.w,
            height: 158.w,
            urls: [file],
          )
        : Image.file(
            file,
            fit: BoxFit.fill,
            width: 210.w,
            height: 158.w,
          );
  }

  @override
  bool get wantKeepAlive => true;
}
