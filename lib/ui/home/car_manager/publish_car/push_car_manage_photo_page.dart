import 'dart:io';

import 'package:cloud_car/model/car/inner_model/car_manage_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_report_photo_page.dart';
import 'package:cloud_car/model/contract/report_photo_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/cloud_image_preview.dart';
import 'package:cloud_car/widget/cloud_image_preview_list.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:cloud_car/widget/picker/image_pick_widget/multi_image_pick_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PushCarManagePhotoPage extends StatefulWidget {
  final List<String> tabs;
  final PushPhotoModel model;
  final int initIndex;
  final bool canTap;

  const PushCarManagePhotoPage(
      {super.key, required this.tabs, required this.model, this.initIndex = 0, this.canTap = true});

  @override
  _PushCarManagePhotoPageState createState() => _PushCarManagePhotoPageState();
}

class _PushCarManagePhotoPageState extends State<PushCarManagePhotoPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  List<PushImgModel> _carPhotos = [];
  List<PushImgModel> _interiorPhotos = [];
  List<dynamic> _defectPhotos = [];


  @override
  void initState() {
    _tabController = TabController(
        length: widget.tabs.length,
        vsync: this,
        initialIndex: widget.initIndex);
    _carPhotos = [
      PushImgModel(name: '左前45°'),
      PushImgModel(name: '正面'),
      PushImgModel(name: '右前45°'),
      PushImgModel(name: '右后45°'),
      PushImgModel(name: '左后45°'),
      PushImgModel(name: '正后'),
    ];

    _interiorPhotos = [
      PushImgModel(name: '驾驶座椅'),
      PushImgModel(name: '副驾驶座椅'),
      PushImgModel(name: '后排座椅'),
      PushImgModel(name: '仪表（公里数）'),
      PushImgModel(name: '中控'),
      PushImgModel(name: '前排机舱及地盘'),
      PushImgModel(name: '后备箱'),
      PushImgModel(name: '引擎盖打开整体'),
      PushImgModel(name: '发动机'),
      PushImgModel(name: '车边梁'),
      PushImgModel(name: '底盘'),
    ];

    for(int i=0;i<widget.model.carPhotos!.length;i++){

      for(int j=0;j<_carPhotos.length;j++){
        if(_carPhotos[j].name == widget.model.carPhotos![i].text){
          if(widget.model.carPhotos![i].photo!=''){
            print(j);
            print(i);
            _carPhotos[j].url = widget.model.carPhotos![i].photo;
          }

        }
      }
    }


    for(int i=0;i<widget.model.interiorPhotos!.length;i++){

      for(int j=0;j<_interiorPhotos.length;j++){
        if(_interiorPhotos[j].name == widget.model.interiorPhotos![i].text){
          if(widget.model.interiorPhotos![i].photo!=''){
            print(j);
            print(i);
            _interiorPhotos[j].url = widget.model.interiorPhotos![i].photo;
          }
        }
      }
    }

    // for(int i=0;i<widget.model.interiorPhotos!.length;i++){
    //   for(int j=0;i<_interiorPhotos.length;j++){
    //     if(_interiorPhotos[j].name == widget.model.interiorPhotos![i].text){
    //       _interiorPhotos[j].url = widget.model.interiorPhotos![i].photo;
    //     }
    //   }
    // }

    for (var item in widget.model.defectPhotos!) {
      _defectPhotos.add(item.photo);
    }

    super.initState();
  }

  Future uploadPhotos() async {

    widget.model.carPhotos!.clear();
    widget.model.interiorPhotos!.clear();
    widget.model.defectPhotos!.clear();


    for (var i = 0; i < _carPhotos.length; i++) {
      if (_carPhotos[i].url.runtimeType != String&&_carPhotos[i].url.runtimeType != Null) {
        var url = await apiClient.uploadImage(
            _carPhotos[i].url );
        _carPhotos[i].url = url;
      }
      widget.model.carPhotos!.add(CarPhotos(photo: _carPhotos[i].url,text: _carPhotos[i].name)  );
    }


    for (var i = 0; i < _interiorPhotos.length; i++) {
      if (_interiorPhotos[i].url.runtimeType != String&&_interiorPhotos[i].url.runtimeType != Null) {
        var url = await apiClient.uploadImage(
            _interiorPhotos[i].url );
        _interiorPhotos[i].url = url;
      }
      widget.model.interiorPhotos!.add(CarPhotos(photo: _interiorPhotos[i].url,text: _interiorPhotos[i].name)  );
    }


    for (var i = 0; i < _defectPhotos.length; i++) {
      if (_defectPhotos[i].runtimeType != String) {
        print(_defectPhotos[i]);
        var url = await apiClient.uploadImage(_defectPhotos[i]);
        _defectPhotos.removeAt(i);
        _defectPhotos.insert(i, url);
      }
      widget.model.defectPhotos!.add(CarPhotos(photo: _defectPhotos[i],text: '细节照片')  );
    }

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CloudScaffold.normal(
      title: '车辆图片管理',
      actions: [
        TextButton(
          onPressed: () async {
            if(widget.canTap){
              var cancel = CloudToast.loading;
              await uploadPhotos();
              Get.back();
              cancel();
            }
          else{
              Get.back();
            }


          },
          child: Text(
            '确定',
            style: TextStyle(
              fontSize: 28.sp,
              color: const Color(0xFF027AFF),
            ),
          ),
        )
      ],
      appBarBottom: TabBar(
          labelColor: Colors.blue,
          controller: _tabController,
          unselectedLabelColor: Colors.black,
          automaticIndicatorColorAdjustment: false,
          indicatorColor: Colors.transparent,
          tabs: widget.tabs.map((e) => Tab(text: e)).toList()),
      body: TabBarView(controller: _tabController, children: [
        _getView(0, _carPhotos),
        _getView(1, _interiorPhotos),
        _getView1(2, _defectPhotos),
      ]),
    );
  }

  Widget _getView(
      int index,
      List<PushImgModel> list,
      ) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 32.w,right: 32.w,top: 24.w),
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
            crossAxisCount: 3,
            //纵轴间距
            mainAxisSpacing: 10,
            //横轴间距
            crossAxisSpacing: 20,
            //子组件宽高长度比例
            childAspectRatio: 100/105),
        itemBuilder: (BuildContext context, int iIndex) {
          return _buildChild(list[iIndex],iIndex,index,list);
        });
  }

  Widget _buildChild(PushImgModel model,int index,int type, List<PushImgModel> list) {
    List<File> fileLists = [];
    List<String> stringLists = [];
    for(var item in list){
      if( model.url.runtimeType == String){
        stringLists.add(item.url);
      }else{
        if(item.url!=null){
          fileLists.add(item.url);
        }

      }
    }

    return GestureDetector(
      onTap: () async {

        if(widget.canTap){

          var value =
          await CloudImagePicker.pickSingleImage(title: '选择图片');
          if(type==0){
            _carPhotos[index].url = value;
          }else{
            _interiorPhotos[index].url = value;
          }


          setState(() {});
        }else{
          // if (model.url.runtimeType == String) {
          //   await CloudImagePreview.toPath(path: model.url);
          // } else {
          //   await CloudImagePreview.toFile(file: model.url);
          // }
          if ( model.url.runtimeType == String) {
            await CloudImagePreviewList.toPath(path: stringLists,index: index);
          } else {
            await CloudImagePreviewList.toFile(file: fileLists ,index: index);
          }
        }

      },
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            model.url==null||model.url==''
                ? Container(
              width: 210.w,
              height: 158.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(Assets.images.addcar.path) ,
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
                  child: image(model.url)
                ),
              ],
            ),

            ( model.name??'').text.size(28.sp).color(const Color(0xFF110000)).make(),
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
      padding: EdgeInsets.all(30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.hb,
          MultiImagePickWidget(
              photos: list,
              onChanged: (files) {
                _defectPhotos = files;
                setState(() {});
              },
            maxCount: widget.canTap?null:list.length,

              ),

        ],
      ),
    );
  }



  Widget image(dynamic file) {
    return file.runtimeType == String
        ? CloudImageNetworkWidget(
      width:  210.w,
      height: 158.w,
      urls: [file],
    )
        : Image.file(
      file,
      fit: BoxFit.fill,
      width:  210.w,
      height:  158.w,
    );
  }


  @override
  bool get wantKeepAlive => true;
}

// class PushImgModel {
//   String? name;
//   dynamic url;
//
//   PushImgModel({
//     this.name,
//     this.url,
//   });
// }