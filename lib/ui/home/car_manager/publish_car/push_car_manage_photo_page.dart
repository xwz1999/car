import 'package:cloud_car/model/car/inner_model/car_manage_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_report_photo_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:cloud_car/widget/picker/image_pick_widget/multi_image_pick_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PushCarManagePhotoPage extends StatefulWidget {
  final List<String> tabs;
  final CarManagePhotoModel model;
  final int initIndex;

  const PushCarManagePhotoPage(
      {super.key, required this.tabs, required this.model, this.initIndex = 0});

  @override
  _PushCarManagePhotoPageState createState() => _PushCarManagePhotoPageState();
}

class _PushCarManagePhotoPageState extends State<PushCarManagePhotoPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  List<PushImgModel> _carPhotos = [];
  List<PushImgModel> _interiorPhotos = [];




  // List<dynamic> _carPhotos = [];
  // List<dynamic> _interiorPhotos = [];
  List<dynamic> _defectPhotos = [];

  @override
  void initState() {
    _tabController = TabController(
        length: widget.tabs.length,
        vsync: this,
        initialIndex: widget.initIndex);
    _carPhotos = [
      PushImgModel(name: '左前45°',url: ''),
      PushImgModel(name: '正面',url: ''),
      PushImgModel(name: '右前45°',url: ''),
      PushImgModel(name: '右后45°',url: ''),
      PushImgModel(name: '左后45°',url: ''),
      PushImgModel(name: '左后45°',url: ''),
    ];

    _interiorPhotos = [
      PushImgModel(name: '驾驶座椅',url: ''),
      PushImgModel(name: '副驾驶座椅',url: ''),
      PushImgModel(name: '后排座椅',url: ''),
      PushImgModel(name: '仪表（公里数）',url: ''),
      PushImgModel(name: '中控',url: ''),
      PushImgModel(name: '前排机舱及地盘',url: ''),
      PushImgModel(name: '后备箱',url: ''),
      PushImgModel(name: '引擎盖打开整体',url: ''),
      PushImgModel(name: '发动机',url: ''),
      PushImgModel(name: '车边梁',url: ''),
      PushImgModel(name: '底盘',url: ''),
    ];


    // for (var item in widget.model.carPhotos) {
    //   _carPhotos.add(item);
    // }
    // for (var item in widget.model.interiorPhotos) {
    //   _interiorPhotos.add(item);
    // }
    for (var item in widget.model.defectPhotos) {
      _defectPhotos.add(item);
    }

    super.initState();
  }

  Future uploadPhotos() async {
    // widget.model.carPhotos.clear();
    // widget.model.interiorPhotos.clear();
    // widget.model.defectPhotos.clear();
    // widget.model.dataPhotos.clear();
    // for (var i = 0; i < _carPhotos.length; i++) {
    //   if (_carPhotos[i].runtimeType != String) {
    //     var url = await apiClient.uploadImage(_carPhotos[i]);
    //     _carPhotos.removeAt(i);
    //     _carPhotos.insert(i, url);
    //   }
    //   widget.model.carPhotos.add(_carPhotos[i]);
    // }
    // for (var i = 0; i < _interiorPhotos.length; i++) {
    //   if (_interiorPhotos[i].runtimeType != String) {
    //     var url = await apiClient.uploadImage(_interiorPhotos[i]);
    //     _interiorPhotos.removeAt(i);
    //     _interiorPhotos.insert(i, url);
    //   }
    //   widget.model.interiorPhotos.add(_interiorPhotos[i]);
    // }
    // for (var i = 0; i < _defectPhotos.length; i++) {
    //   if (_defectPhotos[i].runtimeType != String) {
    //     var url = await apiClient.uploadImage(_defectPhotos[i]);
    //     _defectPhotos.removeAt(i);
    //     _defectPhotos.insert(i, url);
    //   }
    //   widget.model.defectPhotos.add(_defectPhotos[i]);
    // }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CloudScaffold.normal(
      title: '车辆图片管理',
      actions: [
        TextButton(
          onPressed: () async {
            var cancel = CloudToast.loading;
            await uploadPhotos();
            Get.back();
            cancel();

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
            childAspectRatio: 100/100),
        itemBuilder: (BuildContext context, int iIndex) {
          return _buildChild(list[iIndex],iIndex,index);
        });
  }

  Widget _buildChild(PushImgModel model,int index,int type) {
    return GestureDetector(
      onTap: () async {

        var value =
        await CloudImagePicker.pickSingleImage(title: '选择图片');
        if(type==0){
          _carPhotos[index].url = value;
        }else{
          _interiorPhotos[index].url = value;
        }


        setState(() {});
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
                  image: Assets.images.addcar,
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

           ( model.name??'').text.size(28.sp).black.make(),
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
              }),
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

class PushImgModel {
  String? name;
  dynamic url;

  PushImgModel({
    this.name,
    this.url,
  });
}