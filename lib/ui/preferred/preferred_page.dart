
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';



class PreferredPage extends StatefulWidget {
  const PreferredPage({Key? key}) : super(key: key);

  @override
  _PreferredPageState createState() => _PreferredPageState();
}

class _PreferredPageState extends State<PreferredPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {

  List<dynamic>? data;

  late EasyRefreshController _refreshController;



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CloudScaffold(
      path: Assets.images.homeBg.path,
      bodyColor: bgColor,
      systemStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      appbar: Container(
        color: Colors.transparent,
        height: kToolbarHeight + MediaQuery.of(context).padding.top,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     32.wb,
        //     SizedBox(
        //       //头像
        //       width: 64.w, height: 64.w,
        //       child: AspectRatio(
        //         aspectRatio: 1,
        //         child: ClipRRect(
        //             borderRadius: BorderRadius.all(Radius.circular(32.w)),
        //             child: Container(
        //               color: Colors.blue,
        //             )),
        //       ),
        //     ),
        //     16.wb,
        //     Text('Hi,张三',
        //         style: TextStyle(
        //             color: BaseStyle.color111111,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 32.sp)),
        //     const Spacer(),
        //     GestureDetector(
        //       onTap: () {
        //         Get.to(() => const SearchPage());
        //       },
        //       child: Image.asset(Assets.icons.mainSearch.path,
        //           height: 48.w, width: 48.w),
        //     ),
        //     24.wb,
        //     GestureDetector(
        //       onTap: () {
        //         Get.to(() => const TaskPage());
        //       },
        //       child: Image.asset(Assets.icons.mainMenu.path,
        //           height: 48.w, width: 48.w),
        //     ),
        //     32.wb,
        //   ],
        // ),
      ),
      extendBody: true,
      body: Expanded(
        child: ListView(
          children: [

          ],
        ),
      ),
    );
  }


  @override
  bool get wantKeepAlive => true;
}

