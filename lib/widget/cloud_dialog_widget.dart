
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class CloudDialogWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CloudDialogWidget(
      {super.key,
      required this.child,
      required this.onConfirm,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(16.w),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          width: 560.w,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              child,
               24.hb,
               Divider(height: 1.w,),
              SizedBox(
                height: 90.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: onCancel,
                      child: Center(
                          child: Text(
                        '取消',
                        style: TextStyle(fontSize: 36.w, color: Colors.black12),
                      )),
                    )),
                    const VerticalDivider(),
                    Expanded(
                        child: GestureDetector(
                            onTap: onConfirm,
                            child: Center(
                                child: Text(
                              '确认',
                              style: TextStyle(
                                  fontSize: 36.w, color: Colors.blueAccent),
                            )))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
