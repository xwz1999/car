import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class CarImageItem extends StatelessWidget {
  const CarImageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: 32.w, right: 32.w),
        children: [
          24.hb,
          Row(
            children: [
              Expanded(child: getItem(Assets.images.carBanner.path,15)),
              34.wb,
              Expanded(child: getItem(Assets.images.carBanner.path,15)),
              34.wb,
              Expanded(child: getItem(Assets.images.carBanner.path,15)),
            ],
          )
        ],
      ),
    );
  }

  getItem(String path, int number) {
    return Container(
      width: 200.w,
      height: 150.w,
      clipBehavior: Clip.antiAlias,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),

      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            path,
            fit: BoxFit.fitHeight,
            height: 150.w,

          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 12.w),
                child: Text(
                  '$number张',
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
              ))
        ],
      ),
    );
  }
}
