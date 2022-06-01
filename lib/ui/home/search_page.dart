import 'package:cloud_car/ui/home/search_result_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/hive_store.dart';
import 'package:cloud_car/utils/text_utils.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widget/button/cloud_back_button.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> _searchHistory = [];

  ///搜索记录列表

  List<dynamic>? data;
  late FocusNode _contentFocusNode;
  // late EasyRefreshController _refreshController;
  late TextEditingController _editingController;
  String _searchText = "";
  @override
  void initState() {
    super.initState();
    _contentFocusNode = FocusNode();
    _editingController = TextEditingController();
    getSearchListFromSharedPreferences();
  }

  @override
  void dispose() {
    _editingController.dispose();
    _contentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CloudScaffold(
      systemStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      bodyColor: kForeGroundColor,
      appbar: _getAppbar(),
      extendBody: true,
      body: Column(
        children: [_hotListWidget()],
      ),
    );
  }

  _getAppbar() {
    return Container(
      color: Colors.transparent,
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CloudBackButton(
            isSpecial: true,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36.w),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0.w),
                  blurRadius: 10.w,
                  color: const Color(0x33027AFF),
                )
              ],
            ),
            width: 542.w,
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
              onSubmitted: (submitted) async {
                if (TextUtils.isEmpty(_searchText)) return;

                _contentFocusNode.unfocus();
                _searchText = _searchText.trimLeft();
                _searchText = _searchText.trimRight();
                remember();
                saveSearchListToSharedPreferences(_searchHistory);

                Get.to(()=>SearchResultPage(keyWords: _searchText,));

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
                fillColor: Colors.white,
                hintText: "请输入想要搜索的内容...",
                hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  size: 16,
                ),
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
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(36.w),
                    borderSide: const BorderSide(color: kForeGroundColor)),
              ),
            ),
          ),
          12.wb,
          GestureDetector(
            onTap: () {
              if (TextUtils.isEmpty(_searchText)) return;
              _contentFocusNode.unfocus();
              _searchText = _searchText.trimLeft();
              _searchText = _searchText.trimRight();
              remember();
              saveSearchListToSharedPreferences(_searchHistory);
              Get.to(()=>SearchResultPage(keyWords: _searchText,));

              setState(() {});
            },
            child: Text('搜索',
                style: TextStyle(
                    color: BaseStyle.color111111,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp)),
          ),
          20.wb,
        ],
      ),
    );
  }

  ///搜索记录

  ///保存搜索记录
  remember() {
    if (_searchHistory.contains(_searchText)) {
      _searchHistory.remove(_searchText);
      List<String> list = [_searchText];
      list.addAll(_searchHistory);
      _searchHistory = list;
    } else {
      List<String> list = [_searchText];
      list.addAll(_searchHistory);
      _searchHistory = list;
      while (_searchHistory.length > 15) {
        _searchHistory.removeLast();
      }
    }
    saveSearchListToSharedPreferences(_searchHistory);
    setState(() {});
  }

  _hotListWidget() {
    List<Widget> choiceChipList = [];
    if (_searchHistory.isNotEmpty) {
      for (var text in _searchHistory) {
        choiceChipList.add(Padding(
          padding: const EdgeInsets.only(right: 5, bottom: 5),
          child: ChoiceChip(
            backgroundColor: BaseStyle.colorf6f6f6,
            // disabledColor: Colors.blue,
            labelStyle: TextStyle(fontSize: 15 * 2.sp, color: Colors.black),
            labelPadding: const EdgeInsets.only(left: 16, right: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              //side: BorderSide(color: Colors.black, width: 0.5),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onSelected: (bool value) {
              _editingController.text = text;
              setState(() {});
              FocusManager.instance.primaryFocus!.unfocus();
            },
            label: Text(text),
            selected: false,
          ),
        ));
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        36.hb,
        Container(
            margin: const EdgeInsets.only(left: 15, bottom: 5),
            child: Row(
              children: <Widget>[
                Text(
                  '历史搜索',
                  style: TextStyle(
                      color: BaseStyle.color333333,
                      fontSize: BaseStyle.fontSize32,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                36.wb,
              ],
            )),
        10.hb,
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Wrap(
            children: choiceChipList,
          ),
        ),
        // Spacer()
        24.hb,
      ],
    );
  }

  ///获取搜索记录
  getSearchListFromSharedPreferences() async {
    _searchHistory = HiveStore.appBox!.get("userSearhHistory}") ?? [];
    if (_searchHistory.isEmpty) {
      _searchHistory = [];
    }
    setState(() {});
  }

  ///保存搜索记录 通过用户id保存
  saveSearchListToSharedPreferences(List<String> value) async {
    HiveStore.appBox!.put("userSearhHistory", value);
  }
}
