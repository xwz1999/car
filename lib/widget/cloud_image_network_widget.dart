import 'package:cached_network_image/cached_network_image.dart';
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
  final int memCacheHeight;///本地缓存大小 太大的图片无法缓存需要设置
  final int memCacheWidth;///本地缓存大小 太大的图片无法缓存需要设置

  const CloudImageNetworkWidget(
      {super.key,
      this.width,
      this.height,
      this.urls,
      this.fit = BoxFit.cover,
      this.isCar = false,
      this.borderRadius = BorderRadius.zero,  this.memCacheHeight = 0,  this.memCacheWidth = 0});

  String get imagePath {
    if (urls == null) {
      return '';
    } else if (urls!.isEmpty) {
      return '';
    } else {
      print(urls!.first.imageWithHost);
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
      this.borderRadius = BorderRadius.zero,this.memCacheHeight = 0,  this.memCacheWidth = 0});

  @override
  Widget build(BuildContext context) {
    return isCar
        ? ClipRRect(
            borderRadius: borderRadius,
            child:
            memCacheHeight!=0&&memCacheWidth!=0?
            CachedNetworkImage(
              memCacheWidth: memCacheWidth,
              memCacheHeight: memCacheHeight,
              imageUrl: imagePath,
              width: width ?? 160.w,
              height: height ?? 160.w,
              fit: fit,
              placeholder: (context, url) => Image.asset(
                Assets.images.carPlaceholder.path,
                width: width ?? 160.w,
                height: height ?? 160.w,
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => Image.asset(
                Assets.images.carPlaceholder.path,
                width: width ?? 160.w,
                height: height ?? 160.w,
                fit: BoxFit.cover,
              ),
            ):
            CachedNetworkImage(
              imageUrl: imagePath,
              width: width ?? 160.w,
              height: height ?? 160.w,
              fit: fit,
              placeholder: (context, url) => Image.asset(
                Assets.images.carPlaceholder.path,
                width: width ?? 160.w,
                height: height ?? 160.w,
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => Image.asset(
                Assets.images.carPlaceholder.path,
                width: width ?? 160.w,
                height: height ?? 160.w,
                fit: BoxFit.cover,
              ),
            ),
          )
        : ClipRRect(
            borderRadius: borderRadius,
            child:
            memCacheHeight!=0&&memCacheWidth!=0?
            CachedNetworkImage(
              memCacheWidth: memCacheWidth,
              memCacheHeight: memCacheHeight,
              imageUrl: imagePath,
              width: width ?? 160.w,
              height: height ?? 160.w,
              fit: fit,
              placeholder: (context, url) => Image.asset(
                Assets.images.carPlaceholder.path,
                width: width ?? 160.w,
                height: height ?? 160.w,
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => Image.asset(
                Assets.images.carPlaceholder.path,
                width: width ?? 160.w,
                height: height ?? 160.w,
                fit: BoxFit.cover,
              ),
            ):
            CachedNetworkImage(
              imageUrl: imagePath,
              width: width ?? 160.w,
              height: height ?? 160.w,
              fit: fit,
              placeholder: (context, url) => Image.asset(
                Assets.images.carPlaceholder.path,
                width: width ?? 160.w,
                height: height ?? 160.w,
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => Image.asset(
                Assets.images.carPlaceholder.path,
                width: width ?? 160.w,
                height: height ?? 160.w,
                fit: BoxFit.cover,
              ),
            ),
          );
  }
}
