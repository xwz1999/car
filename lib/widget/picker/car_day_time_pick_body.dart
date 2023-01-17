
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';


import 'car_picker_box.dart';

class CarDayTimePickBody extends StatefulWidget {
  final bool chooseLate;///选择当前时间之前的时间还是当前时间之后的时间
  final DateTime initTime;
  final int addYear;///需要选择今年以后的日期使用该属性
  final int addMoth;
  final int addDay;
  const CarDayTimePickBody({super.key,required this.initTime,this.addYear=0,this.addDay=0,this.addMoth=0,this.chooseLate=true});

  @override
  _CarDayTimePickBodyState createState() => _CarDayTimePickBodyState();
}

class _CarDayTimePickBodyState extends State<CarDayTimePickBody> {
  final FixedExtentScrollController _yearController =
  FixedExtentScrollController();
  final FixedExtentScrollController _monthController =
  FixedExtentScrollController();

  final FixedExtentScrollController _dayController =
  FixedExtentScrollController();

  late int _pickYear;
  late int _pickMonth;
  late int _pickDay;

  DateTime get _pickedTime =>
      DateTime(_pickYear, _pickMonth, _pickDay);

  List<int> get _years => List.generate(//2, (index) => widget.initTime.year + index);
      DateTime.now().year+widget.addYear - 1970 + 1, (index) => widget.initTime.year+widget.addYear - index);

  List<int> get _months => List.generate(
      _pickYear == DateTime.now().year ? DateTime.now().month : 12,
          (index) => index + 1);

  List<int> get _days => List.generate(
      _pickMonth == DateTime.now().month && _pickYear == DateTime.now().year
          ? (getDays(_pickMonth) - DateTime.now().day + 1)
          : getDays(_pickMonth),
          (index) =>
      index +
          (_pickMonth == DateTime.now().month &&
              _pickYear == DateTime.now().year
              ? DateTime.now().day
              : 1));





  getDays(int month) {
    switch (month) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        return 31;
      case 4:
      case 6:
      case 9:
      case 11:
        return 30;
      case 2:
        if (_pickYear % 4 == 0) {
          return 29;
        } else {
          return 28;
        }
    }
  }

  @override
  void initState() {

    // _pickYear = widget.initTime.year;
    // _pickMonth = widget.initTime.month;
    // _pickDay = widget.initTime.day;
    _pickYear = widget.initTime.year;
    _pickMonth = 1;///widget.initTime.month;
    _pickDay = 1;///widget.initTime.day;
    // if()
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
            flex: 3,
            child: CupertinoPicker(

                itemExtent: 80.w,
                magnification: 1.0,
                looping: false,
                scrollController: _yearController,
                onSelectedItemChanged: (index) {
                  _pickYear = _years[index];

                  setState(() {});
                },
                children: _years
                    .map((e) => Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text('$e年',
                        textAlign: TextAlign.center),
                  ),
                ))
                    .toList()),
          ),
          Expanded(
            flex: 2,
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
                      left: 10.w,
                      right: 10.w,
                      top: 10.w,
                      bottom: 10.w),
                  child: Text('$e月',
                      textAlign: TextAlign.center),
                ),
              ))
                  .toList(),
            ),
          ),
          Expanded(
            flex: 2,
            child: CupertinoPicker(
              itemExtent: 80.w,
              magnification: 1.0,
              // offAxisFraction: 0.6,
              looping: true,
              scrollController: _dayController,
              onSelectedItemChanged: (index) {
                _pickDay = _days[index];
                setState(() {});
              },
              children: _days.isEmpty
                  ? [Container()]
                  : _days
                  .map((e) => Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      top: 10.w,
                      bottom: 10.w),
                  child: Text('$e日',
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
