import 'package:cloud_car/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/assets.gen.dart';

class CloudImageNetworkWidget extends StatelessWidget {
  final List<String>? urls;
  final double? width;
  final double? height;
  final BoxFit fit;
  final bool isCar;
  final BorderRadius borderRadius;

  const CloudImageNetworkWidget(
      {super.key,
      this.width,
      this.height,
      this.urls,
      this.fit = BoxFit.cover,
      this.isCar = false,
      this.borderRadius = BorderRadius.zero});

  String get imagePath {
    if (urls == null) {
      return '';
    } else if (urls!.isEmpty) {
      return '';
    } else {
      return urls!.first.imageWithHost;
    }
  }

  const CloudImageNetworkWidget.car(
      {super.key,
      this.width,
      this.height,
      this.urls,
      this.fit = BoxFit.cover,
      this.isCar = true,
      this.borderRadius = BorderRadius.zero});

  @override
  Widget build(BuildContext context) {
    return isCar!
        ? ClipRRect(
            borderRadius: borderRadius,
            child: FadeInImage.assetNetwork(
              placeholder: Assets.images.carPlaceholder.path,
              image: imagePath,
              imageErrorBuilder: (context, obj, stackTrace) {
                return Image.asset(
                  Assets.images.carPlaceholder.path,
                  width: width ?? 160.w,
                  height: height ?? 160.w,
                  fit: BoxFit.cover,
                );
              },
              height: height ?? 160.w,
              width: width ?? 160.w,
              fit: fit,
            ),
          )
        : ClipRRect(
            borderRadius: borderRadius,
            child: FadeInImage.assetNetwork(
              placeholder: Assets.images.placeholder.path,
              image: imagePath,
              imageErrorBuilder: (context, obj, stackTrace) {
                return Image.asset(
                  Assets.images.placeholder.path,
                  width: width ?? 160.w,
                  height: height ?? 160.w,
                  fit: BoxFit.cover,
                );
              },
              height: height ?? 160.w,
              width: width ?? 160.w,
              fit: fit,
            ),
          );
  }
}
