import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class ChooseTimeWidget extends StatefulWidget {

  final Function(String) callBack;
  final String first;
  final String second;


  const ChooseTimeWidget({super.key, required this.callBack, required this.first, required this.second});

  @override
  _ChooseTimeWidgetState createState() => _ChooseTimeWidgetState();
}

class _ChooseTimeWidgetState extends State<ChooseTimeWidget> {
  late bool chooseOne = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        chooseOne = !chooseOne;
        if(chooseOne){
          widget.callBack(widget.first);

        }else{
          widget.callBack(widget.second);
        }
        setState(() {
        });
      },
      child: Row(
        children: [
          Container(
            width: 56.w,
            height: 56.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: chooseOne? Theme.of(context).primaryColor:Colors.white,
                borderRadius: BorderRadius.horizontal(left: Radius.circular(4.w)),
                border: !chooseOne?Border.all(width: 2.w,color:Theme.of(context).primaryColor ):const Border()
            ),
            child: Text(
              widget.first,
              style: TextStyle(
                  color: chooseOne?Colors.white:Theme.of(context).primaryColor,fontSize: 28.sp
              ),
            ),
          ),
          Container(
            width: 56.w,
            height: 56.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: !chooseOne? Theme.of(context).primaryColor:Colors.white,
                borderRadius: BorderRadius.horizontal(right: Radius.circular(4.w)),
                border: chooseOne?Border.all(width:2.w,color:Theme.of(context).primaryColor ):const Border()
            ),
            child: Text(
              widget.second,
              style: TextStyle(
                  color: !chooseOne?Colors.white:Theme.of(context).primaryColor,fontSize: 28.sp
              ),
            ),
          )
        ],
      ),
    );
  }
}
