
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';


typedef EditCallback = void Function(String  text);

typedef BoolCallback = void Function(bool isFocusNode);


class EditItemWidget extends StatefulWidget {
  // final TextEditingController controller;
  // final FocusNode focusNode;
  final String text;
  final bool canEdit;
  final EditCallback callback;
  final BoolCallback boolCallback;


  const EditItemWidget({Key? key, required this.callback, required this.canEdit, required this.text, required this.boolCallback}) : super(key: key);

  @override
  EditItemWidgetState createState() => EditItemWidgetState();
}

class EditItemWidgetState extends State<EditItemWidget> {
  late TextEditingController controller;
  late FocusNode focusNode;
  bool isKeyBord = false;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
    focusNode = FocusNode();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        isKeyBord = true;
      }else{
        isKeyBord = false;
      }
      widget.boolCallback(isKeyBord);
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    focusNode.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return TextField(
      enabled: widget.canEdit,
      onChanged: (String phone) {
        widget.callback(phone);
      },
      controller: controller,
      focusNode: focusNode,
      autofocus: true,
      style: TextStyle(fontSize: BaseStyle.fontSize28,color: BaseStyle.color333333),

      maxLines: 50,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 24.w,horizontal: 32.w),
        border: InputBorder.none,
        hintText: "请输入自定义内容",
        hintStyle: TextStyle(
            color: BaseStyle.colorcccccc,
            fontSize: BaseStyle.fontSize28 ),

      ),
    );

  }


}
