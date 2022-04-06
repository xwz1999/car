import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class ShareDetailCustomerPage extends StatefulWidget {
  const ShareDetailCustomerPage({Key? key}) : super(key: key);

  @override
  _ShareDetailCustomerPageState createState() =>
      _ShareDetailCustomerPageState();
}

class _ShareDetailCustomerPageState extends State<ShareDetailCustomerPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names

  // a() {
  //   //绘制多边形
  //   const red = Colors.red;
  //   const blue = Colors.blue;
  //   @override
  //   void paint(Canvas canvas, Size size) {x
  //     final paint = Paint();
  //     final rect = Rect.fromLTRB(
  //         0.0, 0.0, size.width, size.height); //定义绘制区域大小，为custompaint中的size属性
  //     //************ */
  //     canvas.clipRect(rect); //只绘制给定额度区域中的内容
  //     paint.color = blue;
  //     canvas.drawRect(rect, paint); //绘制矩形区域
  //     paint.color = red;
  //     canvas.drawCircle(Offset.zero, size.height, paint); //绘制圆形
  //     //final rect =Rect.fromLTRB(left, top, right, bottom)
  //   }

  //   @override
  //   bool shouldRepaint(CustomPainter oldDelegate) {
  //     return false;
  //   }
  //   // void dispose() {
  //   //   super.dispose();
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
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
                            child: Image.asset(Assets.images.qrCode.path),
                          ),
                        )
                      ],
                    )),
                Positioned(
                    top: 1488.w,
                    right: 32.w,
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
                    )),
              ],
            )));
  }

//底部

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
                      //fontFamily: 'YouSheBiaoTiHei'
                    ),
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
