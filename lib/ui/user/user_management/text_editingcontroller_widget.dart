import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef TextCallback = Function(String content);

class TextEditItemWidget extends StatefulWidget {
  final bool isBold;
  final bool endIcon;
  final String title;
  final String value;
  final TextCallback callback;
  final Function() onTap;
  final String tips;
  final Widget widget;
  final bool editor;
  final int? maxLines;
  final EdgeInsetsGeometry padding;
  final List<TextInputFormatter>? inputFormatters;

  const TextEditItemWidget(
      {super.key,
      this.isBold = false,
      required this.title,
      this.value = '',
      this.endIcon = false,
      required this.callback,
      required this.onTap,
      this.tips = '请输入',
      this.widget = const SizedBox(),
      this.editor = true,
      this.maxLines = 1,
      this.padding = EdgeInsets.zero, this.inputFormatters});

  @override
  _TextEditItemWidgetState createState() => _TextEditItemWidgetState();
}

class _TextEditItemWidgetState extends State<TextEditItemWidget> {
  late TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant TextEditItemWidget oldWidget) {
    if (!widget.editor) {
      _editingController.text = widget.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: widget.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.isBold ? 32.wb : 0.wb,
            SizedBox(
              width: 170.w,
              child: Text(
                widget.title,
                style: TextStyle(
                  color: widget.isBold
                      ? BaseStyle.color333333
                      : BaseStyle.color999999,
                  fontSize: BaseStyle.fontSize28,
                ),
              ),
            ),
            widget.isBold ? 400.wb : const SizedBox(),
            SizedBox(
              width: widget.isBold ? 50.w : 450.w,
              height: widget.isBold ? 100.w : 40.w,
              child: TextField(
                onChanged: (text) => widget.callback(text),
                maxLines: widget.maxLines,
                controller: _editingController,
                enabled: widget.editor,
                inputFormatters: widget.inputFormatters,
                decoration: InputDecoration(
                  enabled: widget.endIcon,
                  filled: true,
                  isCollapsed: true,
                  fillColor: Colors.white,
                  hintText: widget.tips,
                  contentPadding: widget.isBold
                      ? EdgeInsets.only(top: 30.w)
                      : EdgeInsets.only(top: 0.w),
                  hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                  border: InputBorder.none,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              child: widget.widget,
            ),
            32.wb,
          ],
        ),
      ),
    );
  }
}
