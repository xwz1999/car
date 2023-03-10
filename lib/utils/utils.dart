//
import 'package:cloud_car/ui/home/az_region_model.dart';
import 'package:cloud_car/utils/headers.dart';
//
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class Utils {
  static String getImgPath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  static void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  ///列表里的字母头
  static Widget getSusItem(BuildContext context, String tag,
      {double susHeight = 40}) {
    if (tag == '★') {
      tag = '★ 热门城市';
    }
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 16.0),
      color: const Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        tag,
        softWrap: false,
        style: const TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }

  static Widget getListItem(BuildContext context,AzRegionModel model, Function(String name,int id) callBack,
      {double susHeight = 40}) {
    return ListTile(
      title: Text(model.name),
      onTap: () {
        callBack(model.name,model.id??0);
      },
    );
//    return Column(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        Offstage(
//          offstage: !(model.isShowSuspension == true),
//          child: getSusItem(context, model.getSuspensionTag(),
//              susHeight: susHeight),
//        ),
//        ListTile(
//          title: Text(model.name),
//          onTap: () {
//            LogUtil.e("onItemClick : $model");
//            Utils.showSnackBar(context, 'onItemClick : ${model.name}');
//          },
//        )
//      ],
//    );
  }

  static Widget getWeChatListItem(
    BuildContext context,
    AzContactInfoModel model, {
    double susHeight = 40,
    Color? defHeaderBgColor,
  }) {
    return getWeChatItem(context, model, defHeaderBgColor: defHeaderBgColor);
//    return Column(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        Offstage(
//          offstage: !(model.isShowSuspension == true),
//          child: getSusItem(context, model.getSuspensionTag(),
//              susHeight: susHeight),
//        ),
//        getWeChatItem(context, model, defHeaderBgColor: defHeaderBgColor),
//      ],
//    );
  }

  static Widget getWeChatItem(
    BuildContext context,
    AzContactInfoModel model, {
    Color? defHeaderBgColor,
  }) {
    DecorationImage? image;
//    if (model.img != null && model.img.isNotEmpty) {
//      image = DecorationImage(
//        image: CachedNetworkImageProvider(model.img),
//        fit: BoxFit.contain,
//      );
//    }
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4.0),
          color: model.bgColor ?? defHeaderBgColor,
          image: image,
        ),
        child: model.iconData == null
            ? null
            : Icon(
                model.iconData,
                color: Colors.white,
                size: 20,
              ),
      ),
      title: Text(model.name),
      onTap: () {
        LogUtil.e("onItemClick : $model");
        Utils.showSnackBar(context, 'onItemClick : ${model.name}');
      },
    );
  }

//3月23日
  static getPayCardStr(String code) {
    final int length = code.length;
    final int replaceLength = length - 4;
    final String replacement =
        List<String>.generate((replaceLength / 4).ceil(), (int _) => '.... ')
            .join('');
    return code.replaceRange(0, replaceLength, replacement);
  }

  static getDot() {
    return Row(
      children: [
        Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5.w)),
        ),
        8.wb,
        Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5.w)),
        ),
        8.wb,
        Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5.w)),
        ),
        8.wb,
        Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5.w)),
        ),
      ],
    );
  }
}
