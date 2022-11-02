import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef TextCallback = Function(String content);

class EditItemWidget extends StatefulWidget {
  final bool topIcon;
  final String title;
  @Deprecated('not good,replace it')
  final String? value;
  final bool canChange;
  final Color? textColor;
  final Color? titleColor;
  final TextCallback? callback;
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

  const EditItemWidget({
    super.key,
    required this.title,
    this.canChange = true,
     this.callback,
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
    this.inputFormatters,this.textColor ,this.titleColor,this.haveBorder = true
  });

  @override
  _EditItemWidgetState createState() => _EditItemWidgetState();
}

class _EditItemWidgetState extends State<EditItemWidget> {
  late TextEditingController _editingController;
  late double paddingTop = 0;

  @override
  void initState() {
    if (widget.paddingTop == 0) {
      paddingTop = 30.w;
    } else {
      paddingTop = widget.paddingTop;
    }
    _editingController =
        widget.controller ?? TextEditingController(text: widget.value);
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: paddingTop,bottom: paddingTop),
      decoration: BoxDecoration(

        border:  Border(bottom:  widget.haveBorder? BorderSide(color: const Color(0xFFF6F6F6),width: 2.w):BorderSide.none)
      ),
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
                color: widget.titleColor?? BaseStyle.color333333,
                fontSize: BaseStyle.fontSize32,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              enabled: widget.canChange,
              inputFormatters: widget.inputFormatters,
              keyboardType: widget.keyboardType,
              onSubmitted: (text) {
                // _refreshController.callRefresh();
              },
              onChanged: (text) {
                widget.callback?.call(text);
              },
              style: TextStyle(
                color: widget.textColor?? BaseStyle.color333333,
                fontSize: BaseStyle.fontSize28,
              ),
              maxLines: null,
              controller: _editingController,
              decoration: InputDecoration(
                //contentPadding: EdgeInsets.only(top: 15.w,bottom: 15.w),
                filled: true,
                isCollapsed: true,
                fillColor: Colors.white,
                hintText: widget.tips,
                hintStyle: const TextStyle(
                    color: Color(0xFFcccccc),
                    fontSize: 14,
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
