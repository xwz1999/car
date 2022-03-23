// import 'package:camera/camera.dart';
// import 'package:cloud_car/utils/headers.dart';
// import 'package:cloud_car/widget/cloud_back_button.dart';
// import 'package:flutter/material.dart';

// class FaceRecognitionPage extends StatefulWidget {
//   const FaceRecognitionPage({Key? key}) : super(key: key);

//   @override
//   _FaceRecognitionPageState createState() => _FaceRecognitionPageState();
// }

// class _FaceRecognitionPageState extends State<FaceRecognitionPage> {
//   List<dynamic>? data;

//   late Object photoPath;

//   late bool showProgressDialog;

//   late bool restart;

//   get controller => null;

//   get onTakePictureButtonPressed => null;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: const CloudBackButton(
//             color: Color(0xffffffff),
//             isSpecial: true,
//           ),
//           backgroundColor: const Color(0xFFA0A0A0), //头部颜色
//           // title: Text('个人实名认证',
//           //     style: TextStyle(
//           //         color: BaseStyle.color111111,
//           //         fontSize: BaseStyle.fontSize36,
//           //         fontWeight: FontWeight.bold)),
//           actions: [
//             Container(
//               padding: EdgeInsets.only(right: 32.w, top: 32.w),
//               child: Text('相册',
//                   style: Theme.of(context)
//                       .textTheme
//                       .subtitle2
//                       ?.copyWith(color: const Color(0xffffffff))),
//             )
//           ],
//         ),
//         backgroundColor: const Color(0xFFA0A0A0), //内容颜色
//         extendBody: true,
//         body: Stack(children: <Widget>[
//           Column(
//             children: <Widget>[
//               500.hb,
//               Expanded(
//                 flex: 3, //flex用来设置当前可用空间的占优比
//                 child: Stack(children: <Widget>[
//                   _cameraPreviewWidget(), //相机视图
//                   _cameraFloatImage(), //悬浮的身份证框图
//                 ]),
//               ),
//               Expanded(
//                 flex: 1, //flex用来设置当前可用空间的占优比
//                 child: _takePictureLayout(), //拍照操作区域布局
//               ),
//               124.hb
//             ],
//           ),

//           //getPhotoPreview(), //图片预览布局

//           // getProgressDialog(), //数据加载中提示框

//           //getRestartAlert(), // 身份证识别失败，重新拍照的提示按钮
//         ]));
//   }

// //相机

// //相机预览
//   _cameraPreviewWidget() {
//     if (controller == null || !controller.value.isInitialized) {
//       return const Text(
//         '',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 24.0,
//           fontWeight: FontWeight.w900,
//         ),
//       );
//     } else {
//       return SizedBox(
//         width: double.infinity,
//         child: AspectRatio(
//           aspectRatio: controller.value.aspectRatio,
//           child: CameraPreview(controller),
//         ),
//       );
//     }
//   }

// //身份证框图
//   _cameraFloatImage() {
//     return Positioned(
//         child: Container(
//       width: 656.w,
//       height: 424.w,
//       decoration: BoxDecoration(
//           border: Border.all(width: 4.w, color: Colors.white),
//           borderRadius: BorderRadius.circular(16.w)),
//       child: Column(
//         children: [
//           Container(
//             width: 336.w,
//             height: 28.w,
//             margin: EdgeInsets.only(
//               top: 32.w,
//             ),
//             child: Text(
//               '中华人民共和国居民身份证',
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyText1
//                   ?.copyWith(color: const Color(0xffffffff)),
//             ),
//           ),
//           Container(
//             width: 144.w,
//             height: 172.w,
//             margin: EdgeInsets.only(top: 54.w, left: 248.w),
//             child: Image.asset(
//               Assets.images.head.path,
//               fit: BoxFit.fill,
//             ),
//           )
//         ],
//       ),
//       // margin: const EdgeInsets.fromLTRB(50, 50, 50, 50),
//       // child: Image.asset(Assets.images.head.path),
//     ));
//   }

// //拍照区域
//   Widget _takePictureLayout() {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: GestureDetector(
//         child: Container(
//           margin: EdgeInsets.all(3.w),
//           width: 116.w,
//           height: 116.w,
//           decoration: BoxDecoration(
//               border: Border.all(
//                   width: 12.w, color: const Color.fromRGBO(255, 255, 255, 0.5)),
//               borderRadius: BorderRadius.circular(58.w)),
//           child: Container(
//             width: 96.w,
//             height: 96.w,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(48.w),
//                 color: const Color(0xffffffff)),
//           ),
//         ),
//       ),
//     );
//   }

//   //拍照后的图片预览
//   // Widget getPhotoPreview() {
//   //   if (null != photoPath) {
//   //     return Container(
//   //       width: double.infinity,
//   //       height: double.infinity,
//   //       color: Colors.black,
//   //       alignment: Alignment.center,
//   //       child: Image.file(File('assets/images/head.png')),
//   //     );
//   //   } else {
//   //     return Container(
//   //       height: 1.0,
//   //       width: 1.0,
//   //       color: Colors.black,
//   //       alignment: Alignment.bottomLeft,
//   //     );
//   //   }
//   // }

// //识别身份证时的加载框
//   // Widget getProgressDialog() {
//   //   if (showProgressDialog) {
//   //     return Container(
//   //       color: Colors.black12,
//   //       alignment: Alignment.center,
//   //       child: const SpinKitFadingCircle(color: Colors.blueAccent),
//   //     );
//   //   } else {
//   //     return Container(
//   //       height: 1.0,
//   //       width: 1.0,
//   //       color: Colors.black,
//   //       alignment: Alignment.bottomLeft,
//   //     );
//   //   }
//   // }

// //身份证识别失败的提示信息
//   // Widget getRestartAlert() {
//   //   if (restart) {
//   //     return Container(
//   //       color: Colors.white,
//   //       alignment: Alignment.center,
//   //       child: Column(children: <Widget>[
//   //         const Text(
//   //           "身份证识别失败，重新采集识别?",
//   //           style: TextStyle(color: Colors.black26, fontSize: 18.0),
//   //         ),
//   //         IconButton(
//   //           icon: const Icon(
//   //             Icons.subdirectory_arrow_right,
//   //             color: Colors.blueAccent,
//   //           ),
//   //           onPressed: toRestartIdentify(),
//   //         ),
//   //       ]),
//   //     );
//   //   } else {
//   //     return Container(
//   //       height: 1.0,
//   //       width: 1.0,
//   //       color: Colors.black,
//   //       alignment: Alignment.bottomLeft,
//   //     );
//   //   }
//   // }

//   toRestartIdentify() {}
// }
