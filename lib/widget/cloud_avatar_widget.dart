
import 'package:cloud_car/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/assets.gen.dart';

class CloudAvatarWidget extends StatelessWidget {
  final List<String>? urls;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CloudAvatarWidget(
      {Key? key,
        this.width,
        this.height,
        this.urls,
        this.fit = BoxFit.cover})
      :
        super(key: key);
  String get imagePath {
    if (urls == null) {
      return '';
    } else if (urls!.isEmpty) {
      return '';
    } else {
      return urls!.first.imageWithHost;
    }
  }
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: FadeInImage.assetNetwork(
        placeholder: Assets.images.placeholder.path,
        image:  imagePath,
        imageErrorBuilder: (context, obj, stackTrace) {
          return Image.asset(
            Assets.images.avatarPlaceholder.path,
            width: width ?? 128.w,
            height: height ?? 128.w,
            fit: fit,
          );
        },
        height: height ?? 128.w,
        width: width ?? 128.w,
        fit: fit,
      ),
    );
  }
}
