import 'package:cloud_car/model/poster/poster_list_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:flutter/material.dart';

class PosterEditPage extends StatefulWidget {
  final PosterListModel model;

  const PosterEditPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _PosterEditPageState createState() => _PosterEditPageState();
}

class _PosterEditPageState extends State<PosterEditPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          '海报编辑',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 32.w,
          horizontal: 64.w,
        ),
        child: CloudImageNetworkWidget(
          urls: [widget.model.path],
        ),
      ),
    );
  }
}
