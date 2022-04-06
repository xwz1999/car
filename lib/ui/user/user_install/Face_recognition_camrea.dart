// // ignore_for_file: invalid_use_of_visible_for_testing_member

// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';

// class ImagePickerWidget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _ImagePickerState();
//   }
// }

// class _ImagePickerState extends State<ImagePickerWidget> {
//   var _imgPath;

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('data'),
//       ),
//       body: SingleChildScrollView(
//           child: Column(
//         children: [
//           _ImageView(_imgPath),
//           ElevatedButton(
//               onPressed: () {
//                 _takePhoto;
//               },
//               child: Text('拍照')),
//           ElevatedButton(
//               onPressed: () {
//                 _openGallery;
//               },
//               child: Text('相册'))
//         ],
//       )),
//     );
//   }

//   Widget _ImageView(imgPath) {
//     if (imgPath == null) {
//       return Center(
//         child: Text('请选择图片或拍照'),
//       );
//     } else {
//       return Image.file(imgPath);
//     }
//   }

//   _takePhoto() async {
//     var image =
//         // ignore: invalid_use_of_visible_for_testing_member
//         await ImagePicker.platform.pickImage(source: ImageSource.camera);
//     setState(() {
//       _imgPath = image;
//     });
//   }

//   _openGallery() async {
//     var image =
//         await ImagePicker.platform.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _imgPath = image;
//     });
//   }
// }
