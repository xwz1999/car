// import 'package:cloud_car/utils/headers.dart';
// import 'package:flutter/material.dart';

// class ShareDetailPartnerPage extends StatefulWidget {
//   const ShareDetailPartnerPage({Key? key}) : super(key: key);

//   @override
//   _ShareDetailPartnerPageState createState() => _ShareDetailPartnerPageState();
// }

// class _ShareDetailPartnerPageState extends State<ShareDetailPartnerPage>
//     with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
//   List<dynamic>? data;
//   // ignore: non_constant_identifier_names

//   // a() {
//   //   //绘制多边形
//   //   const red = Colors.red;
//   //   const blue = Colors.blue;
//   //   @override
//   //   void paint(Canvas canvas, Size size) {
//   //     final paint = Paint();
//   //     final rect = Rect.fromLTRB(
//   //         0.0, 0.0, size.width, size.height); //定义绘制区域大小，为custompaint中的size属性
//   //     //************ */
//   //     canvas.clipRect(rect); //只绘制给定额度区域中的内容
//   //     paint.color = blue;
//   //     canvas.drawRect(rect, paint); //绘制矩形区域
//   //     paint.color = red;
//   //     canvas.drawCircle(Offset.zero, size.height, paint); //绘制圆形
//   //     //final rect =Rect.fromLTRB(left, top, right, bottom)
//   //   }

//   //   @override
//   //   bool shouldRepaint(CustomPainter oldDelegate) {
//   //     return false;
//   //   }
//   //   // void dispose() {
//   //   //   super.dispose();
//   //   // }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [Color(0xFF66A2FF), Color(0xffffffff)])),
//         child: Column(
//           children: [
//             16.hb,
//             _getHeard(),
//             28.hb,
//             _getBody(),
//             58.hb,
//             _getBottom()
//           ],
//         ),
//       ),
//     );
//   }

// //底部
//   _getBottom() {
//     return Row(
//       children: [
//         Padding(padding: EdgeInsets.only(left: 40.w)),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 getBox(),
//                 2.wb,
//                 getBox(),
//                 2.wb,
//                 getBox(),
//                 2.wb,
//                 getBox()
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

// //内容
//   _getBody() {
//     return Container(
//       margin: EdgeInsets.only(left: 40.w, right: 40.w),
//       padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.w),
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(16.w)),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Text(
//                 '云云问车合伙人邀请码',
//                 style: Theme.of(context).textTheme.subtitle1?.copyWith(
//                     fontSize: 40.sp,
//                     color: const Color(0xFF1986FF),
//                     fontWeight: FontWeight.bold),
//               ),
//               148.wb,
//               getBox(),
//               2.wb,
//               getBox(),
//               2.wb,
//               getBox(),
//               2.wb,
//               getBox(),
//             ],
//           ),
//           24.hb,
//           Divider(
//             height: 10.w,
//           ),
//           24.hb,
//           Container(
//             //padding: EdgeInsets.only(left: 24.w),
//             decoration:
//                 BoxDecoration(borderRadius: BorderRadius.circular(16.w)),
//             child: Stack(
//               children: [
//                 SizedBox(
//                   child: Image.asset(
//                     Assets.images.shareDetailsBg.path,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 Positioned(
//                     left: 46.w,
//                     top: 146.w,
//                     child: Text(
//                       '即刻成为',
//                       style: Theme.of(context).textTheme.subtitle1?.copyWith(
//                           color: const Color(0xffffffff), fontSize: 56.sp),
//                     )),
//                 Positioned(
//                     top: 226.w,
//                     left: 104.w,
//                     child: Text(
//                       '云云问车合伙人',
//                       style: Theme.of(context).textTheme.subtitle1?.copyWith(
//                           color: const Color(0xffffffff), fontSize: 72.sp),
//                     ))
//               ],
//             ),
//           ),
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
//                     '即刻成为云云问车合伙人',
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
//             getBox(),
//             2.wb,
//             getBox()
//           ],
//         ));
//   }

// //
//   // _getGraphics() {
//   //   return const CustomPaint(
//   //     //painter: a(),
//   //     size: Size(500, 400),
//   //   );
//   // }

//   @override
//   bool get wantKeepAlive => true;
// }

// class Button {
//   Button(Null Function() param0);
// }

// void column() {}
