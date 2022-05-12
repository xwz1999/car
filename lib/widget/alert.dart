

import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';


typedef AlertItemClickListener = Function(int index);
typedef DeleteItemClickListener = Function();

class _Styles {
  static const Color lineColor = Color(0xFFE5E5E5);
  static final TextStyle contentStyle = TextStyle(
    color: Colors.black,
    fontSize: 28.sp,
  );
  static final TextStyle normalTextStyle = TextStyle(
      color: Colors.black, fontSize: 15 * 2.sp, fontWeight: FontWeight.w500);
  static final TextStyle deleteTextStyle = TextStyle(
      color: kPrimaryColor, fontSize: 15 * 2.sp, fontWeight: FontWeight.w500);

  static final TextStyle remindTextStyle = TextStyle(
      color: kPrimaryColor, fontSize: 15 * 2.sp, fontWeight: FontWeight.bold);
}

class Alert {
  static show(BuildContext context, Dialog dialog) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return dialog;
        });
  }

  static dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}

enum NormalTextDialogType { normal, delete, remind }

///普通文本弹框
class NormalTextDialog extends Dialog {
  final Color? titleColor;
  final String title;
  final String content;
  final String deleteItem;
  final List<String> items;
  final AlertItemClickListener listener;
  final DeleteItemClickListener deleteListener;
  final NormalTextDialogType type;

    const NormalTextDialog(
      {Key? key, required this.title,
      this.titleColor,
      required this.content,
      this.deleteItem = "删除",
      required this.items,
      required this.listener,
      required this.deleteListener,
      this.type = NormalTextDialogType.normal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: _buildContent());
  }

  Container _buildContent() {
    return Container(
      padding: EdgeInsets.only(top: 8.0 * 2.w),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(mainAxisSize: MainAxisSize.min, children: _children()),
    );
  }

  _children() {
    List<Widget> children = [];

      children.add(Container(
        padding: EdgeInsets.only(top: 10.w),
        child: Text(
          title,
          style: TextStyle(
              color: titleColor ?? Colors.black,
              fontSize: 16 * 2.sp,
              fontWeight: FontWeight.w600),
        ),
      ));


    children.add(Container(
      padding: EdgeInsets.symmetric(horizontal:25.w, vertical: 15.w),
      child: Text(
        content,
        style: _Styles.contentStyle,
        textAlign: TextAlign.center,
      ),
    ));

    children.add(Container(
      height: 0.5,
      color: _Styles.lineColor,
    ));

    children.add(SizedBox(
        height: 40.w,
        child: Row(
          children: _buildItems(),
          crossAxisAlignment: CrossAxisAlignment.stretch,
        )));

    return children;
  }

  _buildItems() {
    List<Widget> privateItems = items.map((String title) {
      int index = items.indexOf(title);
      return Expanded(
          child: GestureDetector(
            onTap: () {
              listener(index);
            },
            child: Container(
        decoration: BoxDecoration(
              border: index == items.length - 1 &&
                      type == NormalTextDialogType.normal
                  ? null
                  : Border(
                      right: BorderSide(
                          color: _Styles.lineColor, width: 0.5 * 2.w))),
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(top: 40.w,bottom: 22.w),
          child: Text(
              title,style: type == NormalTextDialogType.remind
              ? _Styles.remindTextStyle
              : _Styles.normalTextStyle,
          ),
        ),
      ),
          ));
    }).toList();

    if (type == NormalTextDialogType.delete) {
      privateItems.add(Expanded(
          child: GestureDetector(
          onTap: () {
            deleteListener();
          },
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(vertical: 8.0 * 2.w),
            child: Text(
              deleteItem,style: _Styles.deleteTextStyle,
            ),
          ),
        ),

      ));
    }

    return privateItems;
  }
}

class NormalContentDialog extends Dialog {
  final String title;
  final Widget content;
  final String? deleteItem;
  final List<String> items;
  final AlertItemClickListener listener;
  final DeleteItemClickListener deleteListener;
  final NormalTextDialogType type;

   const NormalContentDialog({Key? key,
    required this.title,
    required this.content,
     this.deleteItem,
    required this.items,
    required this.listener,
    required this.deleteListener,
    this.type = NormalTextDialogType.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: _buildContent());
  }

  Container _buildContent() {
    return Container(
      padding: EdgeInsets.only(top: 8.0 * 2.w),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _children(),
      ),
    );
  }

  _children() {
    List<Widget> children = [];
    if (title.isNotEmpty) {
      children.add(Container(
        padding: EdgeInsets.only(top: 20.w,),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16 * 2.sp,
              fontWeight: FontWeight.w600),
        ),
      ));
    }

    children.add(Container(
      padding: EdgeInsets.only(left: 25.w,right: 25.w, top: 22.w,bottom: 36.w),
      // child: Text(this.content, style: _Styles.contentStyle),
      child: content,
    ));

    children.add(Container(
      height: 0.5,
      color: _Styles.lineColor,
    ));

    children.add(SizedBox(

        height: 100.w,
        child: Row(
          children: _buildItems(),
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        )));

    return children;
  }

  _buildItems() {
    List<Widget> privateItems = items.map((String title) {
      int index = items.indexOf(title);
      return Expanded(
          child: GestureDetector(
            onTap: () {
              listener(index);
            },
            child: Container(

              alignment: Alignment.center,
        decoration: BoxDecoration(
              color: Colors.transparent,
              border: index == items.length - 1 &&
                      type == NormalTextDialogType.normal
                  ? null
                  : Border(
                      right: BorderSide(
                          color: _Styles.lineColor, width: 0.5 * 2.w))),
        child:
        Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 8.0 * 2.w),
          child: Text(
            title,style: type != NormalTextDialogType.remind
              ? _Styles.normalTextStyle
              : _Styles.remindTextStyle,
          ),
        ),
      ),
          ));
    }).toList();

    if (type == NormalTextDialogType.delete) {
      privateItems.add(Expanded(
          child:       GestureDetector(
          onTap: () {
            deleteListener();
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(vertical: 8.0 * 2.w),
            child: Text(
              deleteItem??'',style: _Styles.deleteTextStyle,
            ),
          ),
        ),

      ));
    }

    return privateItems;
  }
}
