import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloudBackButton extends StatelessWidget {
  final Color color;
  final bool isSpecial;

  const CloudBackButton(
      {super.key, this.color = const Color(0xFF111111), this.isSpecial = false});

  @override
  Widget build(BuildContext context) {
    return Navigator.canPop(context)
        ?  Padding(
          padding: isSpecial? EdgeInsets.only(left: 8.w):EdgeInsets.zero,
          child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    CupertinoIcons.chevron_back,
                    color: color,
                  ),
                ),
        )
        : const SizedBox();
  }
}
