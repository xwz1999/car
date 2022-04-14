// ignore_for_file: deprecated_member_use, unrelated_type_equality_checks

// import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:http_parser/http_parser.dart';

class ImageSelector extends StatefulWidget {
  ImageSelector({
    Key? key,
  }) : super(key: key);

  @override
  ImageState createState() => ImageState();
}

class ImageState extends State<ImageSelector> {
  final _picker = ImagePicker();
  late String title;
  late File imagePath = File('path');
  //  ImageState(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('1')),
      body: Column(
        children: [
          ElevatedButton(onPressed: openGallery, child: Text('图库')),
          //ElevatedButton(onPressed: takePhotos, child: Text('拍照')),
          // ignore: unnecessary_null_comparison
          // if (imagePath == 'path')
          //   const Expanded(
          //     child: Center(child: Text('未选择图片')),
          //   )
          // else
          //   Expanded(
          //     child: Center(child: Image.file(imagePath)),
          //   ),
          // ElevatedButton(onPressed: upLoadImg, child: Text('上传'))
        ],
      ),
    );
  }

  void openGallery() async {
    // ignore: deprecated_member_use
    PickedFile? pickedFile =
        await _picker.getImage(source: ImageSource.gallery);
    final File file = File(pickedFile!.path);
    setState(() {
      imagePath = file;
    });
  }

  // upLoadImg() async {
  //   if (imagePath == null) {
  //     BotToast.showText(text: '为选择图片');
  //     return;
  //   }
  //   String path=imagePath.path;
  //   var name=path.substring(path.lastIndexOf('/')+1,path.length);
  //   FormData formData =FormData.formMap({
  //     '参数名////':await MultipartFile.fromFile(path,filename:name,contentType:MediaType('image','jpeg'))
  //   });

  //   BaseOptions options =BaseOptions(contentType: 'multipart/form-data',responseType: ResponseType.plain
  //   Dio dio =Dio(option);
  //   try {
  //     var respone=await dio.post<String>(
  //       if (respone.statusCode==200) {

  //       }
  //     )
  //   } catch (e) {
  //     print('11111')
  //   }
  //   );
  //}
}
