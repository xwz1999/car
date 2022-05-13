import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_car/constants/const_data.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';

import 'package:cloud_car/utils/user_tool.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:screenshot/screenshot.dart';

class ShareDetailCustomerPage extends StatefulWidget {
  const ShareDetailCustomerPage({Key? key}) : super(key: key);

  @override
  _ShareDetailCustomerPageState createState() =>
      _ShareDetailCustomerPageState();
}

class _ShareDetailCustomerPageState extends State<ShareDetailCustomerPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  final GlobalKey _globalKey = GlobalKey();
  List<Uint8List> images = [];

  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RepaintBoundary(
        key: _globalKey,
        child: Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF66A2FF), kForeGroundColor])),
                child: Stack(
                  children: [
                    Align(
                      child: Image.asset(
                        Assets.images.inviteCodeBg.path,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: 80.w,
                      top: 184.w,
                      child: Text(
                        '云云问车客户邀请码',
                        //UserTool.userProvider.userInfo.inviteCode,
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              fontSize: 40.sp,
                              color: const Color(0xFF1986FF),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Positioned(left: 72.w, top: 280.w, child: _getbody()),
                    Positioned(
                        left: 70.w,
                        top: 1246.w,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('扫码识别'),
                                Text(
                                  '即可成为云云问车客户',
                                  style: Theme.of(context).textTheme.subtitle2,
                                )
                              ],
                            ),
                            200.wb,
                            Padding(
                              padding: EdgeInsets.only(right: 32.w),
                              child: SizedBox(
                                width: 128.w,
                                height: 128.w,
                                child: Container(
                                  padding: EdgeInsets.all(4.w),
                                  color: Colors.white,
                                  child: BarcodeWidget(
                                      width: 128
                                          .w, //double.parse(widget.model.size),
                                      height: 128
                                          .w, //double.parse(widget.model.size),
                                      data:
                                          '$posterCodePrefix?inviteCode=${UserTool.userProvider.userInfo.inviteCode}',
                                      barcode: Barcode.qrCode()),
                                ),
                              ),
                            )
                          ],
                        )),
                    Positioned(
                        top: 1488.w,
                        right: 32.w,
                        child: GestureDetector(
                          onTap: () async {
                            checkPermission(saveAssetsImage());
                            // var permission = await Permission.storage.isGranted;
                            // if (!permission) {
                            //   await Permission.storage.request();
                            //   var permissionTwice =
                            //       await Permission.storage.isGranted;
                            //   if (!permissionTwice) {
                            //     CloudToast.show('权限未授予');
                            //     return;
                            //   }
                            // }
                            // var u8List = await _screenshotController.capture(
                            //     delay: const Duration(milliseconds: 10));
                            // if (u8List != null) {
                            //   print('aaaa+${u8List}');
                            //   var re = await ImageGallerySaver.saveImage(
                            //     u8List,
                            //     quality: 100,
                            //   );
                            //   if (re['isSuccess']) {
                            //     CloudToast.show('邀请码已保存到${re['filePath']}',
                            //         align: Alignment.center);
                            //   } else {
                            //     print(u8List);
                            //     CloudToast.show('保存邀请码失败');
                            //   }
                            // } else {
                            //   print('aaaa+${u8List}');
                            //   CloudToast.show('邀请码生成失败');
                            // }
                          },
                          child: Container(
                            width: 72.w,
                            height: 72.w,
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                                color: const Color(0xFF000000).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(36.w)),
                            child: Image.asset(
                              Assets.images.download.path,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                  ],
                ))));
  }

  ///动态申请权限，iOS 要在info.plist 上面添加
  Future<bool> requestPermission() async {
    if (Platform.isIOS) {
      var status = await Permission.photos.status;
      if (status.isDenied) {
        await [Permission.photos].request();
      }
      return status.isGranted;
    } else {
      var status = await Permission.storage.status;
      if (status.isDenied) {
        await [Permission.photos].request();
      }
      return status.isGranted;
    }
  }

  ///保存图片到的权限校验
  checkPermission(Future<dynamic> fun) {
    requestPermission().then((value) => {
          if (value)
            {
              //执行操作
              fun
            }
          else
            {
              //去授权  储存权限
              openAppSettings()
            }
        });
  }

  ///保存APP里的图片
  saveAssetsImage() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
        await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final result = await ImageGallerySaver.saveImage(
          byteData.buffer.asUint8List(),
          quality: 100);
      if (result['isSuccess']) {
        CloudToast.show('邀请码已保存到${result['filePath']}',
            align: Alignment.center);
      }
    }
  }
//底部
//   _getBottom() {
//     return Row(
//       children: [
//         Padding(padding: EdgeInsets.only(left: 40.w)),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 //getBox(),
//                 2.wb,
//                 //getBox(),
//                 2.wb,
//                 //getBox(),
//                 2.wb,
//                 //getBox()
//               ],
//             ),
//             Container(
//               width: 560.w,
//               height: 4.w,
//               decoration: const BoxDecoration(color: Colors.black
//                   // gradient: LinearGradient(
//                   //     begin: Alignment.center,
//                   //     end: Alignment.center,
//                   //     colors: [Color(0xFF86B5FF), Color(0x00FFFFFF)]),
//                   ),
//             )
//           ],
//         ),
//         46.wb,
//         GestureDetector(
//           child: Stack(
//             children: [
//               Container(
//                 width: 72.w,
//                 height: 72.w,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(36.w),
//                     color: const Color.fromRGBO(0, 0, 0, 0.5)),
//               ),
//               Positioned(
//                   left: 20.w,
//                   top: 20.w,
//                   child: SizedBox(
//                     width: 32.w,
//                     height: 32.w,
//                     child: Image.asset(Assets.images.download.path),
//                   ))
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//
  _getbody() {
    return SizedBox(
      //padding: EdgeInsets.only(left: 24.w),
      width: 604.w,
      height: 870.w,

      child: Stack(
        children: [
          Align(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(16.w)),
              clipBehavior: Clip.antiAlias, //阴影
              child: Image.asset(
                Assets.images.shareDetailsBg.path,
                fit: BoxFit.fill,
              ),
            ),
          ),
          // SizedBox(
          //   child:
          // Image.asset(
          //     Assets.images.shareDetailsBg.path,
          //     fit: BoxFit.fill,
          //   ),
          // ),
          Positioned(
              left: 46.w,
              top: 146.w,
              child: Text(
                '即刻成为',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: kForeGroundColor,
                    fontSize: 56.sp,
                    fontFamily: 'YouSheBiaoTiHei'),
              )),
          Positioned(
              top: 226.w,
              left: 104.w,
              child: Text(
                '云云问车客户',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: kForeGroundColor, fontSize: 72.sp),
              ))
        ],
      ),
    );
  }

//内容
//   _getBody1() {
//     return Container(
//       margin: EdgeInsets.only(left: 40.w, right: 40.w),
//       padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.w),
//       decoration: BoxDecoration(
//           color: Colors.red, borderRadius: BorderRadius.circular(16.w)),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Text(
//                 '云云问车客户邀请码',
//                 style: Theme.of(context).textTheme.subtitle1?.copyWith(
//                     fontSize: 40.sp,
//                     color: const Color(0xFF1986FF),
//                     fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           24.hb,
//           Divider(
//             height: 10.w,
//           ),
//           24.hb,
//           32.hb,
//           Divider(
//             height: 10.w,
//           ),
//           62.hb,
//           Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '扫码识别',
//                     style: Theme.of(context).textTheme.subtitle1?.copyWith(
//                         fontSize: 40.sp, fontWeight: FontWeight.bold),
//                   ),
//                   22.hb,
//                   Text(
//                     '即刻成为云云问车客户',
//                     style: Theme.of(context).textTheme.subtitle2,
//                   )
//                 ],
//               ),
//               150.wb,
//               SizedBox(
//                 width: 128.w,
//                 height: 128.w,
//                 child: Image.asset(
//                   Assets.images.qrCode.path,
//                   fit: BoxFit.fill,
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }

// //头部
//   _getHeard() {
//     return Container(
//       width: 750.w,
//       height: 100.w,
//       padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.w),
//       // decoration: const BoxDecoration(
//       //     gradient: LinearGradient(
//       //         begin: Alignment.centerLeft,
//       //         end: Alignment.centerRight,
//       //         colors: [
//       //       Color.fromRGBO(102, 162, 255, 0.5),
//       //       Color.fromRGBO(238, 238, 238, 0)
//       //     ])),
//       child: Row(
//         children: [getTitle(), 16.wb, getTitle(), 16.wb, getTitle()],
//       ),
//     );
//   }

// //框
//   getBox() {
//     return Container(
//       width: 16.w,
//       height: 14.w,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [Color(0x008FB4FF), Color(0xffffffff)],
//         ),
//       ),
//     );
//   }

// //文字
//   getTitle() {
//     return Opacity(
//         opacity: 0.5,
//         child: Row(
//           children: [
//             SizedBox(
//               width: 176.w,
//               height: 20.w,
//               child: Row(children: [
//                 Text('YUNYUNWENCEH',
//                     style: Theme.of(context).textTheme.bodyText1?.copyWith(
//                           color: const Color(0xffffffff),
//                           fontSize: 20.sp,
//                         ))
//               ]),
//             ),
//             8.wb,
//             //getBox(),
//             2.wb,
//             //getBox()
//           ],
//         ));
//   }

//
  // _getGraphics() {
  //   return const CustomPaint(
  //     //painter: a(),
  //     size: Size(500, 400),
  //   );
  // }

  @override
  bool get wantKeepAlive => true;
}

class Button {
  Button(Null Function() param0);
}

void column() {}
