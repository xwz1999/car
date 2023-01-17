import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/model/contract/report_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/new_push_car_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/publish_finish_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_photo_model.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class PushReportPhotoPage extends StatefulWidget {
  final NewPublishCarInfo newPublishCarInfo;
  final PushPhotoModel pushPhotoModel;
  final ReportPhotoModel reportPhotoModel;
  const PushReportPhotoPage(
  {super.key, required this.newPublishCarInfo, required this.pushPhotoModel, required this.reportPhotoModel, });

  @override
  _PushReportPhotoPageState createState() => _PushReportPhotoPageState();
}

class _PushReportPhotoPageState extends State<PushReportPhotoPage>
    with TickerProviderStateMixin {
  List<PushImgModel> _reportPhotos = [];


  @override
  void initState() {

    _reportPhotos = [
      PushImgModel(name: '漆面数据',isMust:true ),
      PushImgModel(name: '维保数据',isMust:true),
      PushImgModel(name: '行驶证照片',isMust:true),
      PushImgModel(name: '检测报告',isMust:true),
      PushImgModel(name: '登记证书',isMust:true),
      PushImgModel(name: '交强险',isMust:false),
      PushImgModel(name: '商业险',isMust:false),
    ];

    for(int i=0;i<widget.reportPhotoModel.paints!.length;i++){
      for(int j=0;j<_reportPhotos.length;j++){
        if(_reportPhotos[j].name == widget.reportPhotoModel.paints![i].text){
          if(widget.reportPhotoModel.paints![i].photo!=null){
            _reportPhotos[j].url = widget.reportPhotoModel.paints![i].photo;
          }

        }
      }
    }
    super.initState();
  }

  Future uploadPhotos() async {
      widget.reportPhotoModel.paints!.clear();

      for (var i = 0; i < _reportPhotos.length; i++) {
        if (_reportPhotos[i].url.runtimeType != String&&_reportPhotos[i].url.runtimeType != Null) {
          var url = await apiClient.uploadImage(
              _reportPhotos[i].url );
          _reportPhotos[i].url = url;
        }
        widget.reportPhotoModel.paints!.add(CarPhotos(photo: _reportPhotos[i].url,text: _reportPhotos[i].name!)  );
      }
  }



  @override
  Widget build(BuildContext context) {
    return CloudScaffold.normal(
        barHeight:88.w,
      title: '车辆发布',
      actions: [
        TextButton(
          onPressed: () async {
            uploadPhotos();
            Get.back();
          },
          child: Text(
            '上一步',
            style: TextStyle(
              fontSize: 28.sp,
              color: const Color(0xFF027AFF),
            ),
          ),
        )
      ],
      body: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.all(32.w),
                child: '报告数据'.text.size(32.sp).black.bold.make(),
              ),
            ],
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child: _getView(_reportPhotos),
          ),

          100.hb,
          CloudBottomButton(
            onTap: () async{
              CloudToast.loading;
              if (!canTap) {
                BotToast.closeAllLoading();
                return;
              }
              await uploadPhotos();
              BotToast.closeAllLoading();
            // var result = await  CarFunc.newPushCar(reportPhotoModel: widget.reportPhotoModel,
              //             //     pushPhotoModel: widget.pushPhotoModel, newPublishCarInfo: widget.newPublishCarInfo);
              var result = await  CarFunc.newPushCar(
                  pushPhotoModel: widget.pushPhotoModel, newPublishCarInfo: widget.newPublishCarInfo);
              if(result){
                Get.to(() => const PublishFinishPage());
              }
              // else{
              //   BotToast.showText(text: '发布失败');
              // }
            },
            text: '提交',
          )
        ],
      )
    );
  }

  bool get canTap {
    for(var item in widget.reportPhotoModel.paints!){
      if(item.text=='漆面数据'&&item.photo==null){
        BotToast.showText(text: '请先上传漆面数据');
        return false;
      }
      if(item.text=='维保数据'&&item.photo==null){
        BotToast.showText(text: '请先上传维保数据');
        return false;
      }
      if(item.text=='行驶证照片'&&item.photo==null){
        BotToast.showText(text: '请先上传行驶证照片');
        return false;
      }
      if(item.text=='检测报告'&&item.photo==null){
        BotToast.showText(text: '请先上传检测报告');
        return false;
      }
      if(item.text=='登记证书'&&item.photo==null){
        BotToast.showText(text: '请先上登记证书');
        return false;
      }
    }
    return true;
  }

  Widget _getView(
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
            crossAxisSpacing: 15,
            //子组件宽高长度比例
            childAspectRatio: 100/100),
        itemBuilder: (BuildContext context, int iIndex) {
          return _buildChild(list[iIndex],iIndex);
        });
  }

  Widget _buildChild(PushImgModel model,int index) {
    return GestureDetector(
      onTap: () async {

        var value =
        await CloudImagePicker.pickSingleImage(title: '选择图片');
        _reportPhotos[index].url = value;
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
                )
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

class PushImgModel {
  String? name;
  dynamic url;
  bool? isMust;

  PushImgModel({
    this.name,
    this.url,
    this.isMust
  });
}