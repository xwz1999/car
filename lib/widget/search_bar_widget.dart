import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button/cloud_back_button.dart';

typedef TextCallback = Function(String text);

class SearchBarWidget extends StatefulWidget {
  final TextCallback callback;
  final Widget title;
  final String tips;

  const SearchBarWidget({Key? key, required this.callback, required this.title, required this.tips}) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {

  late TextEditingController _editingController;
  String _searchText = "";
  late FocusNode _contentFocusNode;
  late bool _show = false;

  @override
  void initState() {
    super.initState();
    _contentFocusNode = FocusNode();
    _editingController = TextEditingController();
  }

  @override
  void dispose() {
    _editingController.dispose();
    _contentFocusNode.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CloudBackButton(
            isSpecial: true,
          ),

          _show? SizedBox(
            width: 500.w,
            height: 72.w,
            child: TextField(
              keyboardType: TextInputType.text,
              onEditingComplete: () {
                setState(() {});
                // _refreshController.callRefresh();
              },
              focusNode: _contentFocusNode,
              onChanged: (text) {
                _searchText = text;
                setState(() {});
              },
              onTap: () {},
              onSubmitted: (_submitted) async {
                if (TextUtils.isEmpty(_searchText)) return;

                _contentFocusNode.unfocus();
                _searchText = _searchText.trimLeft();
                _searchText = _searchText.trimRight();

                widget.callback(_searchText);

                setState(() {});
              },
              style: TextStyle(
                textBaseline: TextBaseline.ideographic,
                fontSize: 32.sp,
                color: Colors.black,
              ),
              controller: _editingController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20.w),
                filled: true,
                fillColor: const Color(0xFFF6F6F6)      ,
                hintText: widget.tips,
                hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
                prefixIcon:  const Icon(
                  CupertinoIcons.search,
                  size: 16,
                ),

                suffixIcon:_searchText.isNotEmpty? GestureDetector(
                  onTap: (){
                    _searchText  = '';
                    _editingController.text = '';
                    setState(() {

                    });
                  },
                  child: Container(
                    width: 32.w,height: 32.w,
                    alignment: Alignment.center,
                    child: Image.asset(Assets.icons.icClose.path,width: 32.w,height: 32.w,)
                  ),
                ):const SizedBox(),
                enabledBorder: UnderlineInputBorder(
                  //
                  // 不是焦点的时候颜色
                  borderRadius: BorderRadius.circular(36.w),
                  borderSide: const BorderSide(
                    color: kForeGroundColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  // 焦点集中的时候颜色
                  borderRadius: BorderRadius.circular(36.w),
                  borderSide: const BorderSide(color: kForeGroundColor),
                ),
                //border: InputBorder.none,
              ),
            ),
          ):Expanded(
            child: widget.title,
          ),
          30.wb,

          _show? GestureDetector(
            onTap: () {
              _show = false;
              setState(() {});
            },
            child: Text('取消',
                style: TextStyle(
                    color: BaseStyle.color111111,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp)),
          ):GestureDetector(
            onTap: () {
              _show = true;

              setState(() {});
            },
            child: Image.asset(Assets.icons.mainSearch.path,
                height: 48.w, width: 48.w),
          ),
          20.wb,
        ],
      ),
    );
  }
}
