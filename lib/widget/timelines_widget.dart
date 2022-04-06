import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

// ignore: must_be_immutable
class TimeLinesWidget extends StatefulWidget {
  final List<String> items;
  late int index;

  late int number;
  TimeLinesWidget(
      {Key? key,
      required this.items,
      required this.index,
      required this.number})
      : super(key: key);

  @override
  State<TimeLinesWidget> createState() => _TimeLinesWidgetState();
}

class _TimeLinesWidgetState extends State<TimeLinesWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late int length = widget.items.length;

    List<String> items = widget.items;

    return Timeline.tileBuilder(
        theme: TimelineThemeData(
            direction: Axis.horizontal,
            connectorTheme: const ConnectorThemeData(
              space: 12.0, //点与文字的距离
              thickness: 2, //点与点之间的直线高度
              color: BaseStyle.colorcccccc,

              //样式
            )),
        builder: TimelineTileBuilder.fromStyle(
            itemExtentBuilder: (_, __) =>
                MediaQuery.of(context).size.width / length,
            contentsAlign: ContentsAlign.basic,
            contentsBuilder: ((context, index) => Padding(
                  padding: EdgeInsets.only(
                    top: 10.w,
                    left: 0.w,
                  ),
                  child: Text(
                    items[index],
                    style: TextStyle(
                        fontSize: BaseStyle.fontSize24,
                        color: BaseStyle.color111111),
                  ),
                )),
            itemCount: length));

    // return Container(
    //   child: Column(children: [
    //     ListView.builder(
    //         scrollDirection: Axis.horizontal,
    //         itemBuilder: (BuildContext context, int index) {
    //           return Row(
    //             children: [

    //             ],
    //           );
    //         })
    //   ]),
    // );
  }
}
