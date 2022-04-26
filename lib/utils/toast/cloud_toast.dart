
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class CloudToast {
  static show(String text,{AlignmentGeometry? align}) {
    BotToast.showText(
      text: text,
      align: align?? const Alignment(0, 0.8),
      borderRadius: BorderRadius.circular(20),
    );
  }

  static Function get loading {
    return BotToast.showCustomLoading(
      toastBuilder: (cancel) {
        return const Center(
          child: Material(
            clipBehavior: Clip.antiAlias,
            shape: StadiumBorder(),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
