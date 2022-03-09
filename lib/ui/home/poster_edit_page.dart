
import 'package:cloud_car/utils/headers.dart';

import 'package:flutter/material.dart';



class PosterEditPage extends StatefulWidget {

  const PosterEditPage({Key? key,}) : super(key: key);
  @override
  _PosterEditPageState createState() =>
      _PosterEditPageState();
}

class _PosterEditPageState extends State<PosterEditPage> {
  double _scale = 1.0;
  double _baseScale = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onScaleStart: (ScaleStartDetails scaleStartDetails) {
            _baseScale = _scale;
          },
          onScaleUpdate: (ScaleUpdateDetails scaleUpdateDetails) {
            double _ns = _baseScale * scaleUpdateDetails.scale;
            //printf('[scale]: %f %f' [scaleUpdateDetails.scale, _ns]);
            if (_ns <= 0) return;
            setState(() {
              _scale = _ns;
            });
          },
          child: Transform.scale(
            scale: _scale,
            child: Container(
              width: 400,
              height: 400,
              alignment: Alignment.center,
              child: Container(
                width: 300,
                height: 300,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
