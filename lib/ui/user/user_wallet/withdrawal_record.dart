

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

class WithdrawalRecordPage extends StatefulWidget {
  const WithdrawalRecordPage({Key? key}) : super(key: key);

  @override
  _WithdrawalRecordPageState createState() => _WithdrawalRecordPageState();
}

class _WithdrawalRecordPageState extends State<WithdrawalRecordPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  late final Rect position;
  late final double menuHeight;

  @override
  @override
  void dispose() {
    super.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          title: Text('提现记录', style: Theme.of(context).textTheme.headline6),
        ),
        extendBody: true,
        //extendBodyBehindAppBar: true,
        body: Container(
          //padding: EdgeInsets.symmetric(horizontal: 32.w),
          color: const Color.fromRGBO(246, 246, 246, 1),
          child: Column(
            children: [
              //Padding(padding: EdgeInsets.symmetric(horizontal: 32.w)),
              _downList()
            ],
          ),
        ));
  }

//自定义下拉列表
  _downList() {
    return Container(
      color: Colors.red,
      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     border: const Border(
      //       bottom: BorderSide(color: Colors.black),
      //       top: BorderSide(color: Colors.white),
      //       left: BorderSide(color: Colors.white),
      //       right: BorderSide(color: Colors.white),
      //     ), //单边框
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(16.w),
      //         bottomRight: Radius.circular(16.w))),
      child: GestureDetector(
        onTap: (() {
          // RenderBox renderBox = _globalKey.currentContext.findRenderObject();
          // Rect box = renderBox.localToGlobal(Offset.zero) & renderBox.size;
          // (box);
          // Navigator.push(
          //     context, _DropDownMenuRoute(position: box, menuHeight: 300));
        }),
        child: Row(
          children: [
            const Text('data'),
            16.wb,
            SizedBox(
              width: 32.w,
              height: 32.w,
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Color.fromRGBO(102, 102, 102, 1),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// class _globalKey {
//   static var currentContext;
// }

//___________________________________________________________
// class _DropDownMenuRouteLayout extends SingleChildLayoutDelegate {
//   final Rect position;
//   final double menuHeight;
//
//   _DropDownMenuRouteLayout({required this.position, required this.menuHeight});
//
//   @override
//   BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
//     return BoxConstraints.loose(Size(position.right - position.left, 300));
//   }
//
//   @override
//   Offset getPositionForChild(Size size, Size childSize) {
//     return Offset(0, position.bottom);
//   }
//
//   @override
//   bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) {
//     return true;
//   }
// }

// class _DropDownMenuRoute extends PopupRoute {
//   final Rect position;
//   final double menuHeight;
//
//   _DropDownMenuRoute({required this.position, required this.menuHeight});
//
//   @override
//   Color? get barrierColor => null;
//
//   @override
//   bool get barrierDismissible => true;
//
//   @override
//   String? get barrierLabel => null;
//
//   @override
//   Widget buildPage(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation) {
//     return CustomSingleChildLayout(
//       delegate:
//           _DropDownMenuRouteLayout(position: position, menuHeight: menuHeight),
//       child: SizeTransition(
//         sizeFactor: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
//         child: Container(
//           color: const Color(0xffff0000),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Duration get transitionDuration => const Duration(milliseconds: 300);
// }

void column() {}
