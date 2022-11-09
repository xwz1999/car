import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/picker/car_picker_box.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPickBody extends StatefulWidget {
  final DateTime initDate;
  final DateTime lastDate;

  const CalenderPickBody(
      {super.key, required this.initDate, required this.lastDate});

  @override
  _CalenderPickBodyState createState() => _CalenderPickBodyState();
}

class _CalenderPickBodyState extends State<CalenderPickBody> {
  late final PageController _pageController;
  final ValueNotifier<DateTime> _focusDay = ValueNotifier(DateTime.now());
  DateTime? _selectDay;
  DateTime? _startDay;
  DateTime? _endDay;
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return CarPickerBox(
      height: 800.w,
      title: '选择日期',
      onPressed: (){
        Get.back(result: _selectDay);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          SizedBox(
            height: 100.w,
            child: ValueListenableBuilder<DateTime>(
              valueListenable: _focusDay,
              builder: (context, value, _) {
                return _CalendarHeader(
                  focusedDay: value,
                  onTodayButtonTap: () {
                    setState(() => _focusDay.value = DateTime.now());
                  },
                  onLeftArrowTap: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );

                  },
                  onRightArrowTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }, onRight1ArrowTap: () {
                  _pageController.jumpToPage( _pageController.page!.toInt()+12);
                }, onLeft1ArrowTap: () {
                  _pageController.jumpToPage( _pageController.page!.toInt()-12);
                },
                );
              },
            ),
          ),
          SizedBox(
            height: 500.w,
            child: TableCalendar(
              locale: 'zh',
              firstDay: widget.initDate,
              lastDay: widget.lastDate,
              focusedDay: _focusDay.value,
              currentDay: DateTime.now(),
              daysOfWeekHeight:50.w,
              rangeStartDay: _startDay,
              rangeEndDay: _endDay,
              headerVisible: false,
              shouldFillViewport: true,
              onCalendarCreated: (controller) => _pageController = controller,
              availableCalendarFormats: const {
                CalendarFormat.month: '月份',
                // CalendarFormat.twoWeeks: '2'
              },
              onDaySelected: (selectDay, focusDay) {
                setState(() {
                  _selectDay = selectDay;
                  _focusDay.value = focusDay;
                });
              },
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectDay, day);
              },
              onPageChanged: (focusedDay) {
                _focusDay.value = focusedDay;
              },

            ),
          ),
        ],
      ),
    );
  }
}


class _CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;

  final VoidCallback onLeft1ArrowTap;
  final VoidCallback onRight1ArrowTap;
  final VoidCallback onTodayButtonTap;

  const _CalendarHeader({
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onTodayButtonTap,
    required this.onLeft1ArrowTap,
    required this.onRight1ArrowTap,
  });

  @override
  Widget build(BuildContext context) {
    final yearText = '${DateUtil.formatDate(focusedDay, format: 'yyyy')}年';
    final monthText = '${DateUtil.formatDate(focusedDay, format: 'MM')}月';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: onLeft1ArrowTap,
            iconSize: 40.w,
          ),
          Padding(
            padding:  EdgeInsets.only(top: 5.w),
            child: Container(
              width: 120.w,
              alignment: Alignment.center,
              child: Text(
                yearText,
                style: TextStyle(fontSize: 35.sp),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: onRight1ArrowTap,
            iconSize: 40.w,
          ),


          100.wb,

          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: onLeftArrowTap,
            iconSize: 40.w,
          ),
          Padding(
            padding:  EdgeInsets.only(top: 5.w),
            child: Container(
              alignment: Alignment.center,
              width: 100.w,
              child: Text(
                monthText,
                style: TextStyle(fontSize: 35.sp),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            iconSize: 40.w,
            onPressed: onRightArrowTap,
          ),

        ],
      ),
    );
  }
}
