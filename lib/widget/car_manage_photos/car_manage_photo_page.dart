import 'package:cloud_car/model/car/inner_model/car_manage_photo_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/picker/image_pick_widget/multi_image_pick_widget.dart';
import 'package:flutter/material.dart';

class CarManagePhotoPage extends StatefulWidget {
  final List<String> tabs;
  final CarManagePhotoModel model;
  final int initIndex;

  const CarManagePhotoPage(
      {Key? key, required this.tabs, required this.model, this.initIndex = 0})
      : super(key: key);

  @override
  _CarManagePhotoPageState createState() => _CarManagePhotoPageState();
}

class _CarManagePhotoPageState extends State<CarManagePhotoPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<dynamic> _carPhotos = [];
  List<dynamic> _interiorPhotos = [];
  List<dynamic> _defectPhotos = [];
  List<dynamic> _dataPhotos = [];

  @override
  void initState() {
    _tabController = TabController(
        length: widget.tabs.length,
        vsync: this,
        initialIndex: widget.initIndex);
    for (var item in widget.model.carPhotos) {
      _carPhotos.add(item);
    }
    for (var item in widget.model.interiorPhotos) {
      _interiorPhotos.add(item);
    }
    for (var item in widget.model.defectPhotos) {
      _defectPhotos.add(item);
    }
    for (var item in widget.model.dataPhotos) {
      _dataPhotos.add(item);
    }

    super.initState();
  }

  Future uploadPhotos() async {
    widget.model.carPhotos.clear();
    widget.model.interiorPhotos.clear();
    widget.model.defectPhotos.clear();
    widget.model.dataPhotos.clear();
    for (var i = 0; i < _carPhotos.length; i++) {
      if (_carPhotos[i].runtimeType != String) {
        var url = await apiClient.uploadImage(_carPhotos[i]);
        _carPhotos.removeAt(i);
        _carPhotos.insert(i, url);
      }
      widget.model.carPhotos.add(_carPhotos[i]);
    }
    for (var i = 0; i < _interiorPhotos.length; i++) {
      if (_interiorPhotos[i].runtimeType != String) {
        var url = await apiClient.uploadImage(_interiorPhotos[i]);
        _interiorPhotos.removeAt(i);
        _interiorPhotos.insert(i, url);
      }
      widget.model.interiorPhotos.add(_interiorPhotos[i]);
    }
    for (var i = 0; i < _defectPhotos.length; i++) {
      if (_defectPhotos[i].runtimeType != String) {
        var url = await apiClient.uploadImage(_defectPhotos[i]);
        _defectPhotos.removeAt(i);
        _defectPhotos.insert(i, url);
      }
      widget.model.defectPhotos.add(_defectPhotos[i]);
    }
    for (var i = 0; i < _dataPhotos.length; i++) {
      if (_dataPhotos[i].runtimeType != String) {
        var url = await apiClient.uploadImage(_dataPhotos[i]);
        _dataPhotos.removeAt(i);
        _dataPhotos.insert(i, url);
      }
      widget.model.dataPhotos.add(_dataPhotos[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
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
        _getView(
          0,
        ),
        _getView(
          1,
        ),
        _getView(
          2,
        ),
        _getView(
          3,
        ),
      ]),
    );
  }

  Widget _getView(
    int index,
  ) {
    return Padding(
      padding: EdgeInsets.all(30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '按住照片拖动排序，第一张默认为首页',
            style: TextStyle(color: const Color(0xFF999999), fontSize: 28.sp),
          ),
          30.hb,
          MultiImagePickWidget(onChanged: (files) {
            switch (index) {
              case 0:
                _carPhotos = files;
                break;
              case 1:
                _interiorPhotos = files;
                break;
              case 2:
                _defectPhotos = files;
                break;
              case 3:
                _dataPhotos = files;
                break;
            }
            setState(() {});
          }),
        ],
      ),
    );
  }
}
