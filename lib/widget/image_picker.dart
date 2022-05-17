// ignore_for_file: avoid_print, unused_field

import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickers extends StatefulWidget {
  const ImagePickers({
    super.key,
  });

  @override
  State<ImagePickers> createState() => _ImagePickersState();
}

class _ImagePickersState extends State<ImagePickers> {
  final bool _getSure = false;
  final picker = ImagePicker();
  Future getImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
      } else {
        print('no image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Navigator.canPop(context)
        ? GestureDetector(
            onTap: () {
              Get.to(() => getImage());
            },
          )
        : const SizedBox();
  }
}
