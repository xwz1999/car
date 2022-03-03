import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef ItemCallback = Function(String item);
class ChooseItem{
  String name;
  bool isChoose;

  ChooseItem({
    required this.name,
    this.isChoose = false,
  });

}


class ScreenWidget extends StatefulWidget {
  final List<ChooseItem> itemList;
  final ItemCallback callback;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final bool haveButton;

  const ScreenWidget({Key? key,
    required this.itemList,
    required this.callback,
    required this.crossAxisCount,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
    required this.childAspectRatio, this.haveButton = false})
      : super(key: key);

  @override
  _ScreenWidgetState createState() =>
      _ScreenWidgetState();
}


class _ScreenWidgetState extends State<ScreenWidget> {
  late ValueNotifier<List<ChooseItem>> _valueNotifier;
  late String _chooseItem ='';

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier(widget.itemList);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 20.w),
            itemCount: widget.itemList.length,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //横轴元素个数
                crossAxisCount: widget.crossAxisCount,
                //纵轴间距
                mainAxisSpacing: widget.mainAxisSpacing,
                //横轴间距
                crossAxisSpacing: widget.crossAxisSpacing,
                //子组件宽高长度比例
                childAspectRatio: widget.childAspectRatio),
            itemBuilder: (BuildContext context, int index) {

              return _getItem(widget.itemList[index],
                  index);
            }),
        48.hb,
        widget.haveButton?_confirmBtn():const SizedBox(),
        40.hb,
      ],
    );
  }

  _getItem(ChooseItem item,int index){
    return GestureDetector(
      onTap: (){
        for(int i=0;i<widget.itemList.length;i++){
          if(i!=index){
            widget.itemList[i].isChoose = false;
          }else{
            widget.itemList[i].isChoose = !widget.itemList[i].isChoose;
          }
        }
        _chooseItem = item.name;
        if (kDebugMode) {
          print(item.name);
        }
        setState(() {

        });
        widget.callback(_chooseItem);
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


  _confirmBtn(){
    return GestureDetector(
      onTap: (){
        if(_chooseItem.isNotEmpty){
          widget.callback(_chooseItem);
        }else{
          BotToast.showText(text: '请先选择一个区间分类');
        }

      },
      child: Container(
        width: double.infinity,
          padding: EdgeInsets.symmetric(vertical:16.w ),
          alignment: Alignment.center,
          margin: EdgeInsets.only(left:32.w,right: 32.w ),
          decoration:  BoxDecoration(
              gradient:const LinearGradient(
                colors: <Color>[
                  Color(0xFF0593FF),
                  Color(0xFF027AFF),
                ],
              ),
            borderRadius: BorderRadius.all(Radius.circular(8.w)),
          ),
        child: Text(
          '确  定',style: TextStyle(
          color: kForeGroundColor,fontSize: BaseStyle.fontSize28
        ),
        ),
      ),
    );
  }


}
