import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CarCustomPicker extends StatefulWidget {
  final Widget? body;
  final VoidCallback? onPressed;

  const CarCustomPicker({Key? key, this.body, this.onPressed})
      : super(key: key);

  @override
  _CarCustomPickerState createState() => _CarCustomPickerState();
}

class _CarCustomPickerState extends State<CarCustomPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: NavigationToolbar(
                leading: TextButton(
                  onPressed: Get.back,
                  child: '取消'.text.black.make(),
                ),
                trailing: TextButton(
                  onPressed: widget.onPressed,
                  child: '确定'.text.black.make(),
                ),
              ),
            ),
            widget.body!,
          ],
        ),
      ),
      height: Get.height / 3,
    );
  }
}
