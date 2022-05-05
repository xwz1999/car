import 'package:cloud_car/ui/home/sort/search_customer_param_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/sort_list_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ItemCallback = Function(ChooseItem item);

class UserSortListPage extends StatefulWidget {
  final ValueNotifier<SearchCustomerParamModel> pickSort;
  final VoidCallback onConfirm;

  const UserSortListPage({
    Key? key,
    required this.onConfirm,
    required this.pickSort,
  }) : super(key: key);

  @override
  _UserSortListPageState createState() => _UserSortListPageState();
}

class _UserSortListPageState extends State<UserSortListPage> {
  List<ChooseItem> _gearbox = [];

  List<ChooseItem> _followTime = [];

  List<ChooseItem> _registerTime = [];

  @override
  void initState() {
    super.initState();

    _gearbox = [
      ChooseItem(name: '是'),
      ChooseItem(name: '否'),
    ];

    _followTime = [
      ChooseItem(name: '全部'),
      ChooseItem(name: '今天'),
      ChooseItem(name: '昨天'),
      ChooseItem(name: '近3天'),
      ChooseItem(name: '近5天'),
      ChooseItem(name: '7天以上'),
    ];

    _registerTime = [
      ChooseItem(name: '全部'),
      ChooseItem(name: '今天'),
      ChooseItem(name: '昨天'),
      ChooseItem(name: '近3天'),
      ChooseItem(name: '近5天'),
      ChooseItem(name: '7天以上'),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 100.w),
          children: [
            SortListWidget(
              itemList: _gearbox,
              childAspectRatio: 144 / 56,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 24.w,
              crossAxisCount: 4,
              callback: (ChooseItem item) {
                widget.pickSort.value.isImportant = item.name;
                setState(() {});
                // widget.callback(item);
              },
              title: '重要客户',
              pickString: widget.pickSort.value.isImportant,
            ),
            16.hb,
            SortListWidget(
              itemList: _followTime,
              childAspectRatio: 144 / 56,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 24.w,
              crossAxisCount: 4,
              callback: (ChooseItem item) {
                widget.pickSort.value.trailDate = item.name;
                setState(() {});
              },
              title: '跟进时间',
              pickString: widget.pickSort.value.trailDate,
            ),
            16.hb,
            SortListWidget(
              itemList: _registerTime,
              childAspectRatio: 144 / 56,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 24.w,
              crossAxisCount: 4,
              callback: (ChooseItem item) {
                widget.pickSort.value.createdDate = item.name;
                setState(() {});
              },
              title: '注册时间',
              pickString: widget.pickSort.value.createdDate,
            ),
            16.hb,
          ],
        ),
        Positioned(
            bottom: 40.w,
            left: 30.w,
            child: Row(
              children: [
                _resetBtn(),
                40.wb,
                _confirmBtn(),
              ],
            ))
      ],
    );
  }

  _confirmBtn() {
    return GestureDetector(
      onTap: widget.onConfirm,
      child: Container(
        width: 300.w,
        padding: EdgeInsets.symmetric(vertical: 16.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: <Color>[
              Color(0xFF0593FF),
              Color(0xFF027AFF),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
        ),
        child: Text(
          '确  定',
          style: TextStyle(
              color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
        ),
      ),
    );
  }

  _resetBtn() {
    return GestureDetector(
      onTap: () {
        widget.pickSort.value.isImportant = '';
        widget.pickSort.value.trailDate = '';
        widget.pickSort.value.createdDate = '';
        setState(() {});
      },
      child: Container(
        width: 240.w,
        padding: EdgeInsets.symmetric(vertical: 16.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
        ),
        child: Text(
          '重  置',
          style:
              TextStyle(color: kPrimaryColor, fontSize: BaseStyle.fontSize28),
        ),
      ),
    );
  }
}
