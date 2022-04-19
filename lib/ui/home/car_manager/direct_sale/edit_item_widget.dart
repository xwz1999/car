import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

typedef TextCallback = Function(String content);

class EditItemWidget extends StatefulWidget {
  final bool topIcon;
  final String title;
  final String value;
  final bool canChange;
  final TextCallback callback;
  final String endText;
  final double paddingTop;
  final String tips;

  const EditItemWidget(
      {Key? key,
      required this.title,
      required this.value,
      this.canChange = true,
      required this.callback,
      this.endText = '',
      this.topIcon = true, this.paddingTop=0, this.tips = '请输入'})
      : super(key: key);

  @override
  _EditItemWidgetState createState() => _EditItemWidgetState();
}

class _EditItemWidgetState extends State<EditItemWidget> {
  late TextEditingController _editingController;
  late double paddingTop = 0;

  @override
  void initState() {
    if(widget.paddingTop==0){
      paddingTop = 40.w;
    }else{
      paddingTop = widget.paddingTop;
    }
    _editingController = TextEditingController(text: widget.value);

    super.initState();
  }

  @override
  void dispose() {
    _editingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Row(
        children: [
         widget.topIcon? Padding(
            padding: EdgeInsets.only(top: 10.w),
            child: Text(
              '*  ',
              style: TextStyle(
                fontSize: 28.sp,
                color: const Color(0xFFE62222),
              ),
            ),
          ):Padding(
           padding: EdgeInsets.only(top: 10.w),
           child: Text(
             '*  ',
             style: TextStyle(
               fontSize: 28.sp,
               color: Colors.transparent,
             ),
           ),
         ),
          SizedBox(
            width: 170.w,
            child: Text(
              widget.title,
              style: TextStyle(
                color: BaseStyle.color999999,
                fontSize: BaseStyle.fontSize28,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              enabled: widget.canChange,
              keyboardType: TextInputType.text,
              onSubmitted: (text) {
                widget.callback(text);
                setState(() {});
                // _refreshController.callRefresh();
              },
              onChanged: (text) {},
              style: TextStyle(
                color: widget.canChange
                    ? BaseStyle.color333333
                    : BaseStyle.color999999,
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
                hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
                border: InputBorder.none,
              ),
            ),
          ),
          widget.endText.isNotEmpty
              ? Text(
                  widget.endText,
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color(0xFF333333),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
