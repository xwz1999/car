import 'package:cloud_car/model/car/inner_model/car_manage_photo_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:cloud_car/widget/picker/image_pick_widget/multi_image_pick_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PushReportPhotoPage extends StatefulWidget {


  const PushReportPhotoPage(
  {super.key, });

  @override
  _PushReportPhotoPageState createState() => _PushReportPhotoPageState();
}

class _PushReportPhotoPageState extends State<PushReportPhotoPage>
    with TickerProviderStateMixin {
  List<PushImgModel> _reportPhotos = [];


  @override
  void initState() {

    _reportPhotos = [
      PushImgModel(name: '漆面数据',url: '',isMust:true ),
      PushImgModel(name: '维保数据',url: '',isMust:true),
      PushImgModel(name: '行驶证照片',url: '',isMust:true),
      PushImgModel(name: '检测报告',url: '',isMust:true),
      PushImgModel(name: '登记证书',url: '',isMust:true),
      PushImgModel(name: '交强险',url: '',isMust:true),
      PushImgModel(name: '商业险',url: '',isMust:true),
    ];


    super.initState();
  }

  Future uploadPhotos() async {

  }

  @override
  Widget build(BuildContext context) {
    return CloudScaffold.normal(
        barHeight:88.w,
      title: '车辆发布',
      actions: [
        TextButton(
          onPressed: () async {

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
          )

        ],
      )
    );
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