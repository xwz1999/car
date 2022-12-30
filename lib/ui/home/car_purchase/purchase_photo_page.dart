

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/model/contract/purchase_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/publish_finish_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_report_photo_page.dart';
import 'package:cloud_car/ui/home/car_purchase/purchase_info_page.dart';
import 'package:cloud_car/ui/home/car_purchase/purchase_push_car_page.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/picker/image_pick_widget/multi_image_pick_widget.dart';
import '../car_manager/direct_sale/car_image_page.dart';
///再带个个人与公司
class PurchasePhotoPage extends StatefulWidget {
  final PurchaseCarInfo purchaseCarInfo;
  final PurchaseInfo purchaseInfo;
  final PurchasePhotoModel reportPhotoModel;
  final String legalName;
  // final PushPhotoModel model;
  const PurchasePhotoPage(
  {super.key, required this.purchaseCarInfo, required this.purchaseInfo, required this.reportPhotoModel, required this.legalName});

  @override
  _PurchasePhotoPageState createState() => _PurchasePhotoPageState();
}

class _PurchasePhotoPageState extends State<PurchasePhotoPage>
    with TickerProviderStateMixin {
  // List<dynamic> _reportPhotos = [];
  List<dynamic> _reportPhotos = [];
  List<PushImgModel> _certificatesPhotos = [];
  // List<dynamic> _carPhotos = [];
  // String img='';

  @override
  void initState() {
    // _reportPhotos = [
    //   PushImgModel(name: '',isMust:true ),
    //   PushImgModel(name: '左面',isMust:true ),
    //   PushImgModel(name: '后面',isMust:true ),
    //   PushImgModel(name: '右面',isMust:true ),
    //   PushImgModel(name: '表显里程',isMust:true ),
    // ];

    _certificatesPhotos=[
      PushImgModel(name: '行驶证',isMust:true ),
      PushImgModel(name: '维修记录',isMust: true),
      PushImgModel(name: '表显里程',isMust:true ),
      PushImgModel(name: '登记证书',),
      PushImgModel(name: '购置税发票'),
      PushImgModel(name: '年检凭证'),
      PushImgModel(name: '购车证明'),
      PushImgModel(name: '保险单材料'),
      PushImgModel(name: '车主身份证明')
    ];
    //
    // for(int i=0;i<widget.reportPhotoModel.carPhotos!.length;i++){
    //   for(int j=0;j<_reportPhotos.length;j++){
    //     if(_reportPhotos[j].name == widget.reportPhotoModel.carPhotos![i].text){
    //       if(widget.reportPhotoModel.carPhotos![i].photo!=null){
    //         _reportPhotos[j].url = widget.reportPhotoModel.carPhotos![i].photo;
    //       }
    //     }
    //   }
    // }

    for (var item in widget.reportPhotoModel.carPhotos!) {
      _reportPhotos.add(item.photo);
    }
    for(int i=0;i<widget.reportPhotoModel.dataPhotos!.length;i++){
      for(int j=0;j<_certificatesPhotos.length;j++){
        if(_certificatesPhotos[j].name == widget.reportPhotoModel.dataPhotos![i].text){
          if(widget.reportPhotoModel.dataPhotos![i].photo!=null){
            _certificatesPhotos[j].url = widget.reportPhotoModel.dataPhotos![i].photo;
          }

        }
      }
    }
    super.initState();
  }

  Future uploadPhotos() async {
    widget.reportPhotoModel.carPhotos!.clear();
    for (var i = 0; i < _reportPhotos.length; i++) {
      if (_reportPhotos[i].runtimeType != String) {
        var url = await apiClient.uploadImage(_reportPhotos[i]);
        _reportPhotos.removeAt(i);
        _reportPhotos.insert(i, url);
      }
      widget.reportPhotoModel.carPhotos!
          .add(CarPhotos(photo: _reportPhotos[i], text: '车辆照片'));
    }
      // widget.reportPhotoModel.carPhotos!.clear();
      // for (var i = 0; i < _reportPhotos.length; i++) {
      //   if (_reportPhotos[i].url.runtimeType != String&&_reportPhotos[i].url.runtimeType != Null) {
      //     var url = await apiClient.uploadImage(
      //         _reportPhotos[i].url );
      //     _reportPhotos[i].url = url;
      //   }
      //   widget.reportPhotoModel.carPhotos!.add(CarPhotos(photo: _reportPhotos[i].url,text: _reportPhotos[i].name)  );
      // }

      widget.reportPhotoModel.dataPhotos!.clear();
      for (var i = 0; i < _certificatesPhotos.length; i++) {
        if (_certificatesPhotos[i].url.runtimeType != String&&_certificatesPhotos[i].url.runtimeType != Null) {
          var url = await apiClient.uploadImage(
              _certificatesPhotos[i].url );
          _certificatesPhotos[i].url = url;
        }
        widget.reportPhotoModel.dataPhotos!.add(CarPhotos(photo: _certificatesPhotos[i].url,text: _certificatesPhotos[i].name)  );
      }

  }

  @override
  Widget build(BuildContext context) {
    return CloudScaffold.normal(
        barHeight:88.w,
      title: '车辆照片',
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.all(24.w),
                child: '车辆照片'.text.size(32.sp).color(const Color(0xFF999999)).make(),
              ),
            ],
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child:

            _getView1(_reportPhotos),
            //   //isPadding: false,
            // ),
            // _getView(_reportPhotos,true),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.all(24.w),
                child: '手续证件'.text.size(32.sp).color(const Color(0xFF999999)).make(),
              ),
            ],
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child: _getView(_certificatesPhotos,false),
          ),

          20.hb,
          CloudBottomButton(
            onTap: () async{
              await uploadPhotos();
              if (!canTap) {
                return;
              }
              // print(widget.purchaseInfo.transactionAmount);
              // print(widget.purchaseInfo.downPaymentAmount);
            var result = await  CarFunc.addPurchase(widget.purchaseCarInfo,widget.purchaseInfo,widget.reportPhotoModel,widget.legalName);

              if(result){
                Get.to(() => const PublishFinishPage(title: '发起合同',));
              }
            },
            text: '发起合同',
          ),
          50.hb,
        ],
      )
    );
  }

  bool get canTap {
    // if(img.isEmpty){
    //   BotToast.showText(text: "请先上传车辆照片");
    //   return false;
    // }
    for(var item in widget.reportPhotoModel.dataPhotos!){
      if(item.text=='行驶证'&&item.photo==null){
        BotToast.showText(text: '请先上传行驶证照片');
        return false;
      }
      if(item.text=='表显里程'&&item.photo==null){
        BotToast.showText(text: '请先上传表显里程');
        return false;
      }
      if(item.text=='维修记录' && item.photo==null){
        BotToast.showText(text: '请先上传维修记录');
        return false;
      }
    }
    return true;
  }

  Widget _getView(
      List<PushImgModel> list,
      bool isCar
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
            crossAxisSpacing: 15,
            //子组件宽高长度比例
            childAspectRatio: 100/100),
        itemBuilder: (BuildContext context, int iIndex) {
          return _buildChild(list[iIndex],iIndex,isCar);
        });
  }

  Widget _getView1(
      // int index,
      List<dynamic> list,
      ) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '按住照片拖动排序，第一张默认为首页',
            style: TextStyle(color: const Color(0xFF999999), fontSize: 28.sp),
          ),
          20.hb,
          MultiImagePickWidget(
            photos: list,
            onChanged: (files) {
             _reportPhotos=files;
              setState(() {});
            },
            maxCount:  null ,
          ),
        ],
      ),
    );
  }
  Widget _buildChild(PushImgModel model,int index,bool isCar) {
    return GestureDetector(
      onTap: () async {
        var value =
        await CloudImagePicker.pickSingleImage(title: '选择图片');
        if(isCar){
          _reportPhotos[index].url = value;
        }else{
          _certificatesPhotos[index].url = value;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.w),
                  child:   model.isMust!=null&&model.isMust!?
                  '* '.text.size(28.sp).color(Colors.red).make().paddingOnly(top: 5):const SizedBox(),
                ),

                ( model.name??'').text.size(28.sp).black.make(),
              ],
            )

          ],
        ),
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

}
