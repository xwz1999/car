import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_back_button.dart';
import 'package:flutter/material.dart';

import 'customer_item.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  List<dynamic>? data;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('客户付款',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: const Color(0xFFF6F6F6),
      extendBody: true,
      body: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 16.w),
          // padding: EdgeInsets.only(top: 10.w),
          itemBuilder: (context, index) {
            return const CustomerItem();
          },
          separatorBuilder: (_, __) {
            return SizedBox(
              height: 16.w,
            );
          },
          itemCount: 6),
    );
  }
}
