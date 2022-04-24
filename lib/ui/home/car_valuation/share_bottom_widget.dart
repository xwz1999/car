import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareBottomWidget extends StatefulWidget {


  const ShareBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  _ShareBottomWidgetState createState() => _ShareBottomWidgetState();
}

class _ShareBottomWidgetState extends State<ShareBottomWidget>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 468.w,
      decoration: BoxDecoration(
          color: BaseStyle.colorf6f6f6,
          borderRadius: BorderRadius.all(Radius.circular(16.w))),
      child: Column(
        children: [
          
          Row(
            children: [
              IconButton(onPressed: (){

              }, icon: Icon(
                CupertinoIcons.clear,
                size: 30.w,
                color: Colors.transparent,
              ),),
              const Spacer(),
              Text(
                '分享报告',
                style: TextStyle(
                    color: const Color(0xFF111111),
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(
                CupertinoIcons.clear,
                size: 30.w,
              ),),

              30.wb,
            ],
          ),
          40.hb,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.icons.icShareLink.path,
                      width: 96.w,
                      height: 96.w,
                    ),
                    5.hb,
                    Text(
                      '复制链接',
                      style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: BaseStyle.fontSize24),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.icons.icShareWx.path,
                      width: 96.w,
                      height: 96.w,
                    ),
                    5.hb,
                    Text(
                      '微信',
                      style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: BaseStyle.fontSize24),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.icons.icShareWxCircle.path,
                      width: 96.w,
                      height: 96.w,
                    ),
                    5.hb,
                    Text(
                      '朋友圈',
                      style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: BaseStyle.fontSize24),
                    )
                  ],
                ),
              ),
            ],
          ),
          40.hb,
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              height: 72.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.w)),
              ),
              child: Text(
                '取  消',
                style: TextStyle(
                    fontSize: BaseStyle.fontSize28,
                    fontWeight: FontWeight.bold,
                    color: BaseStyle.color333333),
              ),
            ),
          ),
          50.hb,
        ],
      ),
    );
  }

}
