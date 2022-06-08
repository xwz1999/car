import 'package:cloud_car/model/user/handbook_model.dart';
import 'package:cloud_car/ui/user/interface/manuals_func.dart';
import 'package:cloud_car/ui/user/product_manuals/product_manuals_info_page.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';

class ProductManuals extends StatefulWidget {
  const ProductManuals({super.key});

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
        title: Text('产品手册', style: Theme.of(context).textTheme.headline4),
//leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: bodyColor,
      body: Column(
        children: [
          ///搜索框
          Container(
            width: 750.w,
            height: 96.w,
            color: Colors.white,
            child: _search(),
          ),

          ///列表
          Expanded(
              child: EasyRefresh(
            firstRefresh: true,
            header: MaterialHeader(),
            footer: MaterialFooter(),
            controller: _easyRefreshController,
            onRefresh: () async {
              _refresh();
              setState(() {});
            },
            child: ListView.builder(
              itemBuilder: (context, index) {
                return getList(productManuals[index]);
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
          child: Text('取消', style: Theme.of(context).textTheme.bodyText2),
        ),
        20.wb,
      ],
    );
  }

  getList(HandbookModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        40.hb,
        getTitle(model.name),
        24.hb,
        ...model.items != null
            ? model.items!.mapIndexed((e, index) {
                return GestureDetector(
                    onTap: () {
                      Get.to(() => HandbookInfoPage(
                            //manualsBack: (int id) {},
                            itemId: e.id,
                            name: e.name,
                          ));
                    },
              child: getText(
                        e.name,
                        DateUtil.formatDateMs(e.updatedAt.toInt() * 1000,
                            format: 'yyyy-MM-dd')));
              }).toList()
            : []
        //ListView.builder(itemBuilder: (context, index) {})
        //_getText('销售更多服务', '2021-12-01')
      ],
    );
  }

  getText(String text, String time) {
    return Container(
        width: 750.w,
        height: 92.h,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const Spacer(),
            Text(
              time,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: BaseStyle.color999999),
            )
          ],
        )

        // ListTile(
        // title: Text(
        // text,
        // style: Theme
        //     .of(context)
        //     .textTheme
        //     .subtitle2,
        //   ),
        //   trailing: Text(
        //     time,
        //     style: Theme.of(context)
        //         .textTheme
        //         .subtitle2
        //         ?.copyWith(color: BaseStyle.color999999),
        //   ),
        // ),
        );
  }

  getTitle(String title) {
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
