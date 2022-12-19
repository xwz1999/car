import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

typedef TextCallback = Function(String content);
typedef TextCallback2 = Function(bool callBack);
class EditItemWidget extends StatefulWidget {


  final bool topIcon;
  final String title;

  // @Deprecated('not good,replace it')
  final String? value;
  final bool canChange;
  final Color? textColor;
  final Color? titleColor;
  final double? titleSize;
  final TextCallback? callback;
  final TextCallback2? callback2;
  final String endText;
  final double paddingTop;
  final String tips;
  final double paddingStart;
  final Widget? endIcon;
  final double? titleWidth;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final bool haveBorder;
  final bool paddingState;
  final String errText;
  final bool judgeText;
  // final FocusNode focusNode;
  // final int idCard;
// final bool errState;
// final String errText;
  const EditItemWidget({
    super.key,
    required this.title,
    this.canChange = true,
    this.callback,
    this.callback2,
    this.endText = '',
    this.topIcon = true,
    this.paddingTop = 0,
    this.tips = '请输入',
    this.paddingStart = 28,
    this.endIcon,
    this.titleWidth,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.value,
    // this.idCard=null,
    this.inputFormatters,
    this.textColor,
    this.titleColor,
    this.haveBorder = true,
    this.titleSize,
    this.paddingState=false,
    this.errText="",
    this.judgeText=false,
    // this.focusNode=FocusNode(),
    // this.errState=false,
    // this.errText="",
  });

  @override
  _EditItemWidgetState createState() => _EditItemWidgetState();
}

class _EditItemWidgetState extends State<EditItemWidget> {
  late TextEditingController _editingController;
  late double paddingTop = 0;
  // final FocusNode _focusNode = FocusNode();
  final String _focusNodeText = '';

  @override
  void initState() {
    if (widget.paddingTop == 0) {
      paddingTop = 30.w;
    } else {
      paddingTop = widget.paddingTop;
    }
    _editingController =
        widget.controller ?? TextEditingController(text: widget.value);


    // _focusNode.addListener((){
    //   if (_focusNode.hasFocus) {
    //     print('得到焦点');
    //
    //   }else{
    //     print('失去焦点');
    //   }
    // });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant EditItemWidget oldWidget) {
    if (!widget.canChange && widget.value != null) {
      _editingController.text = widget.value!;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _editingController.dispose();
    }
    // _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
      padding: EdgeInsets.only(top: paddingTop, bottom: paddingTop),
      decoration: BoxDecoration(
          border: Border(
              bottom: widget.haveBorder
                  ? BorderSide(color: const Color(0xFFF6F6F6), width: 2.w)
                  : BorderSide.none)),
      child: Row(
        children: [
          widget.topIcon
              ? Padding(
                  padding: EdgeInsets.only(top: 10.w),
                  child: Text(
                    '*  ',
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: const Color(0xFFE62222),
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(top: 10.w),
                  child: SizedBox(
                    width: widget.paddingStart.w,
                  ),
                ),
          SizedBox(
            width: widget.titleWidth ?? 180.w,
            child: Text(
              widget.title,
              style: TextStyle(
                color: widget.titleColor ?? BaseStyle.color333333,
                fontSize: widget.titleSize ?? BaseStyle.fontSize32,
              ),
            ),
          ),
          Expanded(
            child:widget.paddingState?Padding(padding: EdgeInsets.only(top: 40.w),child:TextField(
              // focusNode: _focusNode,
              enabled: widget.canChange,
              inputFormatters: widget.inputFormatters,
              keyboardType: widget.keyboardType,
              // onEditingComplete: () {
              //       // CloudToast.show('12345678912345');
              // },
              // onSubmitted: (text){
              //   widget.callback2?.call(num.parse(text).length==11);
              // },
              onChanged: (text) {
                widget.callback?.call(text);

                // _focusNode.addListener(() {
                //   _focusNode
                // });
                // setState(() {
                //
                // });
              },
              style: TextStyle(
                color: widget.textColor ?? BaseStyle.color333333,
                fontSize: BaseStyle.fontSize28,
              ),
              maxLines: null,
              controller: _editingController,
              decoration: InputDecoration(

                errorText: widget.judgeText?'':widget.errText,
                //contentPadding: EdgeInsets.only(top: 15.w,bottom: 15.w),
                filled: true,
                isCollapsed: true,
                fillColor: Colors.white,
                hintText: widget.tips,
                hintStyle: TextStyle(
                    color: const Color(0xFFcccccc),
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w300),
                border: InputBorder.none,
              ),
            ),):
            TextField(
              // focusNode: _focusNode,
              enabled: widget.canChange,
              inputFormatters: widget.inputFormatters,
              keyboardType: widget.keyboardType,
              // onEditingComplete: () {
              //       // CloudToast.show('12345678912345');
              // },
              // onSubmitted: (text){
              //   widget.callback2?.call(num.parse(text).length==11);
              // },
              onChanged: (text) {
                widget.callback?.call(text);

                // _focusNode.addListener(() {
                //   _focusNode
                // });
                // setState(() {
                //
                // });
              },
              style: TextStyle(
                color: widget.textColor ?? BaseStyle.color333333,
                fontSize: BaseStyle.fontSize28,
              ),
              maxLines: null,
              controller: _editingController,
              decoration: InputDecoration(

                // errorText:widget.errState?widget.errText:'' ,
                //contentPadding: EdgeInsets.only(top: 15.w,bottom: 15.w),
                filled: true,
                isCollapsed: true,
                fillColor: Colors.white,
                hintText: widget.tips,
                hintStyle: TextStyle(
                    color: const Color(0xFFcccccc),
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w300),
                border: InputBorder.none,
              ),
            ),
          ),
          widget.endIcon != null
              ? Padding(
                  padding: EdgeInsets.only(
                    right: 24.w,
                  ),
                  child: widget.endIcon!,
                )
              : (widget.endText.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(
                        right: 24.w,
                      ),
                      child: Text(
                        widget.endText,
                        style: TextStyle(
                          fontSize: 32.sp,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    )
                  : const SizedBox()),
        ],
      ),
    );
  }
}
