
import 'package:cloud_car/widget/picker/car_picker_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CarMonthPickBody extends StatefulWidget {
  final DateTime initTime;

  const CarMonthPickBody({Key? key, required this.initTime}) : super(key: key);

  @override
  _CarMonthPickBodyState createState() => _CarMonthPickBodyState();
}

class _CarMonthPickBodyState extends State<CarMonthPickBody> {
  final FixedExtentScrollController _yearController =
      FixedExtentScrollController();
  final FixedExtentScrollController _monthController =
      FixedExtentScrollController();
  DateTime get _pickedTime => DateTime(_pickYear,_pickMonth) ;

  List<int> get _years => List.generate(
      DateTime.now().year - 1970 +1,
      (index) => widget.initTime.year - index);

  late int _pickYear;
  late int _pickMonth;

  List<int> get _months => List.generate(
      _pickYear == DateTime.now().year ? DateTime.now().month : 12,
      (index) => index + 1);

  @override
  void initState() {
    _pickYear = widget.initTime.year;
    _pickMonth = 1;
    super.initState();
  }

  @override
  void dispose() {
    _yearController.dispose();
    _monthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CarPickerBox(
      onPressed: () {
        Navigator.pop(context, _pickedTime);
      },
      child: Row(
        children: [
          Expanded(
            child: CupertinoPicker(
                itemExtent: 60.w,
                magnification: 1.0,
                looping: false,
                scrollController: _yearController,
                onSelectedItemChanged: (index) {
                  _pickYear = _years[index];
                  _pickMonth = 1;
                  setState(() {});
                },
                children: _years
                    .map((e) => Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child:
                                Text(e.toString()+'年', textAlign: TextAlign.center),
                          ),
                        ))
                    .toList()),
          ),
          Expanded(
            child: CupertinoPicker(
              itemExtent: 80.w,
              magnification: 1.0,
              // offAxisFraction: 0.6,
              looping: true,
              scrollController: _monthController,
              onSelectedItemChanged: (index) {
                _pickMonth = _months[index];
                setState(() {});
              },
              children: _months.isEmpty
                  ? [Container()]
                  : _months
                      .map((e) => Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w,
                                  right: 20.w,
                                  top: 10.w,
                                  bottom: 10.w),
                              child: Text(e.toString()+'月',
                                  textAlign: TextAlign.center),
                            ),
                          ))
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
