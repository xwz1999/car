import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef ItemCallback = Function(ChooseItem item,int index);
class ChooseItem{
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

  const SortWidget({Key? key,
    required this.itemList,
    required this.callback,
    required this.crossAxisCount,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
    required this.childAspectRatio, this.haveButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
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

              return _getItem(itemList[index],
                  index);
            }


    );
  }

  _getItem(ChooseItem item,int index){
    return GestureDetector(
      onTap: (){
        callback(item,index);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: item.isChoose?const Color(0x1A027AFF):const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(4.w),
          border: !item.isChoose?Border.all(color: Colors.transparent,width: 1.w):Border.all(color: Color(0xFF027AFF),width: 1.w)
        ),
        child: Text(
          item.name,style: TextStyle(
          color: item.isChoose?kPrimaryColor:BaseStyle.color333333,fontSize: BaseStyle.fontSize24
        ),
        ),
      ),
    );
  }


}
