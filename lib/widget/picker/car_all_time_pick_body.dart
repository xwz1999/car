import 'package:cloud_car/widget/picker/car_picker_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarAllTimePickBody extends StatefulWidget {
  final DateTime initTime;

  const CarAllTimePickBody({Key? key, required this.initTime})
      : super(key: key);

  @override
  _CarAllTimePickBodyState createState() => _CarAllTimePickBodyState();
}

class _CarAllTimePickBodyState extends State<CarAllTimePickBody> {
  final FixedExtentScrollController _yearController =
      FixedExtentScrollController();
  final FixedExtentScrollController _monthController =
      FixedExtentScrollController();

  final FixedExtentScrollController _dayController =
      FixedExtentScrollController();
  final FixedExtentScrollController _hourController =
      FixedExtentScrollController();

  final FixedExtentScrollController _minuteController =
      FixedExtentScrollController();

  late int _pickYear;
  late int _pickMonth;

  late int _pickDay;
  late int _pickHour;
  late int _pickMinute;

  DateTime get _pickedTime =>
      DateTime(_pickYear, _pickMonth, _pickDay, _pickHour, _pickMinute);

  List<int> get _years =>
      List.generate(2, (index) => widget.initTime.year + index);

  List<int> get _months => List.generate(
      _pickYear == DateTime.now().year ? (12 - DateTime.now().month + 1) : 12,
      (index) =>
          index +
          (_pickYear == DateTime.now().year ? DateTime.now().month : 1));

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

  List<int> get _hours => List.generate(
      _pickDay == DateTime.now().day &&
              _pickMonth == DateTime.now().month &&
              _pickYear == DateTime.now().year
          ? (24 - DateTime.now().hour)
          : 24,
      (index) =>
          index +
          (_pickDay == DateTime.now().day &&
                  _pickMonth == DateTime.now().month &&
                  _pickYear == DateTime.now().year
              ? DateTime.now().hour
              : 0));

  List<int> get _minute => List.generate(
      _pickHour == DateTime.now().hour &&
              _pickDay == DateTime.now().day &&
              _pickMonth == DateTime.now().month &&
              _pickYear == DateTime.now().year
          ? (60 - DateTime.now().minute)
          : 60,
      (index) =>
          index +
          (_pickHour == DateTime.now().hour &&
                  _pickDay == DateTime.now().day &&
                  _pickMonth == DateTime.now().month &&
                  _pickYear == DateTime.now().year
              ? DateTime.now().minute
              : 0));

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
    _pickYear = widget.initTime.year;
    _pickMonth = widget.initTime.month;
    _pickDay = widget.initTime.day;
    _pickHour = widget.initTime.hour;

    _pickMinute = widget.initTime.minute;
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
          Expanded(
            flex: 2,
            child: CupertinoPicker(
              itemExtent: 80.w,
              magnification: 1.0,
              // offAxisFraction: 0.6,
              looping: true,
              scrollController: _hourController,
              onSelectedItemChanged: (index) {
                _pickHour = _hours[index];
                setState(() {});
              },
              children: _hours.isEmpty
                  ? [Container()]
                  : _hours
                      .map((e) => Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w,
                                  right: 20.w,
                                  top: 10.w,
                                  bottom: 10.w),
                              child: Text(e.toString(),
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
              scrollController: _minuteController,
              onSelectedItemChanged: (index) {
                _pickMinute = _minute[index];
                setState(() {});
              },
              children: _minute.isEmpty
                  ? [Container()]
                  : _minute
                      .map((e) => Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w,
                                  right: 20.w,
                                  top: 10.w,
                                  bottom: 10.w),
                              child: Text(e.toString(),
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
