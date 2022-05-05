import 'package:cloud_car/model/user/Handbook_model.dart';
import 'package:cloud_car/ui/user/interface/manuals_func.dart';
import 'package:cloud_car/ui/user/product_manuals/product_manuals_info.dart';

import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';

class ProductManuals extends StatefulWidget {
  const ProductManuals({Key? key}) : super(key: key);

  @override
  State<ProductManuals> createState() => _ProductManualsState();
}

class _ProductManualsState extends State<ProductManuals> {
  List<HandbookModel> productManuals = [];
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _easyRefreshController.dispose();
  }

  _refresh() async {
    productManuals = await ManualsFunc.getHandbookAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('产品手册',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),

        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: bodyColor,
      body: Column(
        children: [
          Container(
            width: 750.w,
            height: 96.w,
            color: Colors.white,
            child: _search(),
          ),
          Expanded(
              child: EasyRefresh(
            firstRefresh: true,
            header: MaterialHeader(),
            footer: MaterialFooter(),
            controller: _easyRefreshController,
            onRefresh: () async {
              _refresh();
            },
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _getList(productManuals[index]);
              },
              itemCount: productManuals.length,
            ),
          ))
        ],
      ),
    );
  }

  _search() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        32.wb,
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36.w),
              border: Border.all(width: 2.w, color: const Color(0xFFE7E7E7))),
          width: 606.w,
          height: 72.w,
          child: TextField(
            keyboardType: TextInputType.text,
            // onEditingComplete: () {
            //   setState(() {});
            //   // _refreshController.callRefresh();
            // },
            // // focusNode: _contentFocusNode,

            onTap: () {},

            style: TextStyle(
              textBaseline: TextBaseline.ideographic,
              fontSize: 32.sp,
              color: Colors.black,
            ),
            // controller: _editingController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20.w, bottom: 10.w),
              filled: true,
              fillColor: Colors.white,
              hintText: "请输入员工名称",
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
          onTap: () {},
          child: Text('取消',
              style: TextStyle(color: BaseStyle.color333333, fontSize: 28.sp)),
        ),
        20.wb,
      ],
    );
  }

  _getList(HandbookModel model) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          40.hb,
          _getTItle(model.name),
          24.hb,
          ...model.items != null
              ? model.items!.mapIndexed((e, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(() => HandbookInfo(
                              //manualsBack: (int id) {},
                              itemId: e.id,
                              name: e.name,
                            ));
                      },
                      child: _getText(
                          e.name,
                          DateUtil.formatDateMs(e.updatedAt.toInt() * 1000,
                              format: 'yyyy-MM-dd')));
                }).toList()
              : []
          //ListView.builder(itemBuilder: (context, index) {})
          //_getText('销售更多服务', '2021-12-01')
        ],
      ),
    );
  }

  _getText(String text, String time) {
    return Container(
      width: 750.w,
      height: 92.w,
      color: Colors.white,
      child: ListTile(
        minVerticalPadding: 32.w,
        title: Text(
          text,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        trailing: Text(
          time,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: BaseStyle.color999999),
        ),
      ),
    );
  }

  _getTItle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 32.w),
      child: Text(
        title,
        style: TextStyle(
            fontSize: BaseStyle.fontSize32,
            color: const Color(0xFF110000),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
