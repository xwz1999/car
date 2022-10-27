import 'package:cloud_car/extensions/string_extension.dart';
import 'package:extended_image/extended_image.dart';
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
    return isCar
        ? ClipRRect(
            borderRadius: borderRadius,
            child:
            // FadeInImage.assetNetwork(
            //   placeholder: Assets.images.carPlaceholder.path,
            //   image: imagePath,
            //   imageErrorBuilder: (context, obj, stackTrace) {
            //     return Image.asset(
            //       Assets.images.carPlaceholder.path,
            //       width: width ?? 160.w,
            //       height: height ?? 160.w,
            //       fit: BoxFit.cover,
            //     );
            //   },
            //   height: height ?? 160.w,
            //   width: width ?? 160.w,
            //   fit: fit,
            // )

            ExtendedImage.network(
                imagePath,
              height: height ?? 160.w,
              width: width ?? 160.w,
              fit: fit,
              loadStateChanged: (ExtendedImageState state){
                switch (state.extendedImageLoadState) {
                  case LoadState.loading:

                    return Image.asset(
                      Assets.images.carPlaceholder.path,
                      width: width ?? 160.w,
                      height: height ?? 160.w,
                      fit: BoxFit.cover,
                    );
                  case LoadState.completed:

                    return ExtendedRawImage(
                      image: state.extendedImageInfo?.image,
                      height: height ?? 160.w,
                      width: width ?? 160.w,
                      fit: BoxFit.cover,
                    );

                  case LoadState.failed:

                    return GestureDetector(
                      child:  Image.asset(
                    Assets.images.carPlaceholder.path,
                      width: width ?? 160.w,
                      height: height ?? 160.w,
                      fit: BoxFit.cover,
                    ),
                      onTap: () {
                        state.reLoadImage();
                      },
                    );

                }
              },

            ),
          )
        : ClipRRect(
            borderRadius: borderRadius,
            child:
            ExtendedImage.network(
              imagePath,
              height: height ?? 160.w,
              width: width ?? 160.w,
              fit: fit,
              loadStateChanged: (ExtendedImageState state){
                switch (state.extendedImageLoadState) {
                  case LoadState.loading:

                    return Image.asset(
                      Assets.images.carPlaceholder.path,
                      width: width ?? 160.w,
                      height: height ?? 160.w,
                      fit: BoxFit.cover,
                    );
                  case LoadState.completed:

                    return ExtendedRawImage(
                      image: state.extendedImageInfo?.image,
                      height: height ?? 160.w,
                      width: width ?? 160.w,
                      fit: BoxFit.cover,
                    );

                  case LoadState.failed:

                    return GestureDetector(
                      child:  Image.asset(
                        Assets.images.carPlaceholder.path,
                        width: width ?? 160.w,
                        height: height ?? 160.w,
                        fit: BoxFit.cover,
                      ),
                      onTap: () {
                        state.reLoadImage();
                      },
                    );

                }
              },

            ),
            // FadeInImage.assetNetwork(
            //   placeholder: Assets.images.placeholder.path,
            //   image: imagePath,
            //   imageErrorBuilder: (context, obj, stackTrace) {
            //     return Image.asset(
            //       Assets.images.placeholder.path,
            //       width: width ?? 160.w,
            //       height: height ?? 160.w,
            //       fit: BoxFit.cover,
            //     );
            //   },
            //   height: height ?? 160.w,
            //   width: width ?? 160.w,
            //   fit: fit,
            // ),
          );
  }
}
