import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

typedef ItemCallback = Function(ChooseItem item, int index);

class ChooseItem {
  String name;
  bool isChoose;

  ChooseItem({
    required this.name,
    this.isChoose = false,
  });
}

class SortWidget extends StatelessWidget {
  final List<ChooseItem> itemList;
  final ItemCallback callback;

  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final bool haveButton;
  final bool isGrid;
  final String pickString;

  const SortWidget(
      {super.key,
      required this.itemList,
      required this.callback,
      required this.crossAxisCount,
      required this.mainAxisSpacing,
      required this.crossAxisSpacing,
      required this.childAspectRatio,
      this.haveButton = false,
      this.isGrid = true,
      required this.pickString});

  @override
  Widget build(BuildContext context) {
    return isGrid
        ? GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 20.w),
            itemCount: itemList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //横轴元素个数
                crossAxisCount: crossAxisCount,
                //纵轴间距
                mainAxisSpacing: mainAxisSpacing,
                //横轴间距
                crossAxisSpacing: crossAxisSpacing,
                //子组件宽高长度比例
                childAspectRatio: childAspectRatio),
            itemBuilder: (BuildContext context, int index) {
              return _getItem(itemList[index], index);
            })
        : ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return _getListItem(itemList[index], index);
            },
            itemCount: itemList.length,
          );
  }

  _getListItem(ChooseItem item, int index) {
    return GestureDetector(
      onTap: () {
        callback(item, index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.w),
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pickString == item.name
                ? Image.asset(
                    Assets.icons.sortChoose.path,
                    width: 30.w,
                    height: 30.w,
                    fit: BoxFit.fill,
                  )
                : const SizedBox(),
            10.wb,
            Text(
              item.name,
              style: TextStyle(
                  color: pickString == item.name
                      ? kPrimaryColor
                      : BaseStyle.color333333,
                  fontWeight: pickString == item.name
                      ? FontWeight.bold
                      : FontWeight.normal,
                  fontSize: BaseStyle.fontSize30),
            ),
            10.wb,
            pickString == item.name ? 30.wb : const SizedBox(),
          ],
        ),
      ),
    );
  }

  _getItem(ChooseItem item, int index) {
    return GestureDetector(
      onTap: () {
        callback(item, index);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: pickString == item.name
                ? const Color(0x1A027AFF)
                : const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(4.w),
            border: !(pickString == item.name)
                ? Border.all(color: Colors.transparent, width: 1.w)
                : Border.all(color: const Color(0xFF027AFF), width: 1.w)),
        child: Text(
          item.name,
          style: TextStyle(
              color: pickString == item.name
                  ? kPrimaryColor
                  : BaseStyle.color333333,
              fontSize: BaseStyle.fontSize24),
        ),
      ),
    );
  }
}
