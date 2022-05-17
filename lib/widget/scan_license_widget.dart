import 'dart:io';

import 'package:cloud_car/model/car/car_distinguish_model.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:flutter/material.dart';

class ScanLicenseWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final Function(CarDistinguishModel) onLoadComplete;

  const ScanLicenseWidget(
      {super.key, this.width, this.height, required this.onLoadComplete});

  @override
  _ScanLicenseWidgetState createState() => _ScanLicenseWidgetState();
}

class _ScanLicenseWidgetState extends State<ScanLicenseWidget> {
  File? _file;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _file = await CloudImagePicker.pickSingleImage(title: '选择图片');
        if (_file != null) {
          String urls = await apiClient.uploadImage(_file!);
          var carInfoModel = await CarFunc.carDistinguish(urls);
          if (carInfoModel != null) {
            widget.onLoadComplete(carInfoModel);
          }
        }
      },
      child: SizedBox(
        width: widget.width ?? 686.w,
        height: 460.w,
        child: _file == null
            ? Assets.images.drivingLicense2.image()
            : Image.file(_file!),
      ),
    );
  }
}
